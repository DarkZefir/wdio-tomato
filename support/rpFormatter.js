const { Formatter, Status } = require(`@cucumber/cucumber`);
const RPClient = require(`@reportportal/client-javascript`);
const Queue = require(`queue-promise`);
const logger = require(`../config/logger.config`).logger;
const path = require(`path`);
class RPFormatter extends Formatter {
	launchId = null;

	constructor(options) {
		super(options);
		options.eventBroadcaster.on(`envelope`, this.processEnvelope.bind(this));
		const rpConfig = require(path.join(options.cwd, options.parsedArgvOptions.rpconfig));
		this.rpConfig = rpConfig;
		if (options.parsedArgvOptions.launch) {
			this.rpConfig.launch = options.parsedArgvOptions.launch;
		}
		this.rpClient = new RPClient(rpConfig);
		this.queue = new Queue({
			concurrent: 1,
			interval: 100,
		});
		this.queue.on(`reject`, error => logger.error(`Error at Report Portal: ${error.message}`));
	}

	async processEnvelope(envelope) {
		if (envelope.testRunStarted) {
			this.queue.enqueue(() => this.startLaunch());
		} else if (envelope.testRunFinished) {
			this.queue.enqueue(() => this.finishLaunch());
		} else if (envelope.testCaseFinished) {
			this.finishTest(envelope);
		}
	}

	async startLaunch() {
		const launchObj = this.rpClient.startLaunch({
			name: this.rpConfig.launch,
			startTime: this.rpClient.helpers.now(),
			description: this.rpConfig.description,
			attributes: this.rpConfig.tags
		});

		this.launchId = launchObj.tempId;
		this.features = {};
		await launchObj.promise;
	}

	async finishLaunch() {
		for (const featureName in this.features) {
			await this.rpClient.finishTestItem(this.features[featureName], { status: `PASSED` }).promise;
		}

		await this.rpClient.finishLaunch(this.launchId, {
			endTime: this.rpClient.helpers.now()
		}).promise;
	}

	finishTest(envelope) {
		const testCase = this.eventDataCollector.getTestCaseAttempt(envelope.testCaseFinished.testCaseStartedId);
		logger.debug(`Sending results for [${testCase.pickle.name}]`);
		const featureName = testCase.gherkinDocument.feature.name;
		if (!this.features[featureName]) {
			const featureItem = this.rpClient.startTestItem({
				description:
					this.formatTags(testCase.gherkinDocument.feature.tags) +
					`\n` +
					testCase.gherkinDocument.feature.description,
				name: featureName,
				startTime: this.rpClient.helpers.now(),
				type: `SUITE`
			}, this.launchId);
			this.features[featureName] = featureItem.tempId;
			this.queue.enqueue(() => featureItem.promise);
		}

		const featureTempId = this.features[featureName];
		// Start test item
		const testItem = this.rpClient.startTestItem({
			description: this.formatTags(testCase.pickle.tags),
			name: testCase.pickle.name,
			startTime: this.rpClient.helpers.now(),
			type: `STEP`
		}, this.launchId, featureTempId);
		this.queue.enqueue(() => testItem.promise);

		// send steps
		const steps = this.getStepResults(testCase);
		for (const step of steps) {
			const attachment = step.attachment && step.attachment[0]
				? {
					name: `attachment`,
					type: step.attachment[0].mediaType,
					content: step.attachment[0].body
				}
				: undefined;
			this.queue.enqueue(() => this.rpClient.sendLog(testItem.tempId, {
				level: step.result.status === Status.PASSED
					? `INFO`
					: `ERROR`,
				message: this.getMessage(step),
				time: this.rpClient.helpers.now()
			}, attachment).promise);
		}

		// finish test item
		const status = Object.values(testCase.stepResults).some(step => step.status !== Status.PASSED)
			? Status.FAILED.toLowerCase()
			: Status.PASSED.toLowerCase();
		this.queue.enqueue(() => this.rpClient.finishTestItem(testItem.tempId, {
			status
		}).promise);
	}

	getStepResults(testCase) {
		return testCase.testCase.testSteps.map(step => ({
			result: testCase.stepResults[step.id],
			pickle: testCase.pickle.steps.find(pickle => pickle.id === step.pickleStepId),
			attachment: testCase.stepAttachments[step.id]
		}));
	}

	getMessage(step) {
		if (!step.pickle) return `Hook`;
		const messageParts = [step.pickle.text];
		if (step.pickle.argument) {
			if (step.pickle.argument.dataTable) messageParts.push(
				this.formatTable(step.pickle.argument.dataTable)
			);
			if (step.pickle.argument.docString) messageParts.push(this.formatDocString(step.pickle.argument.docString));
		}
		if (step.result.status === Status.FAILED) messageParts.push(step.result.message);

		return messageParts.join(`\n`);
	}

	formatTable(dataTable) {
		const TR = `<tr>`;
		const TRE = `</tr>`;
		const TD = `<td>`;
		const TDE = `</td>`;
		const formatRow = row => TR + row.cells.map(cell => TD + cell.value + TDE).join(``) + TRE;
		return `<table><tbody>` + dataTable.rows.map(formatRow).join(``) + `</tbody></table>`;
	}

	formatDocString(docString) {
		return `<pre><code>` + docString.content + `</code></pre>`;
	}

	formatTags(tags) {
		return tags.map(tag => `<code>` + tag.name + `</code>`).join(``);
	}
}

module.exports = RPFormatter;

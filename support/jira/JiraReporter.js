const {Formatter} = require(`@cucumber/cucumber`);
const xrayConverter = require(`./scripts/xrayConverter`);
const tagsExtractor = require(`./scripts/tagsExtractor`);
const jiraService = require(`./api/JiraService`);
const logger = require(`../../config/logger.config`).logger;
const EXECUTION = process.env.EXECUTION;
const TAGS = process.env.TAGS;
const UPLOAD_FROM_FILE = process.env.UPLOAD_FROM_FILE === `true`;

class JiraReporter extends Formatter {

	constructor(options) {
		super(options);
		this.jsonReportPath = options.parsedArgvOptions.jsonReportPath;
		this.xrayOutputPath = options.parsedArgvOptions.xrayOutputPath;
		options.eventBroadcaster.on(`envelope`, this.processEnvelope.bind(this));
	}

	async processEnvelope(envelope) {
		if (envelope.testRunStarted) {
			await this.startLaunch();
		} else if (envelope.testCaseFinished) {
			await this.finishTest(envelope);
		} else if (envelope.testRunFinished) {
			await this.finishLaunch();
		}
	}

	convertJsonToXray() {
		const startTime = Date.now();
		return new Promise((resolve, reject) => {
			const interval = setInterval(() => {
				if (Date.now() - startTime > 10000) {
					logger.error(`Couldn't generate an Xray report after 10 seconds.`);
					clearInterval(interval);
					reject();
				}
				try {
					xrayConverter(this.jsonReportPath, this.xrayOutputPath);
					logger.info(`Xray report generated at [${this.xrayOutputPath}]`);
					clearInterval(interval);
					resolve();
				} catch (e) {
					logger.debug(`Trying to convert [${this.jsonReportPath}]: ${e.message}`);
				}
			}, 500);
		});
	}

	getTestCaseId(testCase) {
		const tag = testCase.pickle.tags.find(tag => tag.name.includes(`@CU`));
		return tag ? tag.name.replace(`@`, ``) : ``;
	}

	getTestStatus(testCase) {
		const isFailed = Object.values(testCase.stepResults).some(step => step.status !== `PASSED`);
		return isFailed ? `FAIL` : `PASS`;
	}

	async updateTestResult(testCase, executionTag) {
		const testCaseId = this.getTestCaseId(testCase);
		if (testCaseId) {
			const allExecutionTags = await tagsExtractor.getTags(executionTag);
			const testObj = allExecutionTags.find(item => item.key === testCaseId);
			if (!testObj || (testObj.status === `TODO` || testObj.status === `PASS`)) {
				logger.info(`Sending results for ${testCaseId} test to Jira`);
				const data = [
					{
						testKey: testCaseId,
						status: this.getTestStatus(testCase)
					}
				];
				return jiraService.uploadExecutionResults(executionTag, data);
			}
		}
	}

	async startLaunch() {
		if (EXECUTION && TAGS) {
			const testsToClear = TAGS.match(/CU-\d+/g);
			if (testsToClear && testsToClear.length > 0) {
				logger.info(`Setting [${testsToClear}] in ${EXECUTION} execution in TODO status.`);
				const executionResults = testsToClear.map(tag => {
					return {
						testKey: tag,
						status: `TODO`
					};
				});
				await jiraService.uploadExecutionResults(EXECUTION, executionResults);
			}
		}
	}

	async finishTest(envelope) {
		const testCase = this.eventDataCollector.getTestCaseAttempt(envelope.testCaseFinished.testCaseStartedId);
		if (EXECUTION && !UPLOAD_FROM_FILE && !testCase.willBeRetried) {
			await this.updateTestResult(testCase, EXECUTION);
		}
	}

	async finishLaunch() {
		await this.convertJsonToXray();
		if (EXECUTION && UPLOAD_FROM_FILE) {
			const executionResults = require(this.xrayOutputPath).tests;
			await jiraService.uploadExecutionResults(EXECUTION, executionResults);
			logger.info(`Test results are uploaded to @${EXECUTION} execution.`);
		}
	}

}

module.exports = JiraReporter;

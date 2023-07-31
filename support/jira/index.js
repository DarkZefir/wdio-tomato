/* eslint-disable no-console */
const tagsExtractor = require(`./scripts/tagsExtractor`);
const stepsToXray = require(`./scripts/stepsToXray`);
const jiraService = require(`./api/JiraService`);
const fs = require(`fs`);
const path = require(`path`);

require(`yargs`)
	.command(`extract`, `extract jira tags from provided test execution`, yargs => {
		yargs.options(`ex`, { alias: `execution`, demand: true, desc: `Test Execution Tag`, type: `string`});
		yargs.options(`p`, { alias: `path`, demand: false, desc: `Path To JSON file with results`, type: `string`});
	}, yargs => {
		return tagsExtractor.prepareResults(yargs.execution, yargs.path);
	})
	.command(`upload`, `upload execution results from a file`, yargs => {
		yargs.options(`ex`, {alias: `execution`, demand: true, type: `string`, default: ``});
		yargs.options(`p`, {alias: `path`, demand: false, type: `string`, default: `./report/xray.json`});
	}, yargs => {
		const pathToReport = path.resolve(yargs.path);
		if (yargs.execution !== `` && fs.existsSync(pathToReport)) {
			console.log(`Uploading results to "${yargs.execution}" execution.`);
			const executionResults = require(pathToReport).tests;
			return jiraService.uploadExecutionResults(yargs.execution, executionResults);
		}
	})
	.command(`clear`, `set all tests in a jira test execution to TODO status`, yargs => {
		yargs.options(`ex`, { alias: `execution`, demand: true, desc: `Test Execution Tag`, type: `string` });
		yargs.options(`cl`, { alias: `clean`, demand: false, desc: `Clean execution boolean`, type: `boolean` });
	}, async yargs => {
		if (yargs.clean) {
			console.log(`Cleaning "${yargs.execution}" execution.`);
			const executionResults = await tagsExtractor.getClearExecutionResults(yargs.execution);
			return jiraService.uploadExecutionResults(yargs.execution, executionResults);
		}
	})
	.command(`update-steps`, `update steps in all scenarios from a directory`, yargs => {
		yargs.options(`p`, { alias: `path`, demand: true, desc: `Path to feature files`, type: `string` });
	}, async yargs => {
		console.log(`Uploading steps for scenarios from "${yargs.path}" folder.`);
		return stepsToXray.updateScenarios(yargs.path);
	})
	.command(`update`, `update tests in a jira test set`, yargs => {
		yargs.options(`p`, { alias: `path`, demand: true, desc: `Path to feature files`, type: `string` });
		yargs.options(`t`, { alias: `testSet`, demand: true, desc: `Jira test set id to update tests list in`, type: `string` });
	}, async yargs => {
		console.log(`Updating ${yargs.testSet} test set with tests from ${yargs.path}.`);
		await stepsToXray.updateTestSet(yargs.testSet, yargs.path);
	})
	.argv;

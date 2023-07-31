const fs = require(`fs`);
const jiraService = require(`../api/JiraService`);
const lodash = require(`lodash`);
const defaultTxtFilePath = `./tags.txt`;
const defaultJsonFilePath = `./finalJson.json`;

async function getTags(execution) {
	try {
		const numberOfPages = await jiraService.getNumberOfExecutionTestPages(execution);
		const arrayOfPromises = [];
		for (let index = 1; index <= numberOfPages; index++) {
			arrayOfPromises.push(jiraService.getTestsFromExecutionPage(execution, index));
		}
		const tagsArray = await Promise.all(arrayOfPromises);
		return lodash.flattenDeep(tagsArray);
	} catch (err) {
		// eslint-disable-next-line no-console
		console.log(err);
	}
}

function getTagsToRun(arrayOfTagsFromJira) {
	const tagsToRun = [];
	let stringOfTagsToRun = ``;
	arrayOfTagsFromJira.forEach(item => {
		if (item.status === `FAIL` || item.status === `TODO`) {
			tagsToRun.push(`@${item.key}`);
		}
	});
	stringOfTagsToRun = `"${tagsToRun.join(` or `)}"`;
	return stringOfTagsToRun;
}

function prepareResults(tag, jsonFilePath) {
	let stringOfTagsToRun;
	let givenJson;
	const finalJson = {};
	finalJson.tests = [];
	return getTags(tag).then(arrayOfTests => {
		stringOfTagsToRun = getTagsToRun(arrayOfTests);
		if (jsonFilePath) {
			givenJson = require(jsonFilePath);
			givenJson.tests.forEach(item => {
				if (stringOfTagsToRun.includes(item.testKey)) {
					finalJson.tests.push(item);
				}
			});
			fs.writeFileSync(defaultJsonFilePath, JSON.stringify(finalJson), `utf8`);
			// eslint-disable-next-line no-console
			console.log(`Saved xray report file: [${defaultJsonFilePath}]`);
		}
		fs.writeFileSync(defaultTxtFilePath, stringOfTagsToRun, `utf8`);
		// eslint-disable-next-line no-console
		return console.log(`Saved failed and todo jira tags string: [${defaultTxtFilePath}]`);
	});
}

async function getClearExecutionResults(executionTag) {
	const executionTags = await getTags(executionTag);
	return executionTags.map(tag => {
		return {
			testKey: tag.key,
			status: `TODO`
		};
	});
}

module.exports = {
	getTags,
	prepareResults,
	getClearExecutionResults,
};

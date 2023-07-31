/* eslint-disable no-console */
const featureFileParser = require(`./featureFileParser`);
const cliProgress = require(`cli-progress`);
const lodash = require(`lodash`);
const jiraService = require(`../api/JiraService`);

function getAllScenarios(pathToFeatures) {
	const featureFilesPaths = featureFileParser.readFeatureFiles(pathToFeatures);
	let allScenarios = [];
	featureFilesPaths.forEach(file => {
		const scenarios = featureFileParser.getScenarios(file);
		allScenarios = [...allScenarios, ...scenarios];
	});
	return allScenarios;
}

async function updateScenarios(pathToFeatures) {
	const progressBar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
	const scenarios = getAllScenarios(pathToFeatures);
	progressBar.start(scenarios.length, 0);
	for (const scenario of scenarios) {
		const tagNumber = scenario.match(/^-\d+/g);
		if (tagNumber) {
			await jiraService.updateTest({
				id: `CU${tagNumber[0]}`,
				type: {
					id: scenario.includes(`Outline`) ? `13894` : `13893`
				},
				steps: scenario.split(/Scenario.+\r\n/)[1]
			});
		}
		progressBar.increment();
	}
	progressBar.stop();
}

async function getArrayOfTestsFromTestSet(id) {
	const numberOfPages = await jiraService.getNumberOfTestSetTestPages(id);
	const arrayOfPromises = [];
	for (let i = 1; i <= numberOfPages; i++) {
		arrayOfPromises.push(jiraService.getTagsFromTestSetPage(id, i));
	}
	return lodash.flatten(await Promise.all(arrayOfPromises)).map(testObject => testObject.key);
}

async function updateTestSet(id, pathToFeatures) {
	const scenarios = getAllScenarios(pathToFeatures);
	const jiraTags = scenarios.map(scenario => {
		const tagNumber = scenario.match(/^-\d+/g);
		return tagNumber ? `CU${tagNumber[0]}` : ``;
	});
	const localJiraTags = lodash.uniq(jiraTags);
	const testSetJiraTags = await getArrayOfTestsFromTestSet(id);
	const tagsToAdd = localJiraTags.filter(tag => !testSetJiraTags.includes(tag));
	const tagsToRemove = testSetJiraTags.filter(tag => !localJiraTags.includes(tag));
	if (tagsToAdd.length === 0 && tagsToRemove.length === 0) {
		console.log(`Test set is already up to date`);
		return;
	}
	await jiraService.updateTestSet(id, tagsToAdd, tagsToRemove);
	console.log(`Successfully added ${tagsToAdd.length} and removed ${tagsToRemove.length} tests`);
}

module.exports = {
	updateScenarios,
	updateTestSet
};

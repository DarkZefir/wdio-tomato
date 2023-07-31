const fsextra = require(`fs-extra`);

function getJiraKey(tagsArray) {
	const jiraTagString = tagsArray.find(item => item.name.includes(`@CU`));
	return jiraTagString ? jiraTagString.name.replace(`@`, ``) : ``;
}

function getScenarioStatus(scenarioObject) {
	return scenarioObject.steps.every(step => step.result.status === `passed`) ? `PASS` : `FAIL`;
}

function getSessionComment(scenarioObject) {
	return `Status set by Automation: ${getScenarioStatus(scenarioObject)}`;
}

function formatOutlines(arrayOfResults) {
	let formattedResults = arrayOfResults;
	arrayOfResults.forEach(testObj => {
		const duplicatedResults = formattedResults.filter(test => test.testKey === testObj.testKey);
		if (duplicatedResults.length > 1) {
			formattedResults = formattedResults.filter(test => test.testKey !== testObj.testKey);
			const outlineObject = {
				testKey: testObj.testKey,
				status: duplicatedResults.every(test => test.status === `PASS`) ? `PASS` : `FAIL`,
				examples: duplicatedResults.map(test => test.status)
			};
			formattedResults.push(outlineObject);
		}
	});
	return formattedResults;
}

function convertToXray(fileToConvert, resultingFile) {
	const jsonToConvert = fsextra.readJSONSync(fileToConvert);
	const resultsJson = {
		tests: []
	};
	jsonToConvert.forEach(feature => {
		if (feature && feature.elements) {
			return feature.elements.forEach(scenario => {
				const id = getJiraKey(scenario.tags);
				if (id) {
					return resultsJson.tests.push({
						testKey: id,
						status: getScenarioStatus(scenario),
						comment: getSessionComment(scenario),
						evidences: [],
					});
				}
			});
		}
	});
	resultsJson.tests = formatOutlines(resultsJson.tests);
	return fsextra.writeFileSync(resultingFile, JSON.stringify(resultsJson), `utf8`);
}
module.exports = convertToXray;

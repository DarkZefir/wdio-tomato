const fs = require(`fs`);
const klawSync = require(`klaw-sync`);

/**
 * Reads all files in a directory and returns an array of paths to feature files
 *
 * @param {string} pathToFeatures
 * @return string[]
 */
function readFeatureFiles(pathToFeatures) {
	const listOfFiles = klawSync(pathToFeatures, {
		nodir: true
	});
	const featureFilesPaths = [];
	listOfFiles.forEach(file => {
		if (file.path.endsWith(`.feature`)) featureFilesPaths.push(file.path);
	});
	return featureFilesPaths;
}

/**
 * Reads a feature file and returns an array of scenarios
 *
 * @param {string} pathToFeature
 * @return string[]
 */
function getScenarios(pathToFeature) {
	const featureFile = fs.readFileSync(pathToFeature, `utf8`);
	const splitFeature = featureFile.split(/\n\s*@CU/);
	return splitFeature.filter(snippet => snippet.includes(`Scenario`));
}

module.exports = {
	readFeatureFiles,
	getScenarios
};

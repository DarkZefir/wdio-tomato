require(`./support/args`);
const {envTags} = require(`./memory`);
const suiteTags = require(`./config/testSets`);
const launchTags = process.env.TAGS;
const path = require(`path`);
const env = process.env.ENV ?? `DEFAULT`;
const suite = process.env.SUITE ?? `DEFAULT`;
const rpConfig = (suite, env) => `${env.toUpperCase()} ${suite.toUpperCase()}`;
const common = {
	parallel: 5,
	require: [
		`step_definition/*.js`
	],
	paths: [
		`feature/**/*.feature`
	],
	format: [
		`json:report/report.json`,
		`./support/jira/JiraReporter.js:./report/xray.json`
	],
	formatOptions: {
		jsonReportPath: path.resolve(`./report/report.json`),
		xrayOutputPath: path.resolve(`./report/xray.json`),
	},
	publishQuiet: true,
	tags: `${envTags}${suiteTags ? ` and (${suiteTags})` : ``}${launchTags ? ` and (${launchTags})` : ``}`
};
module.exports = {
	default: common,
	'ci': {
		...common,
		format: [
			...common.format,
			`./support/rpFormatter.js`,
		],
		formatOptions: {
			...common.formatOptions,
			rpconfig: `./config/rp.js`,
			launch: rpConfig(suite, env)
		},
	}
};
// eslint-disable-next-line no-console
console.log(`Running with tags: "${common.tags}"`);

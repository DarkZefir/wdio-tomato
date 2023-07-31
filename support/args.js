const yargs = require(`yargs/yargs`);

yargs().option(`tags`, {
	alias: `t`,
	type: `string`,
	description: `Tags for tests which should be run`,
	coerce: arg => {
		process.env.TAGS = arg;
	}
}).option(`env`, {
	alias: `e`,
	type: `string`,
	description: `Environment for running the tests`,
	coerce: arg => {
		process.env.ENV = arg;
	}
}).option(`suite`, {
	alias: `s`,
	type: `string`,
	description: `Suite of tests which should be run`,
	coerce: arg => {
		process.env.SUITE = arg;
	}
}).option(`execution`, {
	alias: `ex`,
	type: `string`,
	description: `ID of a Jira execution for sending test results`,
	coerce: arg => {
		process.env.EXECUTION = arg;
	}
}).option(`headless`, {
	alias: `h`,
	type: `boolean`,
	description: `Run tests in headless mode, true/false`,
	coerce: arg => {
		process.env.HEADLESS = arg;
	}
}).option(`baseUrl`, {
	alias: `bu`,
	type: `string`,
	description: `Run tests on a specific url`,
	coerce: arg => {
		process.env.BASE_URL = arg;
	}
}).parse(process.argv.slice(2).filter(arg => arg !== `--`));

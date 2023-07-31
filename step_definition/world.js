const { setWorldConstructor } = require(`@cucumber/cucumber`);
const logger = require(`../config/logger.config`).logger;

setWorldConstructor(class {
	constructor({ attach, parameters }) {
		this.attach = attach;
		this.parameters = parameters;
		this.logs = [];
	}

	info(message) {
		logger.info(message);
		this.logs.push({
			level: `INFO`,
			message: message
		});
	}

	debug(message) {
		logger.debug(message);
		this.logs.push({
			level: `DEBUG`,
			message: message
		});
	}

	warn(message) {
		logger.warn(message);
		this.logs.push({
			level: `WARN`,
			message: message
		});
	}

	error(message) {
		logger.error(message);
		this.logs.push({
			level: `ERROR`,
			message: message
		});
	}
});

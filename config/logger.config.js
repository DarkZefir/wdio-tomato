const winston = require(`winston`);
const {combine, timestamp, printf} = winston.format;

const customTemplate = printf(info => {
	return `[${process.env.CUCUMBER_WORKER_ID ?? 0}] [${info.timestamp}] ${info.level}: ${info.message}`;
});

const logger = winston.createLogger({
	level: `debug`,
	transports: [
		new winston.transports.Console({
			format: combine(
				timestamp({
					format: `YYYY-MM-DD HH:mm:ss`
				}),
				winston.format.colorize({
					all: true
				}),
				customTemplate
			),
			level: `info`
		}),
		new winston.transports.File({
			filename: `combined.log`,
			format: combine(
				timestamp({
					format: `YYYY-MM-DD HH:mm:ss`
				}),
				customTemplate
			),
			level: `debug`
		}),
	],
});

module.exports = {
	logger
};

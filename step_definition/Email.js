const { When, Then } = require(`@cucumber/cucumber`);
const memory = require(`@cucumber-e2e/memory2`);
const gmailUtils = require(`../support/gmailApi/gmailApi`);
const chai = require(`chai`);
const chaiExpect = chai.expect;
const stepFunctions = require(`../support/stepFunctions`);
const Logger = require(`../config/logger.config`).logger;
const EMAIL = `emailData`;
const EMAIL_VAR = `$` + EMAIL;

When(/^Delete all emails$/, async function () {
	this.info(`Delete all emails`);
	await gmailUtils.deleteAllEmails();
});

Then(/^I wait until email is delivered$/, {timeout: 120 * 1000}, async function () {
	this.info(`I wait until email is delivered`);
	const response = await gmailUtils.getEmailList();
	const startNumber = response ? response.length : 0;
	await browser.waitUntil(
		async () => {
			const currentResponse = await gmailUtils.getEmailList();
			const currentNumber = currentResponse ? currentResponse.length : 0;
			return currentNumber > startNumber;
		},
		{ timeout: stepFunctions.timeouts.EMAIL_DELIVER_LOAD_TIMEOUT,
			timeoutMsg: `Email has not been delivered`
		}
	);
	const emailList = await gmailUtils.getEmailList();
	const email = await gmailUtils.getEmail(emailList[0].id);
	memory.setValue(EMAIL, email);
});

Then(/^Content of email should (be equal to|contain) "(.+)" text$/, async function (validation, expectedContent) {
	const text = memory.getValue(expectedContent);
	const email = memory.getValue(EMAIL_VAR);
	this.info(`Content of email should ${validation} "${text}" text`);
	const parsedData = await gmailUtils.getEmailContent(email);
	switch (validation) {
	case `be equal to`: chaiExpect(parsedData).to.equal(text);
		break;
	case `contain`: chaiExpect(parsedData).to.include(text);
		break;
	default:
		throw new Logger.warn(`Validation ${validation} is not defined`);
	}
});

Then(/^Subject of email should (be equal to|contain) "(.+)" text$/, async function (validation, expectedSubject) {
	const text = memory.getValue(expectedSubject);
	const email = memory.getValue(EMAIL_VAR);
	this.info(`Subject of email should ${validation} "${text}" text`);
	const subject = await gmailUtils.getEmailSubject(email);
	switch (validation) {
	case `be equal to`: chaiExpect(subject).to.equal(text);
		break;
	case `contain`: chaiExpect(subject).to.include(text);
		break;
	default:
		throw new Error(`Validation ${validation} is not defined`);
	}
});

Then(/^Sender of email should (be equal to|contain) "(.+)" text$/, async function (validation, expectedText) {
	const text = memory.getValue(expectedText);
	const email = memory.getValue(EMAIL_VAR);
	const sender = await gmailUtils.getEmailSender(email);
	this.info(`Sender of email should ${validation} "${text}" text`);
	switch (validation) {
	case `be equal to`: chaiExpect(sender).to.equal(text);
		break;
	case `contain`: chaiExpect(sender).to.include(text);
		break;
	default:
		throw new Error(`Validation ${validation} is not defined`);
	}
});

Then(/^Receiver of email should (be equal to|contain) "(.+)" text$/, async function (validation, expectedText) {
	const text = memory.getValue(expectedText);
	const email = memory.getValue(EMAIL_VAR);
	const receiver = await gmailUtils.getEmailReceiver(email);
	this.info(`Receiver of email should ${validation} "${text}" text`);
	switch (validation) {
	case `be equal to`: chaiExpect(receiver).to.equal(text);
		break;
	case `contain`: chaiExpect(receiver).to.include(text);
		break;
	default:
		throw new Error(`Validation ${validation} is not defined`);
	}
});

Then(/^Email has attached file$/, async function () {
	const email = memory.getValue(EMAIL_VAR);
	const fileName = await gmailUtils.getNameOfAttachedFile(email);
	this.info(`Email has attached file`);
	chaiExpect(fileName.length > 0).to.be.true;
});

Then(/^Attached file has "(.+)" format$/, async function (expectedFormat) {
	const format = memory.getValue(expectedFormat);
	const email = memory.getValue(EMAIL_VAR);
	const formatFile = await gmailUtils.getFormatOfAttachedFile(email);
	this.info(`Attached file has "${format}" format`);
	chaiExpect(formatFile).to.equal(`application/` + format);
});
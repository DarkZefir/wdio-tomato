const { When } = require(`@cucumber/cucumber`);
const { po } = require(`@cucumber-e2e/po2`);
const memory = require(`@cucumber-e2e/memory2`);
const stepFunctions = require(`../support/stepFunctions`);
const { timeouts } = require(`../support/stepFunctions`);

const TIMEOUT = 40 * 1000;

When(/^I wait until "([^"]*)" is (visible|gone)$/, async function (alias, shouldBe) {
	this.info(`I wait until "${alias}" is ${shouldBe}`);
	const elementAlias = memory.getValue(alias);
	const element = await po.getElement(elementAlias);
	await stepFunctions.wait(element, shouldBe, timeouts.TIMEOUT);
});

When(/^I wait until page title is "([^"]*)"$/, function (title) {
	const titleValue = memory.getValue(title);
	this.info(`I wait until page title is "${titleValue}"`);
	return browser.waitUntil(async () => {
		const title = await browser.getTitle();
		return title === titleValue;
	}, {
		timeout: TIMEOUT
	});
});

When(/^I wait until "([^"]*)" contains "([^"]*)" text$/, async function (element, textToContain) {
	const elementName = await po.getElement(element);
	this.info(`I wait until "${elementName}" contains ${textToContain} text`);
	await browser.waitUntil(async () => (await elementName.getText()).includes(textToContain), {
		timeout: TIMEOUT
	});
});

When(/^I wait until count of "([^"]*)" is "([^"]*)"$/, async function (element, count) {
	const shouldBeCount = Number.parseInt(count, 10);
	this.info(`I wait until count of "${element}" is ${shouldBeCount}`);
	await browser.waitUntil(async () => {
		const elementArray = await po.getElement(element);
		return stepFunctions.getElementCount(elementArray) === shouldBeCount;
	}, {
		timeout: TIMEOUT
	});
});

When(/^I wait until text of "([^"]*)" is (not )?(partially )?"([^"]*)"( ignoring case)?( ignoring whitespaces)?( ignoring punctuation marks)?$/, async function (alias, notArg, contains, text, ignoringCase, ignoringWhitespaces, ignoringPunctuation) {
	const elementAlias = memory.getValue(alias);
	const textToWait = memory.getValue(text);
	ignoringWhitespaces ? textToWait.replace(/(\r\n|\n|\r|\s)/gm, ``) : ``;
	this.info(`I wait until text of "${elementAlias}" is ${notArg ? notArg : ``} ${textToWait} ${ignoringCase ? ignoringCase : ``}`);
	const condition = contains ? `contain` : `be`;
	await browser.waitUntil(async () => {
		const element = await po.getElement(elementAlias);
		const elementText = await element.getText();
		return stepFunctions.compareStrings(elementText, textToWait, condition, ignoringCase, ignoringWhitespaces, ignoringPunctuation, notArg);
	}, {timeout: TIMEOUT, timeoutMsg: `Text of "${elementAlias}" is ${notArg ? `` : `not `}${textToWait}`});
});

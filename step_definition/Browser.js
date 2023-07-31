const { When } = require(`@cucumber/cucumber`);
const memory = require(`@cucumber-e2e/memory2`);
const { po } = require(`@cucumber-e2e/po2`);
const stepFunctions = require(`./../support/stepFunctions`);

When(/^I remember number of browser tabs$/, async function () {
	const arrayOfWindowHandles = await browser.getWindowHandles();
	memory.setValue(`tabHandles`, arrayOfWindowHandles);
});

When(/^I switch to (new|first|last|previous|next|\d+) tab$/, async function (tab) {
	this.info(`I switch to ${tab} tab`);
	await stepFunctions.waitForBrowserTabAndSwitch(tab);
});

When(/^I open base url with "(.*)"$/, async function (newValue) {
	const baseUrl = memory.getValue(`$url`);
	this.info(`base url run with ${newValue}`);
	await browser.url(`${baseUrl}${newValue}`);
});

When(/^I click browser (refresh|back|forward) button$/, async function (select) {
	this.info(`I click browser ${select} button`);
	switch (select) {
	case `refresh`:
		await browser.refresh();
		break;
	case `back`:
		await browser.back();
		break;
	case `forward`:
		await browser.forward();
		break;
	default:
	}
});

When(/^I send sequence of keys "([^"]*)" to (?:element "([^"]*)"|active element)$/, async function (keys, element) {
	const keysValue = memory.getValue(keys);
	const elementName = memory.getValue(element);
	this.info(`I send sequence of keys "${keysValue}" to ${element ? `element "${elementName}"` : `active element`}`);
	const sequence = keysValue.split(`, `);
	if (element) {
		const elementToSendSequenceTo = await po.getElement(elementName);
		await stepFunctions.wait(elementToSendSequenceTo, `present`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
		await elementToSendSequenceTo.click();
	}
	await browser.keys(sequence);
});

When(/^I open "(.*)" url$/, function (urlValue) {
	const url = memory.getValue(urlValue);
	this.info(`I open "${url}" url`);
	return browser.url(url);
});

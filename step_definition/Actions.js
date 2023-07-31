const { Given, When } = require(`@cucumber/cucumber`);
const { po } = require(`@cucumber-e2e/po2`);
const memory = require(`@cucumber-e2e/memory2`);
const scripts = require(`../support/scripts`);
const wdioExpect = require(`../support/wdioExpect.js`);
const stepFunctions = require(`../support/stepFunctions`);
const dragNdrop = require(`../support/dragNdrop`);

Given(/^I am logged in( without cleanup)?$/, async function (withoutCleanupArg) {
	const url = memory.getValue(`$url`);
	if (process.env.SUITE !== `ipa`) {
		await browser.url(url);
		const user = memory.getValue(`$user`);
		this.info(`I am logged in as "${user.login}" ${withoutCleanupArg ? withoutCleanupArg : ``}`);
		await stepFunctions.login(user.login, user.password);
	}
	await browser.url(url + `#home/AllContent`);
	const homeButton = await po.getElement(`Header > Home`);
	await stepFunctions.wait(homeButton, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	if (!withoutCleanupArg) {
		await stepFunctions.clearUserCustomization();
	}
	await browser.execute(scripts.closePendo);
});

Given(/^I am logged in as "([^"]*)" with "([^"]*)" password( without cleanup)?$/, async function (login, password, withoutCleanupArg) {
	this.info(`I am logged in as "${login}" with "${password}" password${withoutCleanupArg ? withoutCleanupArg : ``}`);
	const url = memory.getValue(`$url`);
	await browser.url(url);
	await stepFunctions.login(login, password);
	const homeButton = await po.getElement(`Header > Home`);
	await stepFunctions.wait(homeButton, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	if (!withoutCleanupArg) {
		await stepFunctions.clearUserCustomization();
	}
	await browser.execute(scripts.closePendo);
});

When(/^I move mouse over "([^"]*)"$/, async function (alias) {
	const elementName = memory.getValue(alias);
	this.info(`I move mouse over "${elementName}"`);
	const elementToHover = await po.getElement(elementName);
	await elementToHover.moveTo();
});

When(/^I scroll to the (bottom|top)$/, async function (topOrBottom) {
	this.info(`I scroll to the"${topOrBottom}"`);
	await browser.execute(`window.scrollTo(0, ${topOrBottom === `bottom` ? `document.body.scrollHeight` : `0`})`);
});

When(/^I switch to "([^"]*)" iframe$/, async function (iframeSelector) {
	this.info(`I switch to "${iframeSelector}" iframe`);
	const iframe = await po.getElement(iframeSelector);
	await browser.switchToFrame(isNaN(iframeSelector) ? iframe : parseInt(iframeSelector) - 1);
});

When(/^I switch to default content$/, async function () {
	this.info(`I switch to default content`);
	await browser.switchToFrame(null);
});

When(/^I clear "([^"]*)"$/, async function (alias) {
	const elementName = memory.getValue(alias);
	this.info(`I clear "${elementName}"`);
	const elementToClear = await po.getElement(elementName);
	await elementToClear.clearValue();
});

When(/^I click "([^"]*)"( using JS)?$/, async function (alias, execute) {
	const elementToClickName = memory.getValue(alias);
	this.info(`I click "${elementToClickName}"`);
	const elementToClick = await po.getElement(elementToClickName);
	await stepFunctions.wait(elementToClick, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	if (execute) return browser.execute(`arguments[0].click()`, elementToClick);
	return elementToClick.click();
});

When(/I wait (\d+) seconds/, async function (sec) {
	this.info(`I wait ${sec} seconds`);
	await browser.pause(sec * 1000);
});

When(/^I type "(.*)" in "([^"]*)"$/, async function (text, name) {
	const inputName = memory.getValue(name);
	const textToType = memory.getValue(text) ?? ``;
	this.info(`I type "${textToType}" in "${inputName}"`);
	const inputToTypeIn = await po.getElement(inputName);
	await inputToTypeIn.waitForClickable();
	await inputToTypeIn.addValue(textToType);
});

When(/^I am on "([^"]*)" PA$/, async function (alias) {
	const paObject = memory.getValue(`$PA_aliases`);
	const paAlias = memory.getValue(alias);
	this.info(`I am on "${paAlias}" PA`);
	const pa = paObject[paAlias.toUpperCase()];
	if (!pa) {
		throw new Error(`No mapping to URL Found for PA: ${paAlias}`);
	}
	const feedbackButton = await po.getElement(`Header > Feedback Button`);
	await feedbackButton.waitForDisplayed();
	this.debug(`Navigating to ${pa}`);
	const url = memory.getValue(`$url`);
	const newUrl = url + `#/` + pa;
	const currentUrl = await browser.getUrl();
	if (currentUrl !== newUrl) {
		await browser.url(newUrl);
	}
	this.debug(`Waiting for Feedback Button to become visible`);
	await feedbackButton.waitForDisplayed();
	this.debug(`Waiting for Loading Indicator to be gone`);
	const loadingIndicator = await po.getElement(`Loading Indicator`);
	await wdioExpect(loadingIndicator).not.toBeDisplayed();
	this.debug(`Waiting for homePageAnchorElement to become visible`);
	const homePageAnchorElement = paAlias.toUpperCase() === `ALL CONTENT` ? await po.getElement(`Practice Areas Box > #1 of Practice Area Links`) : await po.getElement(`Content Box > #1 of Main Content Types > #1 of Content Types`);
	await stepFunctions.wait(homePageAnchorElement, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	this.debug(`Cleaning Customization`);
	await browser.execute(scripts.cleanUsersCustomization);
	this.debug(`Waiting for Feedback Button to become visible`);
	await feedbackButton.waitForDisplayed();
	this.debug(`Waiting for Loading Indicator to be gone`);
	await wdioExpect(loadingIndicator).not.toBeDisplayed();
	this.debug(`Waiting for homePageAnchorElement to become visible`);
	await stepFunctions.wait(homePageAnchorElement, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	this.debug(`Closing pendo popups`);
	await browser.execute(scripts.closePendo);
});

When(/^I perform search of "(.*)"$/, async function (search) {
	const searchQuery = memory.getValue(search);
	this.info(`I perform search of "${searchQuery}"`);
	const searchInput = await po.getElement(`Search Bar > Search Input`);
	this.debug(`Clearing Search Bar > Search Input`);
	await searchInput.waitForClickable();
	this.debug(`Typing [${searchQuery}] into Search Bar > Search Input`);
	await searchInput.setValue(searchQuery);
	this.debug(`Clicking Search Bar > Search Button`);
	const elementToClick = await po.getElement(`Search Bar > Search Button`);
	await elementToClick.waitForClickable();
	await elementToClick.click();
	this.debug(`Waiting for the Loading Indicator to be gone`);
	const loadingIndicator = await po.getElement(`Loading Indicator`);
	await stepFunctions.wait(loadingIndicator, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT, false);
	this.debug(`Waiting for last search pill to be visible`);
	const currentSearchPillTextElement = await po.getElement(`Search Bar > @${searchQuery} in Search Pills > Text`);
	await stepFunctions.wait(currentSearchPillTextElement, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	this.debug(`Waiting for #1 of Search Result Items to be visible`);
	const firstSearchResult = await po.getElement(`#1 of Search Result Items`);
	await stepFunctions.wait(firstSearchResult, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
});

When(/^I perform search of "([^"]*)" with the following presearch filters:$/, async function (search, dataTable) {
	const searchTerm = memory.getValue(search);
	const newDataTable = dataTable.raw().map((item, index) => {
		return dataTable[index] = item.toString();
	});
	this.info(`I perform search of "${searchTerm}" with the following presearch filters:[${newDataTable}]`);
	const advancedSearchButton = await po.getElement(`Search Bar > Advanced Search`);
	await stepFunctions.wait(advancedSearchButton, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	const advancedSearchPopup = await po.getElement(`Advanced Search Popup`);
	await advancedSearchButton.click();
	await stepFunctions.wait(advancedSearchPopup, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	for (const filter of newDataTable) {
		await stepFunctions.selectPreSearchFilters(filter);
	}
	const searchInput = await po.getElement(`Advanced Search Popup > Search Input`);
	await searchInput.setValue(searchTerm);
	const searchButton = await po.getElement(`Advanced Search Popup > Search Button`);
	await stepFunctions.wait(searchButton, `clickable`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	await searchButton.click();
	const loadingIndicator = await po.getElement(`Loading Indicator`);
	await stepFunctions.wait(loadingIndicator, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT, false);
	await stepFunctions.wait(advancedSearchButton, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	const saveSearchButton = await po.getElement(`Results Toolbar > Save Search Button`);
	await stepFunctions.wait(saveSearchButton, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
});

When(/^I open "([^"]*)" (topics )?document(?: from "([^"]*)" PA)?$/, async function (documentId, topics, pa) {
	let urlPart;
	const parsedDocumentId = memory.getValue(documentId);
	if (topics && pa) urlPart = `${pa}/${parsedDocumentId}`;
	if (topics && !pa) urlPart = `AllContent/${parsedDocumentId}`;
	if (!topics && pa) urlPart = `${pa}/${parsedDocumentId}`;
	if (!topics && !pa) urlPart = `${parsedDocumentId}`;

	this.info(`I open "${parsedDocumentId}" ${topics ? topics : ``}document${pa ? ` from ${pa} PA` : ``}`);
	await browser.url(`${memory.getValue(`$url`)}#/read/${urlPart}`);

	const selector = topics ? `Tax Topic Page` : `Document Frame > Document Content`;
	const documentContentElement = await po.getElement(selector);
	await stepFunctions.wait(documentContentElement, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	await browser.execute(scripts.closePendo);
});

When(/^I drag "(.+?)" to "(.+)"$/, async function (alias, dropZoneAlias) {
	this.info(`I drag "${alias}" to "${dropZoneAlias}"`);
	const source = await po.getElement(alias);
	const target = await po.getElement(dropZoneAlias);
	await browser.execute(dragNdrop, source, target);
});

When(/^I scroll to "([^"]*)" element$/, async function (elementToTriggerOn) {
	const parsedElement = memory.getValue(elementToTriggerOn);
	this.info(`I scroll to "${parsedElement}" element`);
	const elementToTrigger = await po.getElement(parsedElement);
	await elementToTrigger.scrollIntoView();
});

When(/^I trigger inline menu on "([^"]*)"$/, async function (elementToTriggerOn) {
	const parsedElement = memory.getValue(elementToTriggerOn);
	this.info(`I trigger inline menu on ${parsedElement}`);
	const element = await po.getElement(parsedElement);
	const elementCoordinates = await browser.execute(function (el) {
		const rect = el.getBoundingClientRect();
		return {
			top: rect.top,
			bottom: rect.bottom,
			left: rect.left,
			right: rect.right,
		};
	}, element);
	await browser.performActions([
		{
			"type": `pointer`,
			"id": `mouse1`,
			"parameters": { "pointerType": `mouse` },
			"actions": [
				{
					"type": `pointerMove`,
					"origin": `pointer`,
					"x": Math.round(elementCoordinates.left),
					"y": Math.round(elementCoordinates.top),
				},
				{
					"type": `pointerDown`,
					"origin": `pointer`,
				},
				{
					"type": `pointerMove`,
					"origin": `pointer`,
					"duration": 0,
					"x": Math.round(elementCoordinates.right - elementCoordinates.left),
					"y": Math.round(elementCoordinates.bottom - elementCoordinates.top),
				},
				{
					"type": `pointerUp`,
					"origin": `pointer`,
				}
			]
		}
	]);
});

When(/^I scroll "([^"]*)" to center of the window$/, async function (elementAlias) {
	this.info(`I scroll "${elementAlias}" to center of the window`);
	const parsedElement = memory.getValue(elementAlias);
	const elementToTrigger = await po.getElement(parsedElement);
	await elementToTrigger.scrollIntoView({ block: `center` });
});

When(/^I perform search of "([^"]*)" on (practical content|Laws & Regulations)$/, async function (search, practOrLaws) {
	const searchQuery = memory.getValue(search);
	this.info(`I perform search of "${searchQuery}" document`);
	const searchInput = await po.getElement(`Search Bar > Search Input`);
	this.debug(`Clearing Search Bar > Search Input`);
	await searchInput.waitForClickable();
	this.debug(`Typing [${searchQuery}] into Search Bar > Search Input`);
	if (practOrLaws === `Laws & Regulations`) {
		const el = await po.getElement(`Header > Laws And Regulations Button`);
		await el.click();
	} else {
		const el = await po.getElement(`Header >  Practical Content Button`);
		await el.click();
	}
	await searchInput.setValue(searchQuery);
	this.debug(`Clicking Search Bar > Search Button`);
	const elementToClick = await po.getElement(`Search Bar > Search Button`);
	await elementToClick.waitForClickable();
	await elementToClick.click();
	this.debug(`Waiting for last search pill to be visible`);
	const currentSearchPillTextElement = await po.getElement(`Search Bar > @${searchQuery} in Search Pills > Text`);
	await currentSearchPillTextElement.waitForDisplayed();
	this.debug(`Waiting for the Loading Indicator to be gone`);
	const loadingIndicator = await po.getElement(`Loading Indicator`);
	await wdioExpect(loadingIndicator).not.toBeDisplayed();
	// if (practOrLaws === `Laws & Regulations`) {
	//     const el = await po.getElement(`Header > Laws And Regulations Button`);
	//     await el.click();
	// } else {
	//     const el = await po.getElement(`Header >  Practical Content Button`);
	//     await el.click();
	// }
});

When(/^I (enable|disable) thesaurus$/, async function (enableOrDisable) {
	this.info(`I ${enableOrDisable} thesaurus`);
	enableOrDisable = enableOrDisable === `enable`;
	await browser.execute(scripts.setThesaurusState, enableOrDisable);
});

When(/^I add "([^"]*)" document to "([^"]*)" folder$/, async function (id, folder) {
	const documentId = memory.getValue(id);
	const folderName = memory.getValue(folder);
	this.info(`I add "${documentId}" document to "${folderName}" folder`);
	await browser.execute(scripts.addDocumentToFolder, documentId, folderName);
	await browser.waitUntil(async () => browser.execute(scripts.isDocumentPresentInFolder, documentId, folderName), {
		timeout: stepFunctions.timeouts.PAGE_LOAD_TIMEOUT,
		timeoutMsg: `[${documentId}] document didn't appear in [${folderName}] dolder within 10 seconds`
	});
});

When(/^I add "([^"]*)" document to favorites$/, async function (id) {
	const documentId = memory.getValue(id);
	this.info(`I add "${documentId}" document to favorites`);
	await browser.execute(scripts.addDocumentToFavorites, documentId, true);
});

When(/^I scroll "([^"]*)" element (down|up) "([^"]*)" pixels$/,async function (elementName, scrollDirection, scrollLength) {
	this.info(`I scroll "${elementName}" element ${scrollDirection} "${scrollLength}" pixels`);
	const elementToScroll = await po.getElement(elementName);
	if (scrollDirection === `up`) {
		scrollLength = ~scrollLength + 1;
	}
	await browser.execute(`arguments[0].scrollTop += arguments[1];`, elementToScroll, scrollLength);
});

When(/^I set communication email to "([^"]*)"$/, function (email) {
	const newCommunicationEmail = memory.getValue(email);
	return browser.execute(scripts.changeCommunicationEmail, newCommunicationEmail);
});

When(/^I delete all daily alerts$/, function () {
	return browser.execute(scripts.deleteDailyAlerts);
});

When(/^I click first "([^"]*)" elements of "([^"]*)"$/, async function (num, alias) {
	const elementAlias = memory.getValue(alias);
	const number = Number.parseInt(memory.getValue(num), 10);
	await browser.execute(scripts.closePendo);
	this.info(`I click first "${number}" elements of "${elementAlias}"`);
	const elementsToClick = await po.getElement(elementAlias);
	const countOfElements = stepFunctions.getElementCount(elementsToClick);
	if (countOfElements < number) {
		throw new Error(`Count of elements [${countOfElements}] is less than [${number}]`);
	} else {
		for (let i = 0; i < number; i++) {
			await elementsToClick[i].click();
		}
	}
});

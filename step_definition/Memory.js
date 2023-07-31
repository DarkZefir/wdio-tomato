const { When } = require(`@cucumber/cucumber`);
const memory = require(`@cucumber-e2e/memory2`);
const { po } = require(`@cucumber-e2e/po2`);
const stepFunctions = require(`../support/stepFunctions`);
const { getLawsAndRegulationsCsh } = require(`../support/getCshData`);
const cannedJson = require(`../support/cannedQueries/cannedQueries.json`);

When(/^I remember "([^"]*)" attribute of "([^"]*)" as "([^"]*)"$/, async function (attributeName, alias, rememberAs) {
	const element = memory.getValue(alias);
	const elementAlias = await po.getElement(element);
	this.info(`I remember "${attributeName}" attribute of "${elementAlias}" as "${rememberAs}"`);
	const attributeValue = await elementAlias.getAttribute(attributeName);
	this.debug(`Remembering "${attributeValue}" as "${rememberAs}"`);
	memory.setValue(rememberAs, attributeValue);
});

When(/^I remember number of browser tabs as "([^"]*)"$/, async function (rememberAs) {
	this.info(`I remember number of  browser tabs as "${rememberAs}"`);
	const arrayOfWindowHandles = await browser.getWindowHandles();
	memory.setValue(rememberAs, arrayOfWindowHandles.length);
});

When(/^I remember current url as "([^"]*)"$/, async function (rememberAs) {
	this.info(`I remember current url as "${rememberAs}"`);
	const url = await browser.getUrl();
	memory.setValue(rememberAs, url);
});

When(/^I remember index of "([^"]*)"( exactly)? matching "([^"]*)"( ignoring case)? as "([^"]*)"$/, async function (alias, strictArg, text, ignoringCase, rememberAs) {
	this.info(`I remember index of "${alias}"${strictArg ? strictArg : ``} matching "${text}"${ignoringCase ? ignoringCase : ``} as "${rememberAs}"`);
	let textValue = memory.getValue(text);
	const elementAlias = memory.getValue(alias);
	const elements = await po.getElement(elementAlias);
	let index = 0;
	const arrayOfPromises = elements.map(async element => (await element).getText());
	let arrayOfTexts = await Promise.all(arrayOfPromises);
	if (ignoringCase) {
		textValue = textValue.toLowerCase();
		arrayOfTexts = arrayOfTexts.map(item => item.toLowerCase());
	}
	const findFn = strictArg ? item => item === textValue : item => item.includes(textValue);
	index = arrayOfTexts.findIndex(findFn);
	if (index !== -1) {
		memory.setValue(rememberAs, index + 1);
	} else {
		throw Error(`${alias} doesn't contain text ${text}!`);
	}
});

When(/^I remember text of "([^"]*)" as "([^"]*)"$/, async function (alias, rememberAs) {
	const elementAlias = memory.getValue(alias);
	const elementToRemember = await po.getElement(elementAlias);
	this.info(`I remember text of "${alias}" as "${rememberAs}"`);
	if (Array.isArray(elementToRemember)) {
		const arrayOfElements = await Promise.all(elementToRemember.map(item => item.getText()));
		this.debug(`Remembering "${arrayOfElements}" as "${rememberAs}"`);
		memory.setValue(rememberAs, arrayOfElements);
	} else {
		await elementToRemember.waitForDisplayed();
		const text = await elementToRemember.getText();
		this.debug(`Remembering "${text}" as "${rememberAs}"`);
		memory.setValue(rememberAs, text);
	}
});

When(/^I remember number of "([^"]*)" as "([^"]*)"$/, async function (alias, rememberAs) {
	const elementAlias = memory.getValue(alias);
	this.info(`I remember number of "${alias}" as "${rememberAs}"`);
	const elementsToCount = await po.getElement(elementAlias);
	const elementsCount = stepFunctions.getElementCount(elementsToCount);
	this.debug(`Remembering ${elementsCount} as "${rememberAs}"`);
	memory.setValue(rememberAs, elementsCount);
});

When(/^I remember random integer below "([^"]*)"(?: and above "([^"]*)")? as "([^"]*)"$/, async function (belowNumber, aboveNumber, rememberAs) {
	this.info(`I remember random integer below "${belowNumber}"${aboveNumber ? ` and above "${aboveNumber}"` : ``} as "${rememberAs}"`);
	const below = Number.parseInt(memory.getValue(belowNumber), 10);
	const above = aboveNumber ? Number.parseInt(memory.getValue(aboveNumber), 10) : 1;
	const randomNumber = Math.floor(Math.random() * (below - above + 1)) + memory.getValue(above);
	this.debug(`Remembering [${randomNumber}] number as [${memory.getValue(rememberAs)}]`);
	memory.setValue(rememberAs, randomNumber);
});

When(/^I remember "([^"]*)" of "([^"]*)" metadata parameter as "([^"]*)" for L&R$/, async function (metadataValue, metadataKey, memoryKey) {
	const value = memory.getValue(metadataValue);
	const key = memory.getValue(metadataKey);
	this.info(`I remember "${value}" of "${key}" metadata parameter as "${memoryKey}" for L&R`);
	const metadataPairs = await po.getElement(`Metadata Pairs`);
	const arrayOfPromises = metadataPairs.map(async element => element.getText());
	const arrayOfTexts = await Promise.all(arrayOfPromises);
	const metadataText = arrayOfTexts.find(element => element.startsWith(key)).replace(key, ``);
	const elementOfArray = metadataText.split(`\n`).find(item => item.startsWith(value));
	const textOfValue = elementOfArray.split(value + `: `)[1];
	memory.setValue(memoryKey, textOfValue);
});

When(/^I remember value of "([^"]*)" metadata parameter as "([^"]*)"$/, async function (metadataKey, memoryKey) {
	const key = memory.getValue(metadataKey);
	this.info(`I remember value of "${key}" metadata parameter as "${memoryKey}"`);
	const metadataPairs = await po.getElement(`Metadata Pairs`);
	const arrayOfPromises = metadataPairs.map(async element => element.getText());
	const arrayOfTexts = await Promise.all(arrayOfPromises);
	const editedArrayOfTexts = arrayOfTexts.map(text => text.toLowerCase().replace(/\s/g, ``));
	const value = editedArrayOfTexts.find(element => element.startsWith(key.toLowerCase()));
	memory.setValue(memoryKey, value.substring(key.length));
});

When(/^I (include|exclude) "([^"]*)" (into|from) "([^"]*)"$/, function (includeOrExclude, textToIncludeorExclude, intoOrFrom, targetVariable) {
	const targetVariableName = targetVariable.replace(/(\{|\}|\$)/gm, ``);
	textToIncludeorExclude = memory.getValue(textToIncludeorExclude);
	targetVariable = memory.getValue(targetVariable);
	this.info(`I ${includeOrExclude} "${textToIncludeorExclude}" ${intoOrFrom} "${targetVariable}"`);
	if (includeOrExclude === `include`) {
		targetVariable.push(textToIncludeorExclude);
	} else {
		const index = targetVariable.indexOf(textToIncludeorExclude);
		if (index > -1) {
			targetVariable.splice(index, 1);
		}
	}
	this.debug(`Saving [${targetVariable}] as [${targetVariableName}]`);
	memory.setValue(targetVariableName, targetVariable);
});

When(/^I remember clipboard content as "([^"]*)"$/, async function (memoryKey) {
	this.info(`I remember clipboard content as "${memoryKey}"`);
	const value = await browser.executeAsync(done => navigator.clipboard.readText().then(done));
	this.debug(`Saving clipboard value [${value}] as "${memoryKey}"`);
	memory.setValue(memoryKey, value);
});

When(/^I remember selected text as "([^"]*)"$/, async function (rememberAs) {
	this.info(`I remember selected text as "${rememberAs}"`);
	const selectedText = await browser.execute(stepFunctions.getSelectionText);
	this.debug(`Remembering "${selectedText}" as "${rememberAs}"`);
	memory.setValue(rememberAs, selectedText);
});

When(/^I get csh data for "Laws & Regulations" and save it as "([^"]*)"$/, async function (saveAs) {
	const envUrl = memory.getValue(`$url`);
	const lawsAndRegsCshData = await getLawsAndRegulationsCsh(envUrl);
	this.info(`I get csh data for "Laws & Regulations" and save it as "${saveAs}"`);
	this.debug(`Saving [${lawsAndRegsCshData}] as [${saveAs}]`);
	memory.setValue(saveAs, lawsAndRegsCshData);
});

When(/^I get canned search value for "([^"]*)" and remember as "([^"]*)"$/, async function (canned, rememberAs) {
	const cannedSearch = memory.getValue(canned);
	this.info(`I get canned search value for "${cannedSearch}" and remember as "${rememberAs}"`);
	let searchQuery;
	cannedJson.forEach(parent => {
		parent.children.forEach(child => {
			if(child.label === cannedSearch) {
				searchQuery = child.query;
			}
		});
	});
	this.debug(`Saving [${searchQuery}] as "${rememberAs}"`);
	memory.setValue(rememberAs, searchQuery);
});

When(/^I remember "([^"]*)" string length as "([^"]*)"$/, async function (alias, rememberAs) {
	const string = memory.getValue(alias);
	const stringLength = string.length;
	this.info(`I remember "${string}" string length as "${rememberAs}"`);
	this.debug(`Saving [${stringLength}] as "${rememberAs}"`);
	memory.setValue(rememberAs, stringLength);
});

When(/^I remember value of "([^"]*)" as "([^"]*)"$/, async function (alias, rememberAs) {
	const elementName = memory.getValue(alias);
	const element = await po.getElement(elementName);
	this.info(`I remember value of "${elementName}" as "${rememberAs}"`);
	const value = await element.getValue();
	this.debug(`Remembering "${value}" as "${rememberAs}"`);
	memory.setValue(rememberAs, value);
});

When(/^I remember text of first "([^"]*)" number of "([^"]*)" elements as "([^"]*)"$/, async function (num, alias, rememberAs) {
	const elementAlias = memory.getValue(alias);
	const number = Number.parseInt(memory.getValue(num), 10);
	this.info(`I remember text of "${number}" number of "${elementAlias}" elements as "${rememberAs}"`);
	const elementsToRemember = await po.getElement(elementAlias);
	const countOfElements = stepFunctions.getElementCount(elementsToRemember);
	if (countOfElements < number) {
		throw new Error(`Count of elements [${countOfElements}] is less than [${number}]`);
	} else {
		const arrayOfTexts = [];
		for (let i = 0; i < number; i++) {
			arrayOfTexts.push(await elementsToRemember[i].getText());
		}
		memory.setValue(rememberAs, arrayOfTexts);
	}
});

const { Then } = require(`@cucumber/cucumber`);
const memory = require(`@cucumber-e2e/memory2`);
const chai = require(`chai`);
const sorted = require(`chai-sorted`);
const datetime = require(`chai-datetime`);
const { po } = require(`@cucumber-e2e/po2`);
const wdioExpect = require(`../support/wdioExpect.js`);
const stepFunctions = require(`../support/stepFunctions`);
const { timeouts } = require(`../support/stepFunctions`);
const { getCshTreesForPA, getMainContentTypeTitles, getContentTypeTitles} = require(`../support/getCshData`);
chai.use(sorted);
chai.use(datetime);
const chaiExpect = chai.expect;
const cannedJson = require(`../support/cannedQueries/cannedQueries.json`);
const statesJson = require(`../support/statesConsts/states.json`);

Then(/Page URL should (be|contain) "(.+)"/, async function (condition, expected) {
	const expectedValue = memory.getValue(expected);
	this.info(`Url should ${condition} "${expectedValue}"`);
	const url = await browser.getUrl();
	condition === `contain` ?
		chaiExpect(url).to.include(expectedValue) :
		chaiExpect(url).to.equal(expectedValue);
});

Then(/Element "(.+)" should be visible/, async function (alias) {
	const element = po.getElement(alias);
	await wdioExpect(element).toBeDisplayed();
});

Then(/^"([^"]*)" should (not )?be (present|clickable|visible|selected)$/, async function (alias, notArg, validation) {
	const elementAlias = memory.getValue(alias);
	this.info(`"${elementAlias}" should ${notArg ? notArg : ``}be ${validation}`);
	const element = await po.getElement(elementAlias);
	if (Array.isArray(element)) {
		const arrayOfPromises = element.map(async element => {
			await stepFunctions.wait(element, validation, timeouts.ELEMENT_LOAD_TIMEOUT, notArg);
		});
		await Promise.all(arrayOfPromises);
	} else {
		await stepFunctions.wait(element, validation, timeouts.ELEMENT_LOAD_TIMEOUT, notArg);
	}
});

Then(/^Value in "([^"]*)" should (not )?(be|contain|match) "([^"]*)"( ignoring case)?( ignoring whitespaces)?( ignoring punctuation marks)?$/, async function (alias, notArg, condition, textAlias, ignoringCase, ignoringWhitespaces, ignoringPunctuation) {
	const elementAlias = memory.getValue(alias);
	const expectedValue = memory.getValue(textAlias);
	this.info(`Value in "${elementAlias} should ${notArg ? notArg : ``}be "${expectedValue}"`);
	await browser.waitUntil(async () => {
		const element = await po.getElement(elementAlias);
		const elementValue = await element.getValue();
		return stepFunctions.compareStrings(elementValue, expectedValue, condition, ignoringCase, ignoringWhitespaces, ignoringPunctuation, notArg);
	}, { timeout: stepFunctions.timeouts.ELEMENT_LOAD_TIMEOUT, timeoutMsg: `Value of "${elementAlias}" is ${notArg ? `` : `not `}${expectedValue}` });
});

Then(/^Attribute "([^"]*)" of "([^"]*)" should (not )?(be|contain|match) "([^"]*)"( ignoring case)?( ignoring whitespaces)?( ignoring punctuation marks)?$/, async function (attributeAlias, alias, notArg, condition, attributeValueAlias, ignoringCase, ignoringWhitespaces, ignoringPunctuation) {
	const elementAlias = memory.getValue(alias);
	const attributeExpectedValue = memory.getValue(attributeValueAlias);
	const attributeName = memory.getValue(attributeAlias);
	ignoringWhitespaces ? attributeExpectedValue.replace(/(\r\n|\n|\r|\s)/gm, ``) : ``;
	this.info(`"${attributeName}" attribute of "${elementAlias}" should ${notArg ? `not ` : ``}${condition}${attributeExpectedValue}`);
	await browser.waitUntil(async () => {
		const element = await po.getElement(elementAlias);
		const attributeValue = await element.getAttribute(attributeName);
		return stepFunctions.compareStrings(attributeValue, attributeExpectedValue, condition, ignoringCase, ignoringWhitespaces, ignoringPunctuation, notArg);
	}, { timeout: stepFunctions.timeouts.ELEMENT_LOAD_TIMEOUT, timeoutMsg: `Attribute of "${elementAlias}" is ${notArg ? `` : `not `}${attributeExpectedValue}` });
});

Then(/^Text of "([^"]*)" should (not )?(be|contain|match) "(.*)"( ignoring case)?( ignoring whitespaces)?( ignoring punctuation marks)?$/, async function (alias, notArg, condition, text, ignoringCase, ignoringWhitespaces, ignoringPunctuation) {
	const elementAlias = memory.getValue(alias);
	const textToWait = memory.getValue(text);
	this.info(`Text of "${elementAlias}" should ${notArg ? notArg : ``}${condition} "${textToWait}" ${ignoringCase ? ignoringCase : ``} ${ignoringWhitespaces ? ignoringWhitespaces : ``} ${ignoringPunctuation ? ignoringPunctuation : ``}`);
	let elementText;
	const wrongTextMessage = `wrong_text`;
	try {
		await browser.waitUntil(async () => {
			const element = await po.getElement(elementAlias);
			elementText = await element.getText();
			return stepFunctions.compareStrings(elementText, textToWait, condition, ignoringCase, ignoringWhitespaces, ignoringPunctuation, notArg);
		}, {
			timeout: stepFunctions.timeouts.ELEMENT_LOAD_TIMEOUT,
			timeoutMsg: wrongTextMessage
		});
	} catch (e) {
		if (e.message.includes(wrongTextMessage)) {
			chaiExpect.fail(`"${elementText}" does ${notArg ? `` : `not `}${condition === `be` ? `equal` : condition} "${textToWait}"`);
		}
		throw e;
	}
});

Then(/^Placeholder text for "([^"]*)" should (not )?(be|contain) "(.*)"$/, async function (alias, notArg, condition, text) {
	const elementAlias = memory.getValue(alias);
	const element = await po.getElement(elementAlias);
	const textToEqual = memory.getValue(text) ?? ``;
	this.info(`Placeholder text for "${elementAlias}" should ${notArg ? notArg : ``} ${condition} "${textToEqual}"`);
	const placeholderText = await element.getAttribute(`placeholder`);
	const expectedClause = notArg ? chaiExpect(placeholderText).to.not : chaiExpect(placeholderText).to;
	switch (condition) {
	case `be`: expectedClause.equal(textToEqual); break;
	case `contain`: expectedClause.contain(textToEqual); break;
	}
});

Then(/^Text in collection of "([^"]*)" should (not )?(contain|match) "(.*)"( ignoring case)?$/, async function (alias, notArg, should, text, ignoringCase) {
	const elementAlias = memory.getValue(alias);
	const element = await po.getElement(elementAlias);
	let textToContain = memory.getValue(text) ?? ``;
	let arrayOfElements = await Promise.all(element.map(item => item.getText()));
	if (ignoringCase) {
		textToContain = textToContain.toLowerCase();
		arrayOfElements = arrayOfElements.map(element => element.toLowerCase());
	}
	this.info(`"${[...new Set(arrayOfElements)]}" should ${notArg ? notArg : ``}${should} "${textToContain}"${ignoringCase ? ignoringCase : ``}`);
	const expectedClause = notArg ? chaiExpect(arrayOfElements).to.not : chaiExpect(arrayOfElements).to;
	switch (should) {
	case `contain`: expectedClause.contain(textToContain); break;
	case `match`: expectedClause.match(new RegExp(textToContain)); break;
	}
});

Then(/^"(.*)" text should (not )?contain "(.*)" text( ignoring whitespaces)?( ignoring case)?( ignoring punctuation marks)?$/, function (text, notArg, containedText, ignoringWhitespaces, ignoringCase, ignoringPunctuation) {
	let firstText = memory.getValue(text);
	let textToContain = memory.getValue(containedText);
	if (ignoringWhitespaces) {
		firstText = firstText.replace(/(\r\n|\n|\r|\s)/gm, ``);
		textToContain = textToContain.replace(/(\r\n|\n|\r|\s)/gm, ``);
	}
	if (ignoringCase) {
		firstText = firstText.toLowerCase();
		textToContain = textToContain.toLowerCase();
	}
	if (ignoringPunctuation) {
		firstText = firstText.replace(/[.,\/#§!$%\^&\*;:{}=\-_`~()]/gm, ``);
		textToContain = textToContain.replace(/[.,\/#§!$%\^&\*;:{}=\-_`~()]/gm, ``);
	}
	this.info(`"${firstText}" should ${notArg ? notArg : ``}contain "${textToContain}"${ignoringWhitespaces ? ignoringWhitespaces : ``}${ignoringCase ? ignoringCase : ``}${ignoringPunctuation ? ignoringPunctuation : ``}`);
	if (notArg) {
		chaiExpect(firstText).to.not.contain(textToContain);
	} else {
		chaiExpect(firstText).to.contain(textToContain);
	}
});

Then(/^"([^"]*)" text should (not )?be equal to "([^"]*)" text( ignoring case)?$/, function (text, notArg, textTo, ignoringCase) {
	let firstText = memory.getValue(text);
	let textToEqual = memory.getValue(textTo);
	this.info(`"${firstText} should ${notArg ? notArg : ``}be equal to "${textToEqual}"${ignoringCase ? ignoringCase : ``}`);
	if (ignoringCase) {
		firstText = firstText.toLowerCase();
		textToEqual = textToEqual.toLowerCase();
	}
	if (notArg) {
		chaiExpect(firstText).to.not.equal(textToEqual);
	} else {
		chaiExpect(firstText).to.equal(textToEqual);
	}
});

Then(/^Count of "([^"]*)" should (not )?be (equal to|more than|less than) "([^"]*)"$/, async function (alias, notArg, shouldBe, number) {
	const elementAlias = memory.getValue(alias);
	const parsedNumber = Number.parseInt(memory.getValue(number), 10);
	this.info(`Count of "${elementAlias}" should ${notArg ? `not ` : ``}be ${shouldBe} "${parsedNumber}"`);
	await browser.waitUntil(async () => {
		const element = await po.getElement(elementAlias);
		const count = stepFunctions.getElementCount(element);
		return stepFunctions.compareNumbers(count, parsedNumber, shouldBe, notArg);
	}, { timeout: stepFunctions.timeouts.ELEMENT_LOAD_TIMEOUT, timeoutMsg: `"${elementAlias}" doesnt have ${shouldBe === `equal to` ? `` : shouldBe} ${parsedNumber} elements` });
});

Then(/^I should see "([^"]*)" metadata parameter with "([^"]*)" value( ignoring punctuation marks)?$/, async function (metadataKey, metadataValue, ignoringPunctuation) {
	const value = memory.getValue(metadataValue);
	this.info(`I should see "${metadataKey}" metadata parameter with "${value}" value${ignoringPunctuation ? ignoringPunctuation : ``}`);
	const metadataPairs = await po.getElement(`Metadata Pairs`);
	const searchPair = ignoringPunctuation ? (metadataKey + value).replace(/\s/g, ``).toLowerCase().replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, ``) : (metadataKey + value).replace(/\s/g, ``).toLowerCase();
	const arrayOfPromises = metadataPairs.map(async element => element.getText());
	const arrayOfTexts = await Promise.all(arrayOfPromises);
	const editedArrayOfTexts = arrayOfTexts.map(text => {
		text = text.toLowerCase().replace(/(\r\n|\n|\r|\s)/gm, ``);
		ignoringPunctuation ? text = text.toLowerCase().replace(/[.,\/#!$%\^&\*;:{}=\-_`~()]/g, ``) : ``;
		return text;
	});
	chaiExpect(editedArrayOfTexts).to.include(searchPair);
});

Then(/^Value of "([^"]*)" metadata parameter should (not )?be equal to "([^"]*)" value$/, async function (metadataKey, notArg, value) {
	const actualValue = memory.getValue(value);
	this.info(`Value of "${metadataKey}" metadata should ${notArg ? notArg : ``} be equal to "${actualValue}" value`);
	const metadataPairs = await po.getElement(`Metadata Pairs`);
	const arrayOfPromises = metadataPairs.map(async element => element.getText());
	const arrayOfTexts = await Promise.all(arrayOfPromises);
	const elementForSearch = arrayOfTexts.find(element => element.startsWith(metadataKey));
	const valueForEqual = elementForSearch.split(`value: `)[1].replace(/(\r\n|\n|\r|\s)/gm, ``);
	if (!notArg) {
		return chaiExpect(valueForEqual).to.be.equal(actualValue, `${actualValue} is not equal ${valueForEqual}`);
	} else {
		return chaiExpect(valueForEqual).to.not.equal(actualValue, `${actualValue} is equal ${valueForEqual}`);
	}
});

Then(/^"([^"]*)" number should (not )?be (equal to|more than|less than) "([^"]*)"$/, function (firstNumber, notArg, shouldBe, secondNumber) {
	const firstNum = memory.getValue(firstNumber);
	const secondNum = memory.getValue(secondNumber);
	const firstParsedNumber = typeof firstNum === `string` ? Number.parseInt(firstNum.replace(/\D/gm, ``), 10) : firstNum;
	const secondParsedNumber = typeof secondNum === `string` ? Number.parseInt(secondNum.replace(/\D/gm, ``), 10) : secondNum;
	this.info(`"${firstParsedNumber}" number should be ${shouldBe} "${secondParsedNumber}"`);
	stepFunctions.verify(firstParsedNumber, secondParsedNumber, shouldBe, notArg);
});

Then(/^I should see the following lines in "([^"]*)"( ignoring order)?:$/, async function (alias, ignoringOrder, dataTable) {
	const elementAlias = memory.getValue(alias);
	const elements = await po.getElement(elementAlias);
	this.info(`I should see the following lines in "${alias}" ${ignoringOrder ? ignoringOrder : ``}: ${dataTable.raw()}`);
	const arrayOfPromises = elements.map(async element => (await element.getText()).trim());
	const elementTexts = await Promise.all(arrayOfPromises);
	this.debug(`Element texts: [${elementTexts}]`);
	if (dataTable.raw().length !== elementTexts.length) {
		throw new Error(`Count of |${elementTexts}| elements (${elementTexts.length}) does not match expected size (${dataTable.raw().length})`);
	}
	const nonMatchingElementsArray = dataTable.raw().reduce((nonMatchingElementsArray, [currentValue], index) => {
		if (ignoringOrder) {
			if (!elementTexts.includes(currentValue.toString())) {
				const errorMessage = `|${elementTexts}| text does not contain: |${currentValue}|`;
				nonMatchingElementsArray.push(errorMessage);
			}
			return nonMatchingElementsArray;
		} else {
			if (currentValue !== elementTexts[index]) {
				const errorMessage = `|${elementTexts[index]}| text does not equal: |${currentValue}|`;
				nonMatchingElementsArray.push(errorMessage);
			}
			return nonMatchingElementsArray;
		}
	}, []);
	if (nonMatchingElementsArray.length > 0) {
		throw new Error(`${nonMatchingElementsArray}`);
	}
});

Then(/^"([^"]*)" urls should contain the following lines:$/, async function (alias, dataTable) {
	const elementAlias = memory.getValue(alias);
	const elements = await po.getElement(elementAlias);
	this.info(`"${elements}" urls should contain the following lines: ${dataTable.raw()}`);
	const arrayOfPromises = elements.map(async element => (await element).getAttribute(`href`));
	const arrayOfUrls = await Promise.all(arrayOfPromises);
	if (!(dataTable.raw().length === arrayOfUrls.length)) {
		throw new Error(`Count of ${elements} elements (${arrayOfUrls.length}) does not match expected size (${dataTable.raw().length})`);
	}
	const nonMatchingElementsArray = dataTable.raw().reduce((nonMatchingElementsArray, [currentValue], index) => {
		if (!arrayOfUrls[index].includes(currentValue)) {
			const errorMessage = `|${arrayOfUrls[index]}| URL does not include: |${currentValue}|`;
			nonMatchingElementsArray.push(errorMessage);
		}
		return nonMatchingElementsArray;
	}, []);
	if (nonMatchingElementsArray.length > 0) {
		throw new Error(`${nonMatchingElementsArray}`);
	}
});

Then(/^Each element of "([^"]*)" should (match|contain) "([^"]*)"( ignoring case)?$/, async function (alias, should, textTo, ignoringCase) {
	const elementAlias = memory.getValue(alias);
	const elements = await po.getElement(elementAlias);
	let text = memory.getValue(textTo);
	this.info(`Each element of "${elementAlias}" should ${should} "${text}"${ignoringCase ? ignoringCase : ``}`);
	const arrayOfPromises = elements.map(async element => (await element).getText());
	const elementTexts = await Promise.all(arrayOfPromises);
	const nonMatchingTexts = elementTexts.filter(item => {
		if (ignoringCase) {
			text = text.toLowerCase();
			item = item.toLowerCase();
		}
		if (should === `match`) {
			const regExp = new RegExp(text);
			return !regExp.test(item);
		} else {
			return !item.includes(text);
		}
	});
	if (nonMatchingTexts.length > 0) {
		throw new Error(`Not All Elements ${should} "${text}". Elements that didn't match: ${nonMatchingTexts}`);
	}
});

Then(/^(Text|Background) color of "([^"]*)" should (not )?be "([^"]*)"$/, async function (attribute, elementName, notArg, color) {
	const actualElement = memory.getValue(elementName);
	this.info(`Background color of "${actualElement}" should ${notArg ? notArg : ``}be "${color}"`);
	const elementToCheck = await po.getElement(actualElement);
	const cssProperty = attribute === `Text` ? `color` : `background-color`;
	const actColor = await elementToCheck.getCSSProperty(cssProperty);
	if (notArg) {
		chaiExpect(actColor).to.not.have.keys(color);
	} else {
		chaiExpect(actColor).to.not.have.all.keys(color);
	}
});

Then(/^"([^"]*)" should (not )?be enabled$/, async function (alias, notArg) {
	const elementAlias = memory.getValue(alias);
	const element = await po.getElement(elementAlias);
	this.info(`"${alias}" should ${notArg ? notArg : ``}be enabled`);
	const isElementEnabled = await element.isEnabled();
	const elementClasses = await element.getAttribute(`class`);
	const containsDisabledClass = !!elementClasses && (elementClasses.includes(`disabled`) || elementClasses.includes(`cg-field-is-disabled`) || elementClasses.includes(`srl-future-version-switcher-disabled`));
	if (isElementEnabled && notArg && !containsDisabledClass || !isElementEnabled && !notArg || containsDisabledClass && !notArg) {
		throw new Error(`[${alias}] element is ${notArg ? `` : `not `}enabled!`);
	}
});

Then(/^"([^"]*)" collection should (not )?be equal to "([^"]*)" collection( ignoring case)??( ignoring punctuation marks)?( ignoring whitespaces)?( ignoring order)?$/, async function (firstCollectionName, notArg, secondCollectionName, ignoringCase, ignoringPunctuation, ignoringWhitespaces, ignoringOrder) {
	let firstCollection = memory.getValue(firstCollectionName);
	let secondCollection = memory.getValue(secondCollectionName);
	this.info(`"${firstCollectionName}" collection should ${notArg ? `` : `not `}be equal to "${secondCollection}" collection${ignoringCase ? ignoringCase : ``}`);
	if (ignoringCase) {
		const ignoreCase = item => item.toLowerCase();
		firstCollection = firstCollection.map(ignoreCase);
		secondCollection = secondCollection.map(ignoreCase);
	}
	if (ignoringPunctuation) {
		const ignorePunctuation = item => item.replace(/[^\w\s]|_/gm, ``);
		firstCollection = firstCollection.map(ignorePunctuation);
		secondCollection = secondCollection.map(ignorePunctuation);
	}
	if (ignoringWhitespaces) {
		const ignoreWhitespaces = item => item.replace(/(\s)/gm, ``);
		firstCollection = firstCollection.map(ignoreWhitespaces);
		secondCollection = secondCollection.map(ignoreWhitespaces);
	}
	if (ignoringOrder) {
		firstCollection = firstCollection.sort();
		secondCollection = secondCollection.sort();
	}
	const expectedClause = notArg ? chaiExpect(firstCollection).to.not : chaiExpect(firstCollection).to;
	expectedClause.deep.equal(secondCollection);
});

Then(/^Order of "([^"]*)" should be( reverse)? alphabetical( ignoring syntax)?$/, async function (alias, reverse, ignoringSyntax) {
	const elementAlias = memory.getValue(alias);
	this.info(`Order of ${elementAlias} should be${reverse ? reverse : ``} alphabetical`);
	const element = await po.getElement(elementAlias);
	let arrayOfElementTexts = await Promise.all(element.map(item => item.getText()));
	arrayOfElementTexts = arrayOfElementTexts.map(text => text.toLowerCase());
	if (ignoringSyntax) {
		arrayOfElementTexts = arrayOfElementTexts.map(item => item.replace(/[^\w\s]|_/gm, ``));
	}
	this.debug(`Array of element texts: [${arrayOfElementTexts}]`);
	return chaiExpect(arrayOfElementTexts).to.be.sorted({ descending: reverse });
});

Then(/^"([^"]*)" string should (not )?be (equal to|more than|less than) "([^"]*)" characters$/, function (value, notArg, shouldBe, length) {
	const string = memory.getValue(value);
	length = Number.parseInt(memory.getValue(length).replace(/\D/gm, ``), 10);
	this.info(`"${string}" string should ${notArg ? notArg : ``}be ${shouldBe} "${length}" characters`);
	return stepFunctions.compareNumbers(string.length, length, shouldBe, notArg);
});

Then(/^I should (not )?see "(.*)" text on page$/, function (notArg, value) {
	this.info(`I should ${notArg ? notArg : ``}see "${value}" text on page`);
	const text = memory.getValue(value);
	return browser.waitUntil(async () => {
		const page = await po.getElement(`All Elements`);
		const pageText = await page.getText();
		return pageText.includes(text);
	}, {
		timeout: stepFunctions.timeouts.ELEMENT_LOAD_TIMEOUT,
		timeoutMsg: `"${text}" text is ${notArg ? `` : notArg}present on the page`,
	});
});

Then(/^I verify csh data for "([^"]*)" PA$/, async function (paName) {
	this.info(`I verify csh data for "${paName}" PA`);
	const cshData = await getCshTreesForPA(paName);
	const mainContentTypesTitles = await getMainContentTypeTitles(cshData);
	this.debug(`Main content type titles from CSH: ${mainContentTypesTitles}`);
	const mainContentTypeElements = await po.getElement(`Content Box > Main Content Types > Header Title`);
	const mainContentTypesTitlesFromUI = await Promise.all(mainContentTypeElements.map(item => item.getText()));
	this.debug(`Main content type titles from UI: ${mainContentTypesTitlesFromUI}`);
	chaiExpect(mainContentTypesTitlesFromUI).to.be.eql(mainContentTypesTitles, `Main Content Types Titles don't match CSH data!`);

	const contentTypeGroups = await getContentTypeTitles(cshData);
	for (let i = 0; i < contentTypeGroups.length; i++) {
		this.debug(`Content type titles from CSH: ${contentTypeGroups[i]}`);
		const contentTypeElements = await po.getElement(`Content Box > #${i + 1} of Main Content Types > Content Types > Title`);
		const contentTypesTitlesFromUI = await Promise.all(contentTypeElements.map(item => item.getText()));
		this.debug(`Content type titles from UI: ${contentTypesTitlesFromUI}`);
		chaiExpect(contentTypeGroups[i]).to.be.eql(contentTypesTitlesFromUI, `[Content Box > #${i + 1} of Main Content Types > Content Types > Title] don't match CSH data`);
	}
});

Then(/^"Code Boxes" should match "([^"]*)" csh data$/, async function (cshDataKey) {
	this.info(`"Code Boxes" should match "${cshDataKey}" csh data`);
	const codeBoxesElement = await po.getElement(`Code Boxes`);
	const firstCodeBoxesHeaderElement = await po.getElement(`#1 of Code Boxes > Header`);
	await stepFunctions.wait(firstCodeBoxesHeaderElement, `visible`, stepFunctions.timeouts.PAGE_LOAD_TIMEOUT);
	const codeBoxesHeadersElement = await po.getElement(`Code Boxes > Header`);
	const codeBoxesHeadersTextsFromUI = await Promise.all(codeBoxesHeadersElement.map(item => item.getText()));
	const countOfCodeBoxesOnUI = stepFunctions.getElementCount(codeBoxesElement);
	const cshData = memory.getValue(cshDataKey);
	const codeBoxesDataArray = cshData.filter(item => item.type === `listBox`);
	const countOfCodeBoxesInCsh = codeBoxesDataArray.length;
	const codeBoxesHeadersFromCsh = codeBoxesDataArray.map(item => item.boxTitle.toUpperCase());
	if (countOfCodeBoxesInCsh == countOfCodeBoxesOnUI) {
		const arrayOfCodeBoxesBoxItemsFromCsh = codeBoxesDataArray.map(codeBoxObj => codeBoxObj.boxItems.map(item => item.itemTitle));
		const arrayOfCodeBoxesBoxItemsFromUI = await Promise.all(codeBoxesHeadersElement.map(async (_header, index) => Promise.all((await po.getElement(`#${index + 1} of Code Boxes > Item Links`)).map(item => item.getText()))));
		chaiExpect(codeBoxesHeadersFromCsh).to.be.eql(codeBoxesHeadersTextsFromUI, `Text of Code Boxes Headers doesn't match CSH data!`);
		chaiExpect(arrayOfCodeBoxesBoxItemsFromCsh).to.be.eql(arrayOfCodeBoxesBoxItemsFromUI, `Arrays of Code Boxes Items Links don't match CSH data!`);
	} else {
		throw new Error(`Count of Code Boxes on UI and CSH doesn't match!`);
	}

	const tabbedBoxesCshDataArray = cshData.filter(item => item.type === `tabbedBox`);
	const tabbedBoxesHeadersArrayFromCsh = tabbedBoxesCshDataArray.map(tab => tab.boxTitle);
	const tabbedBoxesHeadersElement = await po.getElement(`State Box > Tab Buttons`);
	const tabbedBoxesHeadersArrayFromUI = await Promise.all(tabbedBoxesHeadersElement.map(item => item.getText()));
	chaiExpect(tabbedBoxesHeadersArrayFromUI).to.be.eql(tabbedBoxesHeadersArrayFromCsh, `Array of State Boxes Headers does not match csh data!`);
});

Then(/^I verify (state|canned search) json info$/, async function (stateOrCanned) {
	this.info(`I verify ${stateOrCanned} json info`);
	let wkVars;
	let initJson;
	let resultJson;
	if(stateOrCanned === `state`) {
		resultJson = await browser.execute(function () {
			return JSON.stringify(wkVars[`statesConfig`]);
		});
		initJson = statesJson;
	} else {
		resultJson = await browser.execute(function () {
			return JSON.stringify(wkVars[`feature.primarySource.curatedSearches`]);
		});
		initJson = cannedJson;
	}
	resultJson = JSON.parse(resultJson);
	chaiExpect(resultJson, `Dev's ${stateOrCanned} json has changed`).to.be.eql(initJson);
});

Then(/^"([^"]*)" should be displayed for all states( initials)?( starting with Federal)?$/, async function (element, initArg, fedArg) {
	this.info(`${element} should be displayed for all states ${initArg ? initArg : ``} ${fedArg ? fedArg : ``}`);
	const elementAlias = memory.getValue(element);
	const elementsToVerify = await po.getElement(elementAlias);
	const arrayOfBoxTitle = await Promise.all(elementsToVerify.map(item => item.getText()));
	const statesArray = [];
	if(initArg) {
		if (fedArg) {
			statesArray.push(`FED`);
		}
		statesJson.forEach(item => {
			statesArray.push(item.initials);
		});
	} else {
		if (fedArg) {
			statesArray.push(`Federal`);
		}
		statesJson.forEach(item => {
			statesArray.push(item.name);
		});
	}
	chaiExpect(arrayOfBoxTitle).to.deep.equal(statesArray);
});

Then(/^I verify Placeholders for Jurisdiction on Laws&Regs( starting with Federal)?$/, async function (fedArg) {
	this.info(`I verify Placeholders for Jurisdiction on Laws&Regs${fedArg ? fedArg : ``}`);
	const elementsToVerify = await po.getElement(`Search Bar > Jurisdiction Dropdown > Items`);
	const statesArray = statesJson.map(item => item.initials);
	if (fedArg) {
		statesArray.unshift(`FED`);
	}
	for (let i = 0; i < elementsToVerify.length; i++) {
		await elementsToVerify[i].click();
		const placeholder = await po.getElement(`Search Bar > Jurisdiction Dropdown > Placeholder`);
		const placeholderText = await placeholder.getText();
		chaiExpect(placeholderText).to.be.eql(statesArray[i]);
		await elementsToVerify[i].click();
	}
});

Then(/^"([^"]*)"( Effective)? date should( not)? be (before|after)( or the same as)? (?:"([^"]*)"|current date)$/,
	async function (date1Alias, parseEffective, notArg, validation, inclusive, date2Alias) {
		let date1 = memory.getValue(date1Alias);
		const date2 = memory.getValue(date2Alias);
		if (parseEffective) {
			const dateArray = date1.replace(`Effective `, ``).split(`/`);
			dateArray.unshift(dateArray.pop());
			date1 = dateArray.join(`/`);
		}
		this.info(`${date1} date should${notArg || ``} be ${validation}${inclusive || ``} ${date2 || `today`}`);
		const dateToVerify = new Date(date1);
		const expectedDate = date2Alias ? new Date(date2) : new Date(Date.now());
		const verificationMethod = `${validation}${inclusive ? `OrEqual` : ``}Date`;
		chaiExpect(dateToVerify).to[notArg ? `not` : `be`][verificationMethod](expectedDate);
	}
);

Then(/^"([^"]*)" should( not)? be in viewport$/, async function (elementAlias, notArg) {
	const elementName = memory.getValue(elementAlias);
	this.info(`"${elementName}" should be in viewport`);
	const element = await po.getElement(elementName);
	return browser.waitUntil(async () => {
		const isInViewport = await browser.execute(stepFunctions.isInViewport, element);
		return isInViewport === !notArg;
	}, {
		timeout: timeouts.ELEMENT_LOAD_TIMEOUT,
		timeoutMsg: `[${elementAlias}] is${notArg ? ` ` : ` not `}in viewport!`
	});
});

Then(/^Text of all "([^"]*)" should (equal|contain|match) "([^"]*)"( ignoring case)?( ignoring whitespaces)?$/,
	async function (elementAlias, condition, textAlias, ignoreCase, ignoreWhitespaces) {
		const elementName = memory.getValue(elementAlias);
		const expectedText = memory.getValue(textAlias);
		this.info(`Text of all "${elementName}" should ${condition} "${expectedText}"`);
		const elements = await po.getElement(elementName);
		const arrayOfElementTexts = await Promise.all(elements.map(element => element.getText()));
		const fullText = arrayOfElementTexts.reduce((full, current) => full + current, ``);
		const areEqual = stepFunctions.compareStrings(fullText, expectedText, condition, ignoreCase, ignoreWhitespaces);
		chaiExpect(areEqual).to.eql(true, `[${fullText}] does not ${condition} [${expectedText}]`);
	}
);

Then(/^Size of "([^"]*)" should be "([^"]*)" by "([^"]*)"$/, async function (elementAlias, height, width) {
	const expectedDimensions = {
		height: parseInt(height, 10),
		width: parseInt(width, 10)
	};
	const elementName = memory.getValue(elementAlias);
	this.info(`Size of ${elementName} should be "${height}" by "${width}"`);
	const elementToCheck = await po.getElement(elementName);
	const dimensions = await elementToCheck.getSize();
	chaiExpect(dimensions).to.eql(expectedDimensions);
});
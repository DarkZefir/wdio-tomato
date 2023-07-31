const memory = require(`@cucumber-e2e/memory2`);
const { po } = require(`@cucumber-e2e/po2`);
const { expect: chaiExpect } = require(`chai`);
const scripts = require(`../support/scripts`);

const timeouts = {
	PAGE_LOAD_TIMEOUT: 60 * 1000,
	ELEMENT_LOAD_TIMEOUT: 20 * 1000,
	EMAIL_DELIVER_LOAD_TIMEOUT: 120 * 1000
};

const validation = {
	PRESENT: `present`,
	CLICKABLE: `clickable`,
	VISIBLE: `visible`,
	SELECTED: `selected`,
	GONE: `gone`
};
async function ECHelper(element, validationType, reverse, timeout, timeoutMsg) {
	switch (validationType) {
	case validation.PRESENT:
		await element.waitForExist({ reverse, timeout, timeoutMsg });
		break;
	case validation.CLICKABLE:
		await element.waitForClickable({ reverse, timeout, timeoutMsg });
		break;
	case validation.VISIBLE:
		await element.waitForDisplayed({ reverse, timeout, timeoutMsg });
		break;
	case validation.GONE:
		await element.waitForDisplayed({ reverse: true, timeout, timeoutMsg });
		break;
	case validation.SELECTED:
		await browser.waitUntil(async () => {
			const isSelected = await element.isSelected();
			return isSelected !== reverse;
		}, { timeout, timeoutMsg });
		break;
	default: throw new Error(`${validationType} validation is not expected`);
	}
}

async function wait(element, validation, timeout = timeouts.ELEMENT_LOAD_TIMEOUT, negate = false) {
	const timeoutMsg = `Element is ${negate ? `` : `not`} ${validation}`;
	await ECHelper(element, validation, Boolean(negate), timeout, timeoutMsg);
}

async function login(login, password) {
	const usernameInput = await po.getElement(`Login Form > Username Input`);
	const passwordInput = await po.getElement(`Login Form > Password Input`);
	const loginButton = await po.getElement(`Login Form > Login Button`);
	await usernameInput.waitForDisplayed();
	await usernameInput.setValue(login);
	const isPasswordInputDisplayed = await passwordInput.isDisplayed();
	if (!isPasswordInputDisplayed) {
		await loginButton.click();
	}
	await passwordInput.waitForDisplayed();
	await passwordInput.setValue(password);
	await loginButton.waitForClickable();
	await loginButton.click();
}

async function clearUserCustomization() {
	await browser.execute(scripts.setThesaurusState, true);
	await browser.executeAsync(scripts.showTableOfContentToolbar);
	await browser.executeAsync(scripts.cleanSavedSearches);
	await browser.executeAsync(scripts.removeUserFolders);
	await browser.executeAsync(scripts.cleanAnnotations);
	await browser.executeAsync(scripts.cleanFavorites);
	await browser.executeAsync(scripts.cleanVisitedLinks);
	if (!process.env.ENV.includes(`PX`)) {
		await browser.execute(scripts.setDefaultPracticeArea, `All Content`);
	}
	await browser.execute(scripts.setOpenInNewTabToFalse);
	await browser.deleteCookie(`_gid`);
	await browser.deleteCookie(`_gat`);
	await browser.deleteCookie(`_ga`);
	await browser.deleteCookie(`browser_session_guard`);
}

async function switchTab(idToSwitch) {
	if (idToSwitch) {
		await browser.switchToWindow(idToSwitch);
	} else {
		throw new Error(`Tab is out of range!`);
	}
}

async function waitForBrowserTabAndSwitch(tab) {
	let tabToSwitchId;
	if (tab === `new`) {
		const initialArrayOfWindowHandles = await memory.getValue(`$tabHandles`);
		let currentTabsArray = [];
		if (!initialArrayOfWindowHandles) {
			throw new Error(`No current tabs array found! Please make sure you have used the [I remember number of browser tabs] step prior to this step!`);
		}
		memory.setValue(`tabHandles`, undefined);
		await browser.waitUntil(async () => (await browser.getWindowHandles()).length > initialArrayOfWindowHandles.length, { timeout: timeouts.PAGE_LOAD_TIMEOUT });
		currentTabsArray = await browser.getWindowHandles();
		const newTab = initialArrayOfWindowHandles.concat(currentTabsArray).filter((el, i, arr) => arr.indexOf(el) === arr.lastIndexOf(el));
		await switchTab(newTab[0]);
	} else {
		await browser.waitUntil(async () => (await browser.getWindowHandles()).length > 1, { timeout: timeouts.PAGE_LOAD_TIMEOUT });
		const currentTab = await browser.getWindowHandle();
		const allTabs = await browser.getWindowHandles();
		switch (tab) {
		case `first`:
			tabToSwitchId = allTabs[0];
			break;
		case `last`:
			tabToSwitchId = allTabs[allTabs.length - 1];
			break;
		case `next`:
			tabToSwitchId = allTabs[allTabs.indexOf(currentTab) + 1];
			break;
		default:
			tabToSwitchId = allTabs[parseInt(tab) - 1];
			break;
		}
		await browser.waitUntil(async () => (await browser.getWindowHandles()).includes(tabToSwitchId), { timeout: timeouts.PAGE_LOAD_TIMEOUT });
		await switchTab(tabToSwitchId);
	}
}

function verify(firstElement, secondElement, validation, notArg) {
	const expect = notArg ? chaiExpect(firstElement).to.not : chaiExpect(firstElement).to;
	switch (validation) {
	case `equal to`:
		return expect.equal(secondElement);
	case `more than`:
		return expect.above(secondElement);
	case `less than`:
		return expect.below(secondElement);
	case `contain`:
		return expect.contain(secondElement);
	case `match`:
		return expect.match(secondElement);
	default:
		throw new Error(`Wrong comparison parameter provided! [${validation}]`);
	}
}

function compareNumbers(firstNumber, secondNumber, validation, notArg) {
	let result;
	switch (validation) {
	case `equal to`:
		result = firstNumber === secondNumber;
		break;
	case `more than`:
		result = firstNumber > secondNumber;
		break;
	case `less than`:
		result = firstNumber < secondNumber;
		break;
	default:
		throw new Error(`Wrong comparison parameter provided! [${validation}]`);
	}
	return notArg ? !result : result;
}

function compareStrings(firstString, secondString, condition, ignoringCase, ignoringWhitespaces, ignoringPunctuation, notArg) {
	let result;
	if (ignoringWhitespaces) {
		firstString = firstString.replace(/(\r\n|\n|\r|\s)/gm, ``);
		secondString = secondString.replace(/(\r\n|\n|\r|\s)/gm, ``);
	}
	if (ignoringPunctuation) {
		firstString = firstString.replace(/[^\w\s]|_/gm, ``);
		secondString = secondString.replace(/[^\w\s]|_/gm, ``);
	}
	if (ignoringCase) {
		firstString = firstString.toLowerCase();
		secondString = secondString.toLowerCase();
	}
	switch (condition) {
	case `contain`: {
		result = firstString.includes(secondString);
		break;
	}
	case `match`: {
		result = firstString.match(secondString) !== null;
		break;
	}
	default: {
		result = firstString === secondString;
	}
	}
	return notArg ? !result : result;
}

async function checkIfFilterIsExpanded(selector) {
	const chevron = await po.getElement(`${selector} > Chevron`);
	const isChevronDisplayed = await chevron.isDisplayed();
	if (isChevronDisplayed) {
		const classes = await chevron.getAttribute(`class`);
		return classes.includes(`expanded`);
	} else return false;
}

async function selectPreSearchFilters(filtersString) {
	const arrayOfFiltersToSelect = filtersString.split(` > `);
	let i = 0;
	const elementAliases = [
		`Presearch Filters`,
		`Filter Items`,
		`Filter Item Level0`,
		`Filter Item Level1`
	];
	const selectorEndings = [
		``,
		` > Title`,
		` > Label`,
		` > Input`
	];
	let selector = `Advanced Search Popup`;
	while (arrayOfFiltersToSelect.length > 0) {
		const filter = arrayOfFiltersToSelect.shift();
		selector += ` > #${filter} in ${elementAliases[i]}`;
		let selector2;
		if (arrayOfFiltersToSelect.length === 0) {
			selector2 = selector + selectorEndings[selectorEndings.length - 1];
		} else {
			selector2 = selector + selectorEndings[i];
		}
		const isExpanded = await checkIfFilterIsExpanded(selector);
		if (!isExpanded) {
			const item = await po.getElement(selector2);
			await wait(item, `clickable`, timeouts.ELEMENT_LOAD_TIMEOUT);
			await item.click();
		}
		i++;
	}
}

function getElementCount(elementArray) {
	return elementArray.filter(element => !!element.elementId).length;
}

function getSelectionText() {
	let text = ``;
	if (window.getSelection) {
		text = window.getSelection().toString();
	} else if (document.selection && document.selection.type != `Control`) {
		text = document.selection.createRange().text;
	}
	return text;
}

function isInViewport(elem) {
	const bounding = elem.getBoundingClientRect();
	return (
		bounding.top >= 0 &&
        bounding.left >= 0 &&
        bounding.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        bounding.right <= (window.innerWidth || document.documentElement.clientWidth)
	);
}

module.exports = {
	waitForBrowserTabAndSwitch,
	verify,
	compareNumbers,
	compareStrings,
	ECHelper,
	wait,
	clearUserCustomization,
	selectPreSearchFilters,
	getElementCount,
	getSelectionText,
	isInViewport,
	login,
	timeouts,
	...validation
};

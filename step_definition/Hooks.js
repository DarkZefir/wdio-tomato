const { Before, After, AfterStep, setDefaultTimeout, Status, setParallelCanAssign} = require(`@cucumber/cucumber`);
const { po } = require(`@cucumber-e2e/po2`);
const memory = require(`@cucumber-e2e/memory2`);
const { remote } = require(`webdriverio`);
const app = require(`../page_object/App`);
const constants = require(`../memory`);
const isHeadless = process.env.HEADLESS === `true` ? `--headless` : ``;

setDefaultTimeout(60000);

setParallelCanAssign(function (currentScenario, runningScenarios) {
	const hasTag = (scenario, tagName) => scenario.tags.some(t => t.name === tagName);
	// Only one scenario marked with a tag for sequential running can run at a time
	return constants.tagsToRunSequentially.every(tagName => {
		return !hasTag(currentScenario, tagName) || runningScenarios.every(p => !hasTag(p, tagName));
	});
});

Before(async function () {
	global.browser = await remote(
		{
			logLevel: `warn`,
			waitforTimeout: 15000,
			capabilities: {
				browserName: `chrome`,
				'goog:chromeOptions': {
					args: [
						`--window-size=1920,1080`,
						isHeadless
					]
				}
			},
			services: [`devtools`]
		}
	);

	po.init(browser, {
		timeout: 15000
	});
	po.register(app);
	memory.register(constants);
	// setting custom base url
	if (process.env.BASE_URL) memory.setValue(`url`, process.env.BASE_URL);

	const puppeteer = await browser.getPuppeteer();
	const context = puppeteer.defaultBrowserContext();
	context.overridePermissions(memory.getValue(`$url`), [`clipboard-read`]);
});

Before(async function (scenario) {
	this.info(`Scenario: ${scenario.pickle.name}`);
	this.browserLogs = [];
	const puppeteer = await browser.getPuppeteer();
	const pages = await puppeteer.pages();
	pages[0].on(`console`, message => this.browserLogs.push(`${message.type().toUpperCase()}: ${message.text()}`));
});

AfterStep(function () {
	if (this.browserLogs.length > 0) {
		this.attach(Buffer.from(this.browserLogs.join(`\n`)).toString(`base64`), `application/json`);
		this.browserLogs = [];
	}
});

After(async function (scenario) {
	if (scenario.result.status === Status.FAILED) {
		this.error(scenario.result.message);
		const puppeteer = await browser.getPuppeteer();
		const pages = await puppeteer.pages();
		const client = await pages[0].target().createCDPSession();
		const screenshot = await client.send(`Page.captureScreenshot`, {
			format: `png`
		});
		this.attach(screenshot.data, `image/png`);
	}
	await browser.deleteSession();
});

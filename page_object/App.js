const LoginPage = require(`./global/LoginPage`);
const BasePage = require(`./global/BasePage`);
const HomePage = require(`./global/HomePage`);
const ReadPage = require(`./global/ReadPage`);
const ResultsPage = require(`./global/ResultsPage`);
const LawsAndRegulationsPage = require(`./global/LawsAndRegulationsPage`);
const TreatiesPage = require(`./global/TreatiesPage`);
const TopicsPage = require(`./global/TopicsPage`);
const PracticalContentPage = require(`./global/PracticalContentPage`);
const PracticalContentResultsPage = require(`./global/PracticalContentResultsPage`);
const SmartChartsPage = require(`./global/SmartChartsPage`);

class App {
	constructor(...pages) {
		for (const page of pages) {
			for (const element in page) {
				if (this[element]) {
					console.warn(`element ${element} duplicated`);
				}
				this[element] = page[element];
			}
		}
	}
}

const app = new App(
	new BasePage(),
	new LoginPage(),
	new ReadPage(),
	new HomePage(),
	new ResultsPage(),
	new LawsAndRegulationsPage(),
	new TreatiesPage(),
	new TopicsPage(),
	new SmartChartsPage(),
	new PracticalContentPage(),
	new PracticalContentResultsPage()
);

module.exports = app;
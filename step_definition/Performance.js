const { When } = require(`@cucumber/cucumber`);
const memory = require(`@cucumber-e2e/memory2`);
const path = require(`path`);
const fs = require(`fs`);

When(/^I start "([^"]*)" measurement$/, function (measurementName) {
	this.info(`I start "${measurementName}" measurement`);
	const measurementStartTime = Date.now();
	return memory.setValue(measurementName, measurementStartTime);
});

When(/^I stop "([^"]*)" measurement$/, async function (measurementName) {
	this.info(`I stop "${measurementName}" measurement`);
	const currentTime = new Date(Date.now());
	const measurementStartTime = memory.getValue(`$${measurementName}`);
	if (!measurementStartTime) {
		throw new Error(`No measurement with "${measurementName}" found!`);
	}
	const measurementsStorageLocation = path.resolve(__dirname, `..`, `measurements`);
	const measurementObject = {
		name: measurementName,
		time: currentTime.getTime() - measurementStartTime,
		timestamp: currentTime.toUTCString()
	};
	if (!fs.existsSync(`${measurementsStorageLocation}/${measurementName}.measurement.json`)) {
		return fs.writeFileSync(`${measurementsStorageLocation}/${measurementName}.measurement.json`, JSON.stringify([measurementObject], null, `\t`), `utf8`);
	} else {
		const measurementsToRecord = JSON.parse(fs.readFileSync(`${measurementsStorageLocation}/${measurementName}.measurement.json`));
		measurementsToRecord.push(measurementObject);
		return fs.writeFileSync(`${measurementsStorageLocation}/${measurementName}.measurement.json`, JSON.stringify(measurementsToRecord, null, `\t`), `utf8`);
	}
});

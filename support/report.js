const report = require(`cucumber-html-reporter`);

report.generate({
	theme: `bootstrap`,
	jsonFile: `./report/report.json`,
	output: `./report/report.html`,
});

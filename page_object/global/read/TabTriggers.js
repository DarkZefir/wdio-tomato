const { $ } = require(`@cucumber-e2e/po2`);

class TabTriggers {
	selector = `.triggers, .buttonsContainer`;

	Contents = $(`button.link.content`);
	Information = $(`button.link.info`);
	History = $(`button.link.history`);
	Footnotes = $(`button.link.footnotes, .footnotesButton`);
	RelatedDocuments = $(`button.link.related`);
}
module.exports = TabTriggers;
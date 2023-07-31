const { $, $$ } = require(`@cucumber-e2e/po2`);

class ResultItem {
	selector = `ch-document-list-item div.item`;

	DocumentTitle = $(`[bo-html*=Title],.docTitle`);
	Checkbox = $(`input[type=checkbox]`);
	PracticeToolsTag = $(`.practice_tools`);
	Index = $(`.index`);
	Link = $(`a.link`);
	HighlightedPhrases = $$(`.itemsList .item strong, b`);
}

module.exports = ResultItem;

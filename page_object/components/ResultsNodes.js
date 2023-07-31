const { $, $$ } = require(`@cucumber-e2e/po2`);

class ResultsNodes {
	selector = `results-node`;

	Content = $(new Content());
	InfoBar = $(new InfoBar());
	SectionTitles = $$(new SectionTitles());
	InfoIcon = $(`a.info-icon`);
	CollapseButton = $(`div.label span.leaf-open-button.expanded`);
	ExpandButton = $(`div.label span.leaf-open-button:not(.expanded)`);
	Headers = $$(`th.answer-header .answer-header-item`);
	HeaderTitles = $$(`th.answer-header .answer-header-item`);
}

class Content {
	selector = `.answers-list`;

	Rows = $$(`tbody tr.answer`);
}

class InfoBar {
	selector = `.answer-note-content`;

	InfoIcon = $(`span.icon`);
	XIcon = $(`.close`);
}

class SectionTitles {
	selector = `div.label`;

	LeafTitle = $(`span.leaf-title`);
	HighlightUpdates = $(`.highlight-updates-container`);
}

module.exports = ResultsNodes;

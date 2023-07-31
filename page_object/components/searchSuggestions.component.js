const { $, $$ } = require(`@cucumber-e2e/po2`);

class SearchSuggestions {
	constructor(selector) {
		this.selector = selector;
	}

	RecentSearchesCluster = $(new SearchSuggestionsCluster(`.recent-searches`));
	MostRelevantCluster = $(new SearchSuggestionsCluster(`.most-relevant`));
	TitlesCluster = $(new SearchSuggestionsCluster(`.titles`));
	QandACluster = $(new SearchSuggestionsCluster(`.q\\&a`));
	CitationsCluster = $(new SearchSuggestionsCluster(`.group citations`));
}

class SearchSuggestionsCluster {
	constructor(selector) {
		this.selector = selector;
	}

	ClusterTitle = $(`.group-title`);
	Suggestions = $$(new Suggestions());
}

class Suggestions {
	selector = `.suggestion`;

	AnswerPopup = $(`.suggestion .wordwheel-answer.position-right.visible`);
	Text = $(`.suggestion .text`);
	TextHighlights = $$(`.suggestion .text .ui-match`);
	Time = $(`.suggestion .time`);
}

module.exports = SearchSuggestions;

const { $, $$ } = require(`@cucumber-e2e/po2`);
const ToolbarButtons = require(`./toolbarButtons.component`);

class resultsToolbar {
	selector = `.toolbar`;

	ToolbarButtons = $(new ToolbarButtons());
	SearchResultsBoxFirstRow = $(new SearchResultsBoxRow(`.titleWrapper:first-of-type`));
	SearchResultsBoxSecondRow = $(new SearchResultsBoxRow(`.titleWrapper:last-of-type`));
	AutoCorrectionHeader = $(new AutoCorrectionHeader());
	OpenInNewTabCheckbox = $(`.openInNewTab input[type="checkbox"]`);
	TitleBar = $(`.titleBar`);
	SearchInformationIcon = $(`.titleBar .info`);
	SaveSearchButton = $(`.titleBar .saveSearchBtn`);
	ShareThisSearchButton = $(`.titleBar .shareSearchBtn`);
	SearchQuery = $(`.titleBar .queryContainer`);
	CurrentSearchQuery = $(`.titleBar .titleContainer .titleWrapper.currentSearchQuery .queryContainer`);
	PreviousSearchQuery = $(`.titleBar .titleContainer .titleWrapper.previousSearchQuery .queryContainer`);
	AutoCorrectedQuery = $(`.titleBar .autoCorrectedSearch .query`);
	SavedSearchName = $(`.titleBar .savedSearchTitleContainer .queryContainer`);
	HitCount = $(`.titleBar .title .hitCount`);
	Title = $(`.titleBar .titleWrapper`);
	SelectAllCheckbox = $(`.buttons .selectAll input[type="checkbox"]`);
}

class SearchResultsBoxRow {
	constructor(selector) {
		this.selector = selector;
	}
	TotalResultsText = $(`.resultsTotal`);
	QueryContainer = $(`.queryContainer`);
}

class AutoCorrectionHeader {
	selector = `.titleBar .autoCorrectionHint`;

	Suggestions = $$(`.originalSearch .query`);
	AutoCorrectedSearch = $(`.autoCorrectedSearch`);
	OriginalSearchQuery = $(`.originalSearch`);
	SearchInsteadForTerm = $(`.originalSearch .query`);
}

module.exports = resultsToolbar;
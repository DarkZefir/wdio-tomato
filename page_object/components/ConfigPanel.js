const { $, $$ } = require(`@cucumber-e2e/po2`);

class ConfigPanel {
	selector = `.config-panel`;

	StateFilter = (new StateFilter());
	TopicsFilter = (new TopicsFilter());
	ExpandIcon = $(`a[title =\"Expand all\"]`);
	CollapseIcon = $(`a[title =\"Collapse all\"]`);
	RowsIcon = $(`.smart-charts-results-displaying-options a.display-row `);
	ColumnsIcon = $(`.smart-charts-results-displaying-options a.display-column`);
	PrintIcon = $(`.print-icon`);
	DownloadIcon = $(`.download-icon`);
	CalendarIcon = $(`.ion-android-calendar`);
	ConfigButton = $(`a.config-button`);
	FavoritesButton = $(`button.favorite-icon`);
	ConfigureButton = $(`a.config-button`);
	CheckedFavoritesButton = $(`button.favorite-icon.remove`);
	UncheckedFavoritesButton = $(`button.favorite-icon:not(.remove)`);
	HighlightDateInfo = $(`.highlight-date-info`);
	ClearHighlightsButton = $(`.highlight-date-info .remove-highlight`);
	ViewResultsButton = $(`button.wk-button-success`);
	DisabledViewResultsButton = $(`button.wk-button-secondary`);
}

class StateFilter {
	selector = `.smart-charts-state-filter`;

	Title = $(`.filter-header .filter-title`);
	Items = $$(`.smart-charts-state-item`);
	ItemTitles = $$(`.smart-charts-state-item span`);
	SelectedTitles = $$(`.smart-charts-state-item .selected`);
	Checkbox = $$(`.smart-charts-state-item input`);
	CheckedItems = $$(`input:checked`);
	Links = $$(`a.filter-action-all span`);
}

class TopicsFilter {
	selector = `.smart-charts-topic-filter`;

	Title = $(`.filter-header .filter-title`);
	NoResultsBox = $(`.error-box`);
	Message = $(`.error-msg`);
	XIcon = $(`.wk-icon-filled-close`);
	Links = $$(`a.filter-action-all span`);
	TopicSearchInput = $(`input.wk-search-input`);
	ClearTopicInput = $(`.clear-button-container`);
	SearchButton = $(`button.wk-search-submit`);
	ExpandButtons = $$(`.wk-tree-expandable-action.wk-tree-node-action`);
	TopicCheckboxes = $$(`.wk-tree-node-action-checkbox`);
	CheckedTopicCheckboxes = $$(`.wk-tree-node-action-checkbox:checked`);
	Contents = $$(`.wk-tree-node-label`);
	HighlightedItems = $$(`.wk-tree-highlighted-item`);
	FavoritesButton = $(`button.favorite-icon`);
}

module.exports = ConfigPanel;

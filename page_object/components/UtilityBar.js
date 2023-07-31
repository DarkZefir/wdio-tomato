const { $ } = require(`@cucumber-e2e/po2`);

class UtilityBar {
	selector = `.smart-charts-result-options`;

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
}
module.exports = UtilityBar;
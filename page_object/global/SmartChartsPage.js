const { $, $$ } = require(`@cucumber-e2e/po2`);
const UtilityBar = require(`../components/UtilityBar`);
const ResultsNodes = require(`../components/ResultsNodes`);
const ConfigPanel = require(`../components/ConfigPanel`);
const CalendarWidget = require(`../components/smartChartsCalendarWidget.component`);
const SmartChartsFavoritesPopup = require(`../popup/SmartChartsFavoritesPopup`);

class SmartChartsPage {
	UtilityBar = $(new UtilityBar());
	ResultsNodes = $$(new ResultsNodes());
	ConfigPanel = $(new ConfigPanel());
	SmartChartsFavoritesPopup = $(new SmartChartsFavoritesPopup());
	CalendarWidget = $(new CalendarWidget());
	SmartChartResultTable = $(`.smart-charts-results`);
	Breadcrumbs = $$(`.smart-charts-results .leaf .section-title`);
	SmartChartsHeader = $(`.smart-charts-results tr.answer-header`);
	ConfigPanelOverlay = $(`.config-panel-overlay`);
	CitationLinks = $$(`a.link.osa-rsi-citation`);
	ExpandAllButton = $(`em.icon.ion-plus`);
	CollapseAllButton = $(`em.icon.ion-minus`);
	VerticalView = $(`.vertical-view`);
	HorizontalView = $(`.horizontal-view`);
	UpdatedRows = $(`.horizontal-view .updated`);
	UpdatedColumns = $(`.vertical-view .updated`);
	ColumnsIcon = $(`a.display-column`);
	RowsIcon = $(`a.display-row`);
}

module.exports = SmartChartsPage;

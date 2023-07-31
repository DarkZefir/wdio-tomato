const { $, $$ } = require(`@cucumber-e2e/po2`);

class PracticalContentResultsPage {
	ResultsClusters = $$(new ResultsCluster());
	ResultsList = $(`.main-content`);
	SearchResultsPanel = $(`.search-results-info`);
	DocumentsNumber = $(`.search-results-info .search-term:first-child`);
	ShareSearchButton = $(`.search-results-info .share-search-button`);

	NoResultsBox = $(`div.results-not-found`);
	BackToPracticalContentDashboardLink = $(`div.results-not-found .linkItem`);
	NoResultsSearchIcon = $(`div.results-not-found .wk-icon-search`);
}

class ResultsCluster {
	selector = `.cluster`;

	Header = $(`.cluster-header`);
	HeaderTitle = $(`.cluster-header .cluster-header-label`);
	HitsNumber = $(`.cluster-header .cluster-header-label span`);
	ResultsNumber = $(`.cluster-header .results-number`);
	SeeAll = $(`.cluster-header .cluster-header-see-all`);
	ExpandIcon = $(`.cluster-header .cluster-header-icon.collapsed`);
	CollapseIcon = $(`.cluster-header .cluster-header-icon.expanded`);
	ToggleSwitch = $(`.cluster-header .toggle-switch`);
	ActiveLabel = $(`.cluster-header .toggle-switch .switch-label.switch-label-on`);
	Labels = $$(`.cluster-header .toggle-switch .switch-label`);
	HeaderLabel = $(`.cluster-header-label`);

	ResultsPanel = $(`.search-results-info`);
	DocumentsNumber = $(`.search-results-info .search-term:first-child`);
	Items = $$(`.cluster-item`);
	ItemTitles = $$(`.cluster-item .cluster-item-text`);
	Links = $$(`.cluster-item a`);
	HighlightedPhrasesInDocumentTitles = $$(`mark`);
}

module.exports = PracticalContentResultsPage;
const { $, $$ } = require(`@cucumber-e2e/po2`);
const ResultsToolbar = require(`../components/resultsToolbar.component`);
const FilterGroup = require(`../components/resultsFilterGroup.component`);
const ResultItem = require(`../components/resultsItem.component`);
class ResultsPage {

	SearchResultItems = $$(new ResultItem());
	SmartChartsTitleBox = $(new SmartChartsTitleBox());
	Documents = $$(new Document());
	ResultsToolbar = $(new ResultsToolbar());
	Cluster = $$(new Cluster());
	FilterGroups = $$(new FilterGroup());
	SearchWithinFilterPill = $(`.selectedFilters .boxContent .item .ng-binding`);
	FilterPanel = $(`.narrowPanel`);
	ExpandFilterPanel = $(`.narrowPanel icon`);
	NonUCMDocuments = $$(`.flatList a.link:not(.ucmDocTitle)`);
	UCMDocuments = $$(`a.ucmDocTitle`);
	UCMDocumentsTitle = $$(`a.ucmDocTitle .docTitle`);
	SearchResultListHighlights = $$(`ch-document-list-item b`);
	Backbutton = $(`a.back`);
	NoResultsText = $(`.noResults`);
	SyntaxErrorText = $(`.syntaxError`);
	TotalResultsText = $(`.resultsTotal`);
	WithinResultsInfoText = $(`.withinResultsInfo`);
	QueryContainer = $(`.queryContainer`);

	FutureVersionsOnlyOnLabel= $(`.srl-future-version-switcher-on .cg-switch-text`);
	FutureVersionsOnlyOffLabel= $(`.srl-future-version-switcher-off .cg-switch-text`);
	FutureVersionsOnlyToggleOn= $(`.srl-future-version-switcher-on .cg-switch-base`);
	FutureVersionsOnlyToggleOff= $(`.srl-future-version-switcher-off .cg-switch-base`);
	FutureVersionsToggle = $(`.srl-future-version-switcher-off`);

	SortingMenu = $(`.sorting`);
	SortingMenuButton = $(`.sorting button`);
	SortingMenuItems = $$(`.sorting ul li:not(.close)`);

	CitationResults = $$(`.itemsList .citationCombo`);
	CitationResultsTitle = $$(`.itemsList .citationCombo a.link .docTitle`);
	CitationResultsCheckbox = $$(`.itemsList .citationCombo input`);

	CitationMatchesHeader = $(`.resultsGroupTitle:not(.keyword)`);
	KeywordMatchesHeader = $(`.resultsGroupTitle.keyword`);
	KeywordMatches = $$(`.itemsList [ng-class*=\"citationCombo\"]`);
	KeywordMatchesLink = $$(`.itemsList [ng-class*=\"citationCombo\"] a.link`);

	QuickAnswer = $(`.quickAnswersBox`);
	QuickAnswerTitles = $$(`.quickAnswersBox .title`);
	QuickAnswerLinks = $$(`.quickAnswersBox .link`);

	AddTo = $(`.addTo`);
	HighlightedPhrases = $$(`.itemsList .item strong, b`);
	HighlightedPhrase = $(`.itemsList .item strong, b`);
	HighlightedPhrasesInDocumentSummaries = $$(`.itemsList .item .summary strong, b`);
	HighlightedPhrasesInDocumentTitles = $$(`.itemsList .item .docTitle strong, b`);

	SeeAllClusterResultsLinks = $$(`.clusteredList .clusterFooter a .seeAll`);
	OtherDocumentTypesHint = $(`.other_document_types`);
	ResultsPane = $(`.itemsList .flatList`);
	DocumentType = $$(`.item .type`);
	AllElements = $(`body`);
}

class SmartChartsTitleBox {
	selector = `.smartChartsTileContainer`;

	Title = $(`.title`);
	TopicsContainer = $(`.topicsContainer`);
	TopicItem = $$(`.topicsContainer span .ng-binding`);
	JurisdictionContainer = $(`.jurisdictionsContainer`);
	JurisdictionItem = $$(`.jurisdictionsContainer span .ng-binding`);
}

class Document {
	selector = `ch-document-list-item div.item:not(.practiceTool)`;

	DocumentTitle = $(`.docTitle`);
	Checkbox = $(`.checkbox`);
	Link = $(`a.link`);
	Summary = $(`summary`);
	EffectiveDate = $(`.effectiveDate`);
}

class Cluster {
	selector = `.cluster`;

	ClusterHeader = $$(`.clusterHeader`);
	ClusterName = $$(`.clusterHeader .clusterName`);
	Documents = $$(`.docTitle`);
	Snippets = $$(`.summary`);
	SeeAllClusterResultsLink = $(`a .seeAll`);
}

module.exports = ResultsPage;

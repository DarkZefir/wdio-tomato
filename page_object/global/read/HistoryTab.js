const { $, $$ } = require(`@cucumber-e2e/po2`);

class HistoryTab {
	selector = `.sidePanel.historyTab`;

	HistoryItems = $$(new HistoryItems());
	CloseButton = $(`.closeButton`);
	LoadingIndicator = $(`.smallLoadingIndicator`);
}

class HistoryItems {
	selector = `.item`;

	CaseSignature = $(`div.title h3`);
	CitedByLink = $(`div.citedBy a`);
	CitationItemsLinks = $$(`.citationList .citation a`);
}

module.exports = HistoryTab;

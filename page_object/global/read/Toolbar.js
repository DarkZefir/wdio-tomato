const { $ } = require(`@cucumber-e2e/po2`);

class Toolbar {
	selector = `.toolbar.active, .document-toolbar`;

	HighlightCheckbox = $(`.highlightSearchTermsCheckbox, [name="switch-highlights"]`);
	PreviousHighlightButton = $(`.prevSearchTerm, .search-terms-navigation>div:nth-child(3)`);
	NextHighlightButton = $(`.nextSearchTerm, .search-terms-navigation>div:last-child`);
	PreviousResultsButton = $(`.searchResultsNav .openPrevDocument, button[title='Previous search result']`);
	NextResultsButton = $(`.searchResultsNav .openNextDocument, button[title='Next search result']`);
	PreviousDocumentButton = $(`.tocNav .openPrevDocument, button[title='Previous document']`);
	NextDocumentButton = $(`.tocNav .openNextDocument > span, button[title='Next document']`);
	ViewInNewWindow = $(`.openInNewWindow, button[title='View in New Window']`);
}

module.exports = Toolbar;

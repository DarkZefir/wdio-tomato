const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../components/dropdown.component`);
const ContentTree = require(`../components/contentTree.component`);
const Popup = require(`../components/popup.component`);

class PrintPopup extends Popup {
	selector = `.jumpstart-modal.document-export-box, .exportPopup.printPopupToc, .exportPopup.printTopicPopup, export-box.ng-scope.ng-isolate-scope div[role="document"]`;

	IncludeDropdown = $(new Dropdown(`.react-dropdown`));
	ContentTree = $(new ContentTree());
	PrintButton = $(`div.footer button:last-child`);
	IncludeLabel = $(`.section-print-include legend`);
	DocumentTitle = $(`.docTitle`);
	CancelButton = $(`button.cancel, button[aria-label="Close Print Overlay"]`);
	OptionsLabel = $(`.section-print-options legend, .section-print-options-topics legend`);
	IncludeNotesAndHighlightsLabel = $(`.subsection-print-include-notes-and-highlights label`);
	IncludeNotesAndHighlightsCheckbox = $(`.subsection-print-include-notes-and-highlights input`);
	IncludeSearchTermHighlightsLabel = $(`.subsection-print-include-search-term-highlights label, label.subsection-print-include-search-term-highlights `);
	IncludeSearchTermHighlightsCheckbox = $(`.subsection-print-include-search-term-highlights input, .section-print-options-topics input`);
	ErrorMessages = $$(`.validation-errors, .export-errors-container`);
	LoadingIndicator = $(`.loading , .global-loading-indicator`);
}

module.exports = PrintPopup;
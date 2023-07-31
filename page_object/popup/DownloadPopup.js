const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../components/dropdown.component`);
const ContentTree = require(`../components/contentTree.component`);
const Popup = require(`../components/popup.component`);

class DownloadPopup extends Popup {
	selector = `.jumpstart-modal.document-export-box, .exportPopup.downloadPopupToc, bmb-popup.exportPopup.downloadPopup.ng-scope div.popup.visible.wk-modal-content, div[aria-labelledby="export-box"] div.wk-modal-content`;

	IncludeDropdown = $(new Dropdown(`.react-dropdown`));
	FormatDropdown = $(new Dropdown(`.section-download-format .menu, .section-download-format .react-dropdown`));
	ContentTree = $(new ContentTree());
	DocumentTitle = $(`.docTitle`);
	DownloadButton = $(`div.footer button:last-child`);
	IncludeLabel = $(`.section-download-include legend`);
	FormatLabel = $(`.section-download-format legend`);
	CancelButton = $(`button.btn.cancel, button[aria-label="Close Download Overlay"]`);
	OptionsLabel = $(`.section-download-options legend, .section-download-options-topics legend`);
	IncludeNotesAndHighlightsLabel = $(`.subsection-download-include-notes-and-highlights label`);
	IncludeNotesAndHighlightsCheckbox = $(`.subsection-download-include-notes-and-highlights input`);
	IncludeSearchTermHighlightsLabel = $(`.subsection-download-include-search-term-highlights label, .section-download-options-topics label`);
	IncludeSearchTermHighlightsCheckbox = $(`.subsection-download-include-search-term-highlights input, .section-download-options-topics input`);
	TemporaryMessage = $(`.temporary-message`);
	ErrorMessages = $$(`.validation-errors, .export-errors-container`);
	LoadingIndicator = $(`.loading , .global-loading-indicator`);
}

module.exports = DownloadPopup;
const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../components/dropdown.component`);
const ContentTree = require(`../components/contentTree.component`);
const Popup = require(`../components/popup.component`);

class EmailPopup extends Popup {
	selector = `.jumpstart-modal.document-export-box, .exportPopup.emailPopupToc, bmb-popup.exportPopup.emailPopup.ng-scope div.popup.visible.wk-modal-content, div[aria-labelledby="export-box"] div.wk-modal-content`;

	IncludeDropdown = $(new Dropdown(`.react-dropdown`));
	FormatDropdown = $(new Dropdown(`.section-email-format .menu, .section-email-format button, .section-email-format .react-dropdown`));
	ContentTree = $(new ContentTree());
	EmailButton = $(`.footer .btn:last-child`);
	EmailToLabel = $(`.section-email-to label`);
	EmailInput = $(`.section-email-to input`);
	EmailSubjectLabel = $(`.section-email-subject label`);
	EmailSubject = $(`.section-email-subject input`);
	EmailMessageLabel = $(`.section-email-message label`);
	EmailMessage = $(`.section-email-message textarea`);
	FormatLabel = $(`.section-email-format legend`);
	IncludeAttachmentLabel = $(`.section-email-include-attachment legend`);
	ErrorMessages = $$(`.validation-errors, .export-errors-container`);
	TemporaryMessage = $(`.temporary-message`);
	DocumentTitle = $(`.docTitle, .doc-title`);
	SelectContentLabel = $(`.selectContentTitle, .select-content-title`);
	OptionsLabel = $(`.section-email-options legend, .section-email-options-topics legend`);
	IncludeNotesAndHighlightsLabel = $(`.subsection-email-include-notes-and-highlights label`);
	IncludeNotesAndHighlightsCheckbox = $(`.subsection-email-include-notes-and-highlights input`);
	IncludeSearchTermHighlightsLabel = $(`.subsection-email-include-search-term-highlights label, .section-email-options-topics label`);
	IncludeSearchTermHighlightsCheckbox = $(`.subsection-email-include-search-term-highlights input, .section-email-options-topics input`);
	CancelButton = $(`button.cancel, .footer .btn:first-child`);
	LoadingIndicator = $(`.loading , .global-loading-indicator`);
}

module.exports = EmailPopup;
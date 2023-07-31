const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class NoticePopup extends Popup {
	selector = `.jumpstart-modal.confirm-modal .cg-modal-content, .wk-modal-content .wk-modal-content, .infoPopup, .delayedProcessingConfirmation, .contentNotFound .popup, .blankInfoPopup, bmb-popup.exportPopup.delayedProcessingConfirmation div.popup.visible.wk-modal-content, .modal .modal-content`;

	NoticeTitle = $(`.cg-modal-title, .wk-modal-title, .title`);
	NoticeMessage = $(`.content`);
	NoticeMessageLinks = $$(`a`);
	EmailInput = $(`input#EmailToField`);
	ErrorMessage = $(`.validation-errors`);
	CancelButton = $(`button.cancel`);
	OKButton = $(`button.send`);
	CloseButton = $(`.footer .close, .footer .button, .btn`);
	ProceedButton = $(`.remove`);
	XButton = $(`.wk-modal-close, .button.closeButton, button:last-child`);
}

module.exports = NoticePopup;

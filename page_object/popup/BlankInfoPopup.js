const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class BlankInfoPopup extends Popup {
	selector = `.infoPopup, .delayedProcessingConfirmation, .contentNotFound .popup, .blankInfoPopup, bmb-popup.exportPopup.delayedProcessingConfirmation div.popup.visible.wk-modal-content, .modal .modal-content`;

	NoticeMessage = $(`.content`);
	NoticeMessageLinks = $$(`.content a`);
	EmailInput = $(`input#EmailToField`);
	ErrorMessage = $(`.validation-errors`);
	CancelButton = $(`button.cancel`);
	OKButton = $(`button.send`);
	CloseButton = $(`.footer .close, .footer .button`);
	ProceedButton = $(`.remove`);
}

module.exports = BlankInfoPopup;
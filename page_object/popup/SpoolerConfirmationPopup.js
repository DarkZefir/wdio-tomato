const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SpoolerConfirmationPopup extends Popup {
	selector = `.exportPopup.delayedProcessingConfirmation`;

	Message = $(`.message`);
	EmailInput = $(`.emailInput input`);
	ValidationErrors = $(`.validation-errors`);
	OKButton = $(`.send`);
	CancelButton = $(`.cancel`);
}

module.exports = SpoolerConfirmationPopup;
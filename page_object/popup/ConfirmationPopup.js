const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class ConfirmationPopup extends Popup {
	selector = `.confirmPopup`;

	CancelButton = $(`button.left`);
	ConfirmButton = $(`button.right`);
	Message = $(`.content`);
}

module.exports = ConfirmationPopup;
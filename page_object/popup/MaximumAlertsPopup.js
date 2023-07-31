const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class MaximumAlertsPopup extends Popup {
	selector = `.maxAlerts .popup`;

	Message = $(`.content`);
	CloseButton = $(`button.right`);
}

module.exports = MaximumAlertsPopup;
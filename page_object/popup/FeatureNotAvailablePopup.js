const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class FeatureNotAvailablePopup extends Popup {
	selector = `.cg-modal-content`;

	Title = $(`.cg-modal-title`);
	Message = $(`.cg-modal-body-1-7-0`);
}

module.exports = FeatureNotAvailablePopup;
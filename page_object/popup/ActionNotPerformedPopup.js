const { $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class ActionNotPerformedPopup extends Popup {
	selector = `.actionNotPerformedPopup`;

	Items = $$(`ul li`);

}

module.exports = ActionNotPerformedPopup;

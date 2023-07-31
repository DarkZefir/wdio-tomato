const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class CustomizeNewsHeadlinesPopup extends Popup {
	selector = `.customizeNews`;

	GroupLabel = $(`.groupLabel`);
	Dropdown = $(`button.secondary`);
	DropdownItems = $$(`.overlay li`);
	SaveAndClose = $(`button.right`);
	Cancel = $(`button.left`);
}

module.exports = CustomizeNewsHeadlinesPopup;
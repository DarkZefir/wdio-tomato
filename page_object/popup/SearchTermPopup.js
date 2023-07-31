const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SearchTermPopup extends Popup {
	selector = `bmb-popup[name="searchTerm"]`;

	Content = $(`.content`);
	DeleteButton = $(`button.right`);
	CancelButton = $(`button.left`);
}

module.exports = SearchTermPopup;
const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class NewFolderPopup extends Popup {

	selector = `.worklistNew .popup`;

	NameInput = $(`.name input`);
	DescriptionTextarea = $(`.desc textarea`);
	SaveAndClose = $(`.footer button.save`);

}

module.exports = NewFolderPopup;

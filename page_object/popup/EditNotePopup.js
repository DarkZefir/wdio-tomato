const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class EditNotePopup extends Popup {
	selector = `.annotationEdit .popup`;

	EditNoteInput = $(`textarea`);
	SaveAndCloseButton = $(`.footer button.save`);
	DeleteButton = $(`.footer button.left`);
}

module.exports = EditNotePopup;

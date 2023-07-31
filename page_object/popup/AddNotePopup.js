const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class AddNotePopup extends Popup {
	selector = `.annotationAdd`;

	NoteInput = $(`.note textarea`);
	SaveAndClose = $(`.close.right`);
	Cancel = $(`.close:not(.right):not(.wk-modal-close)`);
}

module.exports = AddNotePopup;
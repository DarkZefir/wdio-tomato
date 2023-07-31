const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const Document = require(`../components/resultsItem.component`);

class HistoryNotesPopup extends Popup {
	selector = `.resultsPopup`;

	Documents = $$(new Document());
	SelectAllCheckbox = $(`.selectAll input`);
}

module.exports = HistoryNotesPopup;

const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const Document = require(`../components/resultsItem.component`);

class ResultsPopup extends Popup {
	selector = `.resultsPopup .popup`;

	Documents = $$(new Document());
	ResultsItem = $(`.itemsList`);
	SelectAllCheckbox = $(`.selectAll input`);
	ResultsCountLabel = $(`table .label`);
}

module.exports = ResultsPopup;

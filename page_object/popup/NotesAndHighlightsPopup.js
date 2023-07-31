const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../components/dropdown.component`);
const Popup = require(`../components/popup.component`);
const ToolbarButtons = require(`../components/toolbarButtons.component`);

class NotesAndHighlightsPopup extends Popup {
	selector = `.annotationOverlay`;

	SelectAllCheckbox = $(`input[title="Select / Deselect All"]`);
	Items = $$(`tr.item`);
	ItemTitles = $$(`tr.item .title a`);
	ItemTexts = $$(`tr.item .title .docText`);
	ItemDates = $$(`tr.item .date`);
	ItemCheckboxes = $$(`tr.item .checkbox input`);
	ToolbarButtons = $(new ToolbarButtons());
	Content = $(`.popup`);
	SearchInput = $(`input.searchInput`);
	SearchButton = $(`button.searchButton`);
	SortingMenu = $(new Dropdown(`span.menu`));
	CloseButton = $(`button.close:not(.left)`);
	DeleteButton = $(`button.close.left`);
	NoResultsText = $(`.noResults>.noResults`);
}

module.exports = NotesAndHighlightsPopup;

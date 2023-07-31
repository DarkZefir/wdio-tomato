const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SaveThisSearchPopup extends Popup {
	selector = `.savedSearches, .saveSearchMode, .saveSearch`;

	SortByMenu = $(new SortByMenu());
	InfoBanner = $(new InfoBanner());
	TableHeader = $(new TableHeader());
	Input = $(`input`);
	AddButton = $(`.save.inlineButton`);
	TableTitle = $(`.line span.title`);
	CloseButton = $(`button.close`);
	ErrorMessage = (`.error`);
	Delete = $(`button.delete`);
	Spinner = $(`.saving`);
	SaveAndClose = $(`button.save`);
	Cancel = $(`button.cancel`);
}

class TableHeader {
	selector = `.head`;

	SelectAllCheckbox = $(`.head input`);
	Name = $(`.name`);
	Alert = $(`.alert-name`);
	LastRun = $(`.lastrun`);
}

class InfoBanner {
	selector = `.hintContainer`;

	Message = $(`span.hint`);
	Link = $(`.link.underline`);
	XCloseButton = $(`.inlineHint .link.close`);
}

class SortByMenu {
	selector = `.sort`;

	Label = $(`span.label`);
	DropdownMenuArrow = $(`.arrow`);
	Items = $$(`.overlay li a`);
}

module.exports = SaveThisSearchPopup;
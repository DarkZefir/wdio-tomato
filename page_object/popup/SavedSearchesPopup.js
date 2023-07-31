const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SavedSearchesPopup extends Popup {
	selector = `.savedSearches, .saveSearchMode, .saveSearch`;

	Items = $$(new Items());
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

class Items {
	selector = `tr.item.table-row`;

	Name = $(`.name>a`);
	InfoIcon = $(`.info .infoIcon`);
	AlertSlider = $(`.buttonToggle.toggleIcon`);
	AlertSliderActive = $(`.buttonToggle.toggleIcon.active`);
	WarningMessage = $(`.active[ng-class="{'active': tooltipOn}"]`);
	LastRun = $(`.lastrun`);
	Checkbox = $(`input[type="checkbox"]`);
}

module.exports = SavedSearchesPopup;
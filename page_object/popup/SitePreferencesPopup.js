const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SitePreferencesPopup extends Popup {
	selector = `.sitePreferences`;

	PopupTitle = $(`.header .title`);
	PracticeAreaDropdown = $(new PracticeAreaDropdown());
	ShowToolbarLabel = $(`.showTocToolbar label`);
	ShowToolbarCheckbox = $(`input#showTocToolbar`);
	SaveAndClose = $(`.save`);
	Cancel = $(`.footer button[ng-click*="close"]`);
	HelpIcon = $(`ch-help-icon`);
}

class PracticeAreaDropdown {
	selector = `.menu`;

	Button = $(`button`);
	Label = $(`button span.label`);
	ResourcesList = $(`.resourcesList, .optionsList`);
	ResourcesListHeader = $(`.resourcesList .listHeader, .optionsList .listHeader:first-of-type`);
	ResourcesListItems = $$(`.resourcesList .listItem, .optionsList .listHeader:first-of-type ~ li.listItem:not(.listHeader:last-of-type ~ li.listItem)`);
	ResourcesListItemsLinks = $$(`.resourcesList .listItem a, .optionsList .listItem a`);
	PracticeAreasList = $(`.paList, .optionsList`);
	PracticeAreasListHeader = $(`.paList .listHeader, .optionsList .listHeader:last-of-type`);
	PracticeAreasListItems = $$(`.paList .listItem, .optionsList .listHeader:last-of-type ~ li.listItem`);
	PracticeAreasListItemsLinks = $$(`.paList .listItem a, .optionsList .listItem a`);
	SelctedItem = $(`a.selected`);
	Items = $$(`.overlay ul li:not(.close)`);
	ItemsLinks = $$(`.overlay ul li:not(.close) a`);
	Links = $$(`li a`);
	Close = $(`.overlay ul li.close`);
	List = $(`ul`);
}

module.exports = SitePreferencesPopup;
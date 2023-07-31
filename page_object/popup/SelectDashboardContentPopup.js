const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const Dropdown = require(`../components/dropdown.component`);

class SelectDashboardContentPopup extends Popup {
	selector = `bmb-popup[name='customizeBoxes']`;

	LoadingIndicator = $(`.loading , .global-loading-indicator`);
	Header = $(new Header());
	Content = $(new Content());
	ContentHeader = $(`.head`);
	ContentHeaderCheckbox = $(`.head input`);
	ContentHeaderName = $(`.head .name`);
	ReorderButton = $(`.reorder-btn`);
    Items = $$(`ul.content-list li`);
	SelectAllItemsCheckbox = $(`.head .checkbox input`);
	SaveAndClose = $(`button.right`);
	CancelButton = $(`button.left`);
}

class Content {
    selector = `.content`;

	Dropdowns = $$(new Dropdown(`.dropdownMenu`));
	ItemTitles = $$(`.customizableChildItemTitle`);
	LinksCheckedText = $$(`ul li input[type='checkbox']:checked + span`);
	LinksUncheckedText = $$(`ul li input[type='checkbox']:not(:checked) + span`);
	LinkCheckboxes = $$(`ul li input[type='checkbox']`);
	LinkTexts = $$(`.customizableItemTitle`);
	LinkCheckedCheckboxes = $$(`ul li input[type='checkbox']:checked`);
	LinkUncheckedCheckboxes = $$(`ul li input[type='checkbox']:not(:checked)`);
}

class Header {
	selector = `.headerBar`;

	GroupLabel = $(`.groupLabel`);
	GroupDropdown = $(new Dropdown(`.group .user`));
	DoNotDisplayGroup = $(`.hideGroup`);
	DoNotDisplayGroupText = $(`.hideGroup span span`);
	DoNotDisplayGroupCheckbox = $(`.hideGroup input`);
	ReorderButton = $(`div.customization-additional-menu a[title='REORDER ITEMS']`);
	ReorderButtonDisabled = $(`div.customization-additional-menu a[title='REORDER ITEMS DISABLED']`);
	DoneButton = $(`div.customization-additional-menu a[title='APPLY CHANGES']`);
}

module.exports = SelectDashboardContentPopup;
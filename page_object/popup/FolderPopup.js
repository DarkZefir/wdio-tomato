const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const Dropdown = require(`../components/dropdown.component`);
const ToolbarButtons = require(`../components/toolbarButtons.component`);

class FolderPopup extends Popup {

	selector = `bmb-popup.worklistsPopup.ng-scope div.popup.visible.wk-modal-content`;

	FoldersDropdown = $(new Dropdown(`.workspaceSelect.menu`));
	SortDropdown = $(new Dropdown(`.sort:not(.view) .menu`));
	ToolbarButtons = $(new ToolbarButtons());
	Items = $$(new Items());
	CreateNewFolderButton = $(`.header .actions .new`);
	Tags = $$(`.content .data .item td.tag .value`);
	SelectAllCheckbox = $(`thead input[type="checkbox"]`);
	ActionButton = $(`button.action`);
	DeleteFolderButton = $(`button.action`);
	HideButton = $(`button.action`);
	CloseButton = $(`.footer button.close`);
	EditFolderLink = $(`a.editWorklist`);
	FolderInfoIcon = $(`a.infoIcon`);
	RemoveFromFolderButton = $(`.footer button.remove`);
	HiddenFoldersList = $(`.content.hidden table`);
	HiddenFoldersListNames = $$(`.content.hidden table td.document.name`);
	HiddenFoldersListOwners = $$(`.content.hidden table td.document.owner`);
	HiddenFoldersListInfoIcons = $$(`.content.hidden table span.infoIcon`);
	EmptyFolderInfo = $(`.noresults`);
	NoFoldersInfo = $(`.noworklists`);
}

class Items {
	selector = `.content .data .item`;

	Checkbox = $(`input[type="checkbox"]`);
	DocumentTitle = $(`a.link span,a.ucmDocTitle span`);
	UcmDocumentTitle = $(`a.ucmDocTitle .docTitle`);
	Tag = $(`td.tag .value`);
	AddEditTagLink = $(`td.tag a`);
}

module.exports = FolderPopup;

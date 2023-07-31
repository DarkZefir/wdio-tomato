const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const Dropdown = require(`../components/dropdown.component`);
const ContentTree = require(`../components/contentTree.component`);

class AddToPopup extends Popup {

	selector = `.addToPopup, .add-to-modal`;

	Dropdowns = $$(new Dropdown(`.menu, .react-dropdown`));
	ContentTree = $(new ContentTree());
	FolderName = $(`.name input, .options:nth-child(3) input`);
	FolderDescription = $(`.desc textarea, .options:nth-child(4)`);
	SaveAndClose = $(`.right, .close-button`);
	Cancel = $(`.left.cancel, .delete-button`);
	Title = $(`.selectedTargetLabel, .options legend`);
	ErrorMessage = $(`.validation-errors`);
	SelectedItems = $$(`.selected`);
	AddToLevel1Checkboxes = $$(`.level-0 > * > * > input`);
	AddToLevel2Checkboxes = $$(`.level-1 > * > * > input`);
	AddToLevel3Checkboxes = $$(`.level-2 > * > * > input`);
	AddToLevel4Checkboxes = $$(`.level-3 > * > * > input`);
	AddToLevel5Checkboxes = $$(`.level-4 > * > * > input`);
	AddToLevel6Checkboxes = $$(`.level-5 > * > * > input`);
	AddToLevel1Texts = $$(`.level-0 > * > * > .content-tree-node-text`);
	AddToLevel2Texts = $$(`.level-1 > * > * > .content-tree-node-text`);
	AddToLevel3Texts = $$(`.level-2 > * > * > .content-tree-node-text`);
	AddToLevel4Texts = $$(`.level-3 > * > * > .content-tree-node-text`);
	AddToLevel5Texts = $$(`.level-4 > * > * > .content-tree-node-text`);
	AddToLevel6Texts = $$(`.level-5 > * > * > .content-tree-node-text`);
	AddToLevel7Texts = $$(`.level-6 > * > * > .content-tree-node-text`);
	AddToLevel3ExpandButton = $$(`.level-2 > * > * > .content-tree-node-text .content-tree-node-expandButton:not(.ng-hide)`);
	AddToLevel3CollapseButton = $$(`.level-2 > * > * > .content-tree-node-text .content-tree-node-collapseButton:not(.ng-hide)`);
}

module.exports = AddToPopup;
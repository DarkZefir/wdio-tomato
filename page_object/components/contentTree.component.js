const { $$ } = require(`@cucumber-e2e/po2`);

class ContentTree {
	selector = `.ch-content-tree, .content-tree-node`;

	SeeMoreLinks = $$(`.load-next`);
	AllContentNodesInTreeNodes = $$(`.content-tree-node-content`);
	AllContentNodesInTreeNodesCheckboxes = $$(`.content-tree-node-content input`);
	Level0ContentTreeNodes = $$(`.content-tree-node.level-0`);
	Level1ContentTreeNodes = $$(`.content-tree-node.level-1`);
	Level2ContentTreeNodes = $$(`.content-tree-node.level-2`);
	Level3ContentTreeNodes = $$(`.content-tree-node.level-3`);
	Level4ContentTreeNodes = $$(`.content-tree-node.level-4`);
	Level5ContentTreeNodes = $$(`.content-tree-node.level-5`);
	Level0ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-0 .content-tree-node-checkbox`);
	Level1ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-1 .content-tree-node-checkbox`);
	Level2ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-2 input`);
	Level3ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-3 .content-tree-node-checkbox`);
	Level4ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-4 .content-tree-node-checkbox`);
	Level5ContentTreeNodesCheckboxes = $$(`.content-tree-node.level-5 .content-tree-node-checkbox`);
	Level0ContentTreeNodesTitles = $$(`.level-0 > * > * > .content-tree-node-text`);
	Level1ContentTreeNodesTitles = $$(`.level-1 > * > * > .content-tree-node-text`);
	Level2ContentTreeNodesTitles = $$(`.level-2 > * > * > .content-tree-node-text`);
	Level3ContentTreeNodesTitles = $$(`.level-3 > * > * > .content-tree-node-text`);
	Level4ContentTreeNodesTitles = $$(`.level-4 > * > * > .content-tree-node-text`);
	Level5ContentTreeNodesTitles = $$(`.level-5 > * > * > .content-tree-node-text`);
	Level2ContentTreeNodesExpandButtons = $$(`.level-2 > * > * > .content-tree-node-text .content-tree-node-expandButton:not(.ng-hide)`);
	Level3ContentTreeNodesExpandButtons = $$(`.content-tree-node.level-3 .content-tree-node-expandButton:not(.ng-hide)`);
	Level2ContentTreeNodesCollapseButtons = $$(`.level-2 > * > * > .content-tree-node-text .content-tree-node-collapseButton:not(.ng-hide)"`);
	SelectedContentTreeNodes = $$(`.content-tree-node-content.selected`);
	SelectedContentTreeNodesCheckbox = $$(`.content-tree-node-content.selected input`);
	SelectedContentTreeNodesLabel = $$(`.content-tree-node-content.selected .content-tree-node-text`);
	NotSelectedContentTreeNodes = $$(`.content-tree-node-content:not(.selected)`);
	NotSelectedContentTreeNodesCheckbox = $$(`.content-tree-node-content:not(.selected) input`);
	NotSelectedContentTreeNodesLabel = $$(`.content-tree-node-content:not(.selected) .content-tree-node-text`);
}

module.exports = ContentTree;

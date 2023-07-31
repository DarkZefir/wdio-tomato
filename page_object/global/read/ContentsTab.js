const { $, $$ } = require(`@cucumber-e2e/po2`);
const DynamicComponent = require(`../../components/DynamicComponent`);

class ContentsTab {
	selector = `.sidePanel.contentTab`;

	MenuContainer = $(new MenuContainer());
	SelectedLink = $(new SelectedLink());
	CollapsedParentNode = $$(new ParentNode(`div[aria-level="1"][role="treeitem"].collapsed.expandable`));
	ExpandedParentNode = $$(new ParentNode(`div[aria-level="1"][role="treeitem"].expanded`));
	CollapsedFirstChildNode = $$(new FirstChildNode(`div[aria-level="2"][role="treeitem"].collapsed.expandable`));
	ExpandedFirstChildNode = $$(new FirstChildNode(`div[aria-level="2"][role="treeitem"].expanded`));
	CollapsedSecondChildNode = $$(new SecondChildNode(`div[aria-level="3"][role="treeitem"].collapsed.expandable`));
	ExpandedSecondChildNode = $$(new SecondChildNode(`div[aria-level="3"][role="treeitem"].expanded`));
	ExpandedThirdChildNode = $$(new ThirdChildNode(`div[aria-level="4"][role="treeitem"].expanded`));
	CollapsedThirdChildNode = $$(new ThirdChildNode(`div[aria-level="4"][role="treeitem"].collapsed.expandable`));
	ActivePathNodes = $$(new ActivePathNodes());
	Content = $(`.content`);
	RootTitle = $(`.root-title`);
	LoadingIndicator = $(`div[role="treeitem"].loading , .global-loading-indicator`);
	DocumentLinks = $$(`.wk-tree-node-label`);
	SeeMore = $(`.see-more-btn`);
	Nodes = $$(`.document-toc-node`);
	NodesLabels = $$(`.document-toc-node .label`);
}

class MenuContainer {
	selector = `.document-tooltip-toolbar, div.menu-container.top, div.menu-container.bottom, .wk-tooltip-open, .cg-tooltip-open`;

	SearchInput = $(`input.search-query-input`);
	SearchButton = $(`button.search-button`);
	Close = $(`span.close, span.close-button`);
	FavoriteButton = $(`button.favorite-add, button.favorite-icon:not(.favorite)`);
	FavoriteButtonChecked = $(`button.favorite-remove, button.favorite-icon.favorite`);
	QuickPrint = $(`button.quick-print, button.quick-print-icon`);
	QuickEmail = $(`button.quick-email, button.quick-email-icon`);
	AddTo = $(`button.add-to, button.add-to-icon`);
	Print = $(`button.print, button.print-icon`);
	Email = $(`button.email, button.email-icon`);
	Download = $(`button.download, button.download-icon`);
}

class SelectedLink {
	selector = `div.selected[role="button"] div.selected`;

	Link = $(`a`);
	MagnifyingGlass = $(`button.contentSearchIcon`);
}

class ActivePathNodes {
	selector = `.wk-tree-node-content.active-path-node, .wk-tree-node-body.active-path-node`;

	CollapseButton = $(`.collapse.wk-tree-node-prefix`);
	Item = $(`div.wk-tree-node-label`);
}

class ParentNode extends DynamicComponent {

	PathHeader = $(new Header(`div[aria-level="1"].wk-tree-node-body.active-path-node`));
	Header = $(new Header(`div[aria-level="1"].wk-tree-node-body`));
	ExpandButton = $(`div.wk-tree-node-prefix`);
}
class FirstChildNode extends DynamicComponent {

	PathHeader = $(new Header(`div[aria-level="2"].wk-tree-node-body.active-path-node`));
	Header = $(new Header(`div[aria-level="2"].wk-tree-node-body`));
	Links = $$(`div[aria-level="3"]>a, a.wk-tree-node-label`);
	ExpandButton = $(`div.wk-tree-node-prefix`);
	FirstLink = $(`div[role="treeitem"]>:first-child>div>a`);
}

class SecondChildNode extends DynamicComponent {

	Header = $(new Header(`div[aria-level="3"].wk-tree-node-body`));
	PathHeader = $(new Header(`div[aria-level="3"].wk-tree-node-body.active-path-node`));
	ExpandButton = $(`div.wk-tree-node-prefix`);
	Links = $$(`div[aria-level="4"]>a, a.wk-tree-node-label`);
}

class ThirdChildNode extends DynamicComponent {

	Header = $(new Header(`div[aria-level="4"].wk-tree-node-body`));
	PathHeader = $(new Header(`div[aria-level="4"].wk-tree-node-body.active-path-node`));
	ExpandButton = $(`div.wk-tree-node-prefix`);
	Links = $$(`div[aria-level="5"]>a`);
}

class Header extends DynamicComponent {

	Label = $(`span, .wk-tree-node-label`);
	MagnifyingGlass = $(`button.contentSearchIcon`);
	ExpandButton = $(`div.wk-tree-node-prefix`);
	CollapseButton = $(`div.wk-tree-node-prefix`);
}

module.exports = ContentsTab;

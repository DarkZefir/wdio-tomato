const { $, $$ } = require(`@cucumber-e2e/po2`);

class TaxFederalTopicsList {
	selector = `.dashboard .box`;

	TopLevelNode = $$(new TopLevelNode());
	ActiveTopLevelNode = $$(new ActiveTopLevelNode());
	IRCTreeContent = $(new IRCTreeContent());
	ModeSwitch = $(`.modeSwitchButton`);
	TopicsTreeContainer = $(`#topicsTreeContainer`);
}

class TopLevelNode {
	selector = `#topicsTreeContainer .topLevelNodeContainer`;

	Title = $(`.topTitle`);
	ExpandButton = $(`.topicExpandButton`);
	ActiveExpandButton = $(`.topicExpandButton.active`);
	TopLevelNodeLink = $(`.topLevelNodeTitle a`);
	ContainerTitles = $$(`.groupingNodeContainer > topic-anchor render-target .topicAnchor`);
	TopicLinks = $$(`.leafNodesContainer .topicAnchor`);
}

class ActiveTopLevelNode {
	selector = `#topicsTreeContainer .topLevelNodeContainer.active`;

	NodeContainers = $$(new NodeContainer());
	Title = $(`.topTitle`);
	ActiveExpandButton = $(`.topicExpandButton.active`);
	TopLevelNodeLink = $(`.topLevelNodeTitle a`);
}

class NodeContainer {
	selector = `.groupingNodeContainer`;

	ContainerTitle = $$(`>topic-anchor a`);
	TopicLinks = $$(`.leafNodesContainer .topicAnchor`);
}

class IRCTreeContent {
	selector = `.treeContent .treeLevel`;

	IRCTopicsList = $(new IRCTopicsList());
	Nodes = $$(`.treeNode`);
	NodeExpandButtons = $$(`.treeNode .treeNodeExpandButton`);
	NodeTitles = $$(`.treeNode span:not(.treeNodeExpandButton)`);
}

class IRCTopicsList {
	selector = `.sectionTreeLevelContainer`;

	Name = $(`.ircTopicsItem.ircTopicsSorting`);
	SortingIcon = $(`.ircTopicsSortingIcon`);
	CategoryHead = $(`.ircTopicsItem.category span:not(.ircPathButton)`);
	SeeIRCPath = $(`span.ircPathButton`);
	IRCLinks = $$(`a.topicAnchor`);
	Categories = $$(`span.ircTopicsParent`);
}

module.exports = TaxFederalTopicsList;
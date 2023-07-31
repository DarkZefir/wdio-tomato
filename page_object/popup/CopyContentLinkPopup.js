const { $, $$ } = require(`@cucumber-e2e/po2`);
const ContentLinkNodes = require(`../components/contentLinkNodes.component`);
const Popup = require(`../components/popup.component`);

class CopyContentLinkPopup extends Popup {
	selector = `.saveLinks`;

	Nodes = $$(new ContentLinkNodes(`.saveLinksTreeNode`));
	SelectedNodes = $$(new ContentLinkNodes(`.saveLinksTreeNode--selected`));
	FirstChildNodes = $$(new ContentLinkNodes(`.saveLinksTreeNode--expanded .saveLinksTreeNode`));
	SecondChildNodes = $$(new ContentLinkNodes(`.saveLinksTreeNode--expanded .saveLinksTreeNode .saveLinksTreeNode`));
	Title = $(`.header span.title`);
	SubTitle = $(`.saveLinksTree__header`);
	CloseXIcon = $(`div.wk-modal-close.close`);
	CancelButton = $(`.saveLinksTree__button--cancel`);
	CopyButton = $(`.saveLinksTree__button--copy`);
}

module.exports = CopyContentLinkPopup;
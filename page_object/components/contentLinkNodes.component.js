const { $ } = require(`@cucumber-e2e/po2`);

class ContentLinkNodes {
	constructor(selector) {
		this.selector = selector;
	}

	Title = $(`.saveLinksTreeNode__title`);
	Checkbox = $(`.saveLinksTreeNode__checkbox`);
}

module.exports = ContentLinkNodes;
const { $, $$ } = require(`@cucumber-e2e/po2`);

class PxResourcesBox {
	selector = `div.box.topics.pxContent`;

	Title = $(`span.title`);
	Icon = $(`span.icon`);
	Links = $$(`li .contentLinkItem a`);
	Customize = $(`a.config`);
	MagnifyingGlass = $$(`li .contentLinkItem span`);
	SeeAllButton = $(`.seeAll button`);
}

module.exports = PxResourcesBox;
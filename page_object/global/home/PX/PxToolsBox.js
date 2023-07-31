const { $, $$ } = require(`@cucumber-e2e/po2`);

class PxToolsBox {
	selector = `div.box.pxTools`;

	Title = $(`span.title`);
	Links = $$(`li > span > a`);
	Icon = $(`span.icon`);
	Customize = $(`a.config`);
	PaychexMobileNewsCentralLinkTitle = $(`a.linkWithCopyIcons`);
	PaychexMobileNewsCentralLinkEmailIcon = $(`span.send a`);
	PaychexMobileNewsCentralLinkCopyIcon = $(`span.copy a`);
	SendEmailTooltip = $(`span.send .simple-tooltip span.title`);
	CopyLinkTooltip = $(`span.copy .simple-tooltip span.title`);
	SeeAllButton = $(`.seeAll button`);
}

module.exports = PxToolsBox;
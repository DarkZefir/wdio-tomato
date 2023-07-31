const { $, $$ } = require(`@cucumber-e2e/po2`);

class PxUsefulLinksBox {
	selector = `div.box.topics.pxUsefulLinks`;

	Title = $(`span.title`);
	Icon = $(`span.icon`);
	Links = $$(`li a`);
	Customize = $(`a.config`);
}

module.exports = PxUsefulLinksBox;
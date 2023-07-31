const { $, $$ } = require(`@cucumber-e2e/po2`);

class PxHotTopicsBox {
	selector = `div.box.topics.pxHotTopics`;

	Title = $(`span.title`);
	Icon = $(`span.icon`);
	Links = $$(`li a`);
	Customize = $(`a.config`);
}

module.exports = PxHotTopicsBox;
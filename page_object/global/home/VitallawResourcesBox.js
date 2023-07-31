const { $, $$ } = require(`@cucumber-e2e/po2`);

class VitallawResourcesBox {
	selector = `.box.vitalLawResources`;

	Title = $(`span.title`);
	Links = $$(`.group ul li a`);
}

module.exports = VitallawResourcesBox;
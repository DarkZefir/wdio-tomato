const { $, $$ } = require(`@cucumber-e2e/po2`);

class VlccPrimaryLawBox {
	selector = `.box.primaryLaw`;

	Title = $(`.title`);
	Links = $$(`ul li a`);
}

module.exports = VlccPrimaryLawBox;
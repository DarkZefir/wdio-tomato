const { $, $$ } = require(`@cucumber-e2e/po2`);

class ExternalResourcesBox {
	selector = `.box.externalResources`;

	Header = $(`.header`);
	Links = $$(`a`);
}

module.exports = ExternalResourcesBox;
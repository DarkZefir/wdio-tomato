const { $, $$ } = require(`@cucumber-e2e/po2`);

class UkraineCrisisBox {
	selector = `.box.configuredLinksFlatList.withIcon`;

	Title = $(`span.title`);
	Links = $$(`li a`);
	SeeAllButton = $(`button`);
}

module.exports = UkraineCrisisBox;
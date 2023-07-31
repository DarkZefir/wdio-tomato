const { $, $$ } = require(`@cucumber-e2e/po2`);

class EssentialsBox {
	selector = `.box.configuredCshNode`;

	Title = $(`.header h2`);
	Icon = $(`.sectionsContainer .icon`);
	NewLabel = $(`.icon .newLabel`);
	TopicsLink = $(`a`);
	TaxLinks = $$(`ul li a`);
}

module.exports = EssentialsBox;
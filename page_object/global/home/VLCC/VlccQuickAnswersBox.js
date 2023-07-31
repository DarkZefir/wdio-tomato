const { $, $$ } = require(`@cucumber-e2e/po2`);

class VlccQuickAnswersBox {
	selector = `.twoColumns:nth-of-type(2)>div>div:nth-of-type(3) .boxWrapper`;

	Title = $(`.title`);
	CustomizationButton = $(`.config`);
	SeeAllButton = $(`.seeAll button`);
	Links = $$(`li a`);
	ToolBoxes = $$(new ToolBoxes());
}

class ToolBoxes {
	selector = `ul`;

	SeeAllButton = $(`.seeAll button`);
	Links = $$(`li a`);
}

module.exports = VlccQuickAnswersBox;
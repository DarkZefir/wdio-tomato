const { $, $$ } = require(`@cucumber-e2e/po2`);

class VlccToolsBox {
	selector = `.tools`;

	ToolBoxes = $$(new ToolBoxes());
	Title = $(`.title`);
	CustomizationButton = $(`.config`);
}

class ToolBoxes {
	selector = `ul`;

	Header = $(`.subHeader>.text`);
	Title = $(`.text`);
	SeeAllButton = $(`.seeAll button`);
	Links = $$(`li a`);
}

module.exports = VlccToolsBox;
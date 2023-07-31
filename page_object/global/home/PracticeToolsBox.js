const { $, $$ } = require(`@cucumber-e2e/po2`);

class PracticeToolsBox {
	selector = `.box.practiceTools`;

	Customize = $(`.config`);
	Header = $(`.header`);
	Links = $$(`.contentLinkItem`);
	PracticeToolsTypesTitle = $$(`.item .groupHeader`);
}

module.exports = PracticeToolsBox;
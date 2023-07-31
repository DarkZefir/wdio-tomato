const { $, $$ } = require(`@cucumber-e2e/po2`);

class LawsAndRegulationsPage {
	CodeBoxes = $$(new CodeBoxes());
	StateBox = $(new StateBox());
}

class CodeBoxes {
	selector = `.search-code-box`;

	Header = $(`header`);
	SearchInput = $(`input`);
	SearchButton = $(`.wk-field-button .wk-icon-search`);
	Items = $$(`ul li`);
	ItemLinks = $$(`ul li a`);
	ItemQuickSelectIcons = $$(`ul li .wk-icon-search`);
}

class StateBox {
	selector = `.laws-regulations-tabbed-box`;

	TabButtons = $$(`.wk-tab`);
	ActiveTab = $(`.wk-tab.wk-is-active`);
	ActiveTabTitle = $(`.wk-tab.wk-is-active .wk-tab-inner-content`);
	SearchInput = $(`input`);
	SearchIcon = $(`button .wk-icon-search`);
	Items = $$(`ul li`);
	ItemLinks = $$(`ul li a`);
	ItemTags = $$(`ul li .wk-tag`);
	ItemQuickSelectIcons = $$(`ul li .wk-icon-search`);
}

module.exports = LawsAndRegulationsPage;
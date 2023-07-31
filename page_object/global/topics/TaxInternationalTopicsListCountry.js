const { $, $$ } = require(`@cucumber-e2e/po2`);

class TaxInternationalTopicsListCountry {
	selector = `.dashboard .box`;

	Boxes = $$(new Boxes());
	BoxTitles = $$(`.topicsTreeContainer ul.ng-scope .atsNodeTitle`);
	TopicLinks = $$(`.topicsTreeContainer ul.ng-scope li a`);
	TopicsTreeContainer = $(`.topicsTreeContainer`);
	Dropdown = $(`.dropdownMenu`);
	DropdownItems = $$(`.dropdownMenu li`);
}

class Boxes {
	selector = `.topicsTreeContainer ul.ng-scope`;

	BoxLinks = $$(`li a`);
}

module.exports = TaxInternationalTopicsListCountry;

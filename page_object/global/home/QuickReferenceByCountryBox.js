const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class QuickReferenceByCountryBox {
	selector = `.box.configuredCshNode.quickReferenceByCountryBox`;

	Dropdown = $(new Dropdown(`.dropDownContentType span.menu`));
	Title = $(`.header h2`);
	CustomizationButton = $(`.config`);
	ArrowDown = $(`span.arrow-down`);
	ArrowUp = $(`span.arrow-up`);
	ExpandableTopLevelTopics = $$(`.quickReference-atsTree li span.label`);
	SecondLevelTopics = $$(`.menu li a`);
	UnexpandableTopLevelTopics = $$(`.quickReference-atsTree li a`);
}

module.exports = QuickReferenceByCountryBox;
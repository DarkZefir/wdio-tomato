const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class TreatiesBox {
	selector = `.box.configuredCshNode.treatiesBox`;

	BilateralTreatiesBox = $(new BilateralTreatiesBox());
	ModelTaxTreatiesBox = $(`.cshSection`);
	ModelTaxTreatiesBoxHeader = $(`.subHeader`);
	ModelTaxTreatiesBoxLinks = $$(`a`);
	Title = $(`.title`);
}

class BilateralTreatiesBox {
	selector = `.box.treaties`;

	Dropdowns = $$(new Dropdown(`.menu`));
	Header = $(`.subHeader`);
	GoButton = $(`button.search`);
}

module.exports = TreatiesBox;
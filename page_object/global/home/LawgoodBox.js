const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class LawgoodBox {
	selector = `.dashboard-box-container.nested-links-box`;

	SelectDropdown = $(new Dropdown(`.select-box`));
	Title = $(`.boxTitle`);
	Subtitle = $(`.boxSubtitle`);
	Links = $$(`a.linkItem`);
}

module.exports = LawgoodBox;

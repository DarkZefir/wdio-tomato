const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class CovidUsefulLinksBox {
	selector = `.usefulLinks`;

	LinksGroups = $$(new LinksGroups());
	LinksGroupsSeeAll = $$(`.section .small`);
	LinksGroupsDropdowns = $$(new Dropdown(`.section .selectable-list`));
	LinksGroupsTitles = $$(`.section .subHeader .text`);
	Header = $(`.header`);
	HeaderTitle = $(`.header .title`);
}

class LinksGroups {
	selector = `.section`;

	Links = $$(`li a`);
}
module.exports = CovidUsefulLinksBox;
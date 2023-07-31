const { $, $$ } = require(`@cucumber-e2e/po2`);

class UsefulLinksBox {
	selector = `.box.configuredUsefulLinks`;

	LinksGroups = $$(new LinksGroups());
	Customize = $(`.config`);
	Header = $(`.header`);
	HeaderTitle = $(`.header .title`);
	HeaderCustomize = $(`.header a.config`);
}

class LinksGroups {
	selector = `.column`;

	Title = $(`.subHeader .text`);
	Links = $$(`li a`);
	SeeAll = $(`.seeAll > button`);
}

module.exports = UsefulLinksBox;
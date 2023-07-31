const { $, $$ } = require(`@cucumber-e2e/po2`);

class LawFirmBlogsBox {
	selector = `.box.configuredLinks`;

	Customize = $(`.config`);
	Header = $(`.header`);
	SubSectionsLinks = $$(`div.ng-scope li a`);
	SubSectionsSeeAll = $(`div.ng-scope button .small`);
}

module.exports = LawFirmBlogsBox;
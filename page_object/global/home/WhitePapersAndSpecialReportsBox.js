const { $, $$ } = require(`@cucumber-e2e/po2`);

class WhitePapersAndSpecialReportsBox {
	selector = `.box.whitePapers`;

	Title = $(`span.title`);
	Links = $$(`li a`);
	SeeAllButton = $(`button`);
}

module.exports = WhitePapersAndSpecialReportsBox;
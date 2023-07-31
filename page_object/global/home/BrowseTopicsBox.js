const { $, $$ } = require(`@cucumber-e2e/po2`);

class BrowseTopicsBox {
	selector = `.configuredCshNode.browseTopicsBox`;

	Title = $(`.header h2`);
	Icon = $(`.sectionsContainer .icon`);
	Message = $(`.message`);
	BrowseTopicsLink = $(`a`);
	BrowseTopicsLinkTopicsType = $(`a strong`);
	BrowseTaxLinks = $$(`ul li a`);
	BrowseTaxLinksTopicsType = $$(`ul li a strong`);
}

module.exports = BrowseTopicsBox;
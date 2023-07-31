const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SeeAllPopup extends Popup {
	selector = `.seeAllPopup`;

	Links = $$(`.contentLinkItem a`);
	SearchIcons = $$(`.contentSearchIcon`);
	Customize = $(`button.left`);
	CloseButton = $(`button.right`);
	NavigationLetters = $$(`ch-letter-navigator a`);
	CustomizeButton = $(`.left.cheetahBtn`);
	Items = $$(`ul li a`);
}

module.exports = SeeAllPopup;
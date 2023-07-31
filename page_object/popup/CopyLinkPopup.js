const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class CopyLinkPopup extends Popup {
	selector = `.copyToClipboard .popup`;

	SubTitle = $(`.body .content .linkTitle`);
	CopiedLink = $(`.message span`);
	OKButton = $(`button.close.left.ng-binding`);

}

module.exports = CopyLinkPopup;

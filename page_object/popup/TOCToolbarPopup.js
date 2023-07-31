const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class TOCToolbarPopup extends Popup {
	selector = `.tocToolbar .popup`;

	PopupTitle = $(`.header .title`);
	Content = $(`.content`);
	NeverShowToolbarLabel = $(`.neverShowToolbar label`);
	NeverShowToolbarCheckbox = $(`input#showTable`);
	SitePreferences = $(`a[href=\"javascript:void(0)\"]`);
	Image = $(`img`);
	OKButton = $(`.footer button`);
}

module.exports = TOCToolbarPopup;
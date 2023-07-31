const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class InternalRevenueCodePopup extends Popup {
	selector = `.fullIrcPath`;

	ContentHeader = $(`.popupHeader`);
	Content = $(`.popupContent`);
	ContentItems = $$(`.popupContent p`);
}

module.exports = InternalRevenueCodePopup;

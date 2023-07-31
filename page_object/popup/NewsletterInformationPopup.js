const {$} = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class NewsletterInformationPopup extends Popup {
	selector = `.trackerInfo .popup`;

	Content = $(`.content`);
	TrackerName = $(`.trackerName`);
}

module.exports = NewsletterInformationPopup;

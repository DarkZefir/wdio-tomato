const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class FeedbackPopup extends Popup {

	selector = `.feedbackPopup`;

	PopupTitle = $(`.header .title`);
	Submit = $(`.footer button.right`);
	Cancel = $(`.footer button[ng-click*="close"]`);
	TopicInput = $(`#subject`);
	MessageInput = $(`#message`);
	LabelTopic = $(`label[for="subject"]`);
	LabelMessage = $(`label[for="message"]`);
	Limit = $(`.limit`);
}

module.exports = FeedbackPopup;
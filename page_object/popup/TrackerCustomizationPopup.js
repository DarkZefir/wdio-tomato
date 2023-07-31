const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class TrackerCustomizationPopup extends Popup {
    selector = `.trackerEdit`;

    CustomizationTopics = $(new CustomizationTopics());
	DefaultTrackerTitle = $(`.defaultTrackerTitle`);
	DefaultTrackerTitleLabel = $(`.defaultTrackerTitle .label`);
	DefaultTrackerTitleTrackerName = $(`.defaultTrackerTitle .trackerName`);

	CustomizationTrackerTitle = $(`.customizationTrackerTitle`);
	CustomizationTrackerTitleInput = $(`.customizationTrackerTitle input`);
	CustomizationTrackerTitleLabel = $(`.customizationTrackerTitle .label`);

	CustomizationSearchTerm = $(`.customizationSearchTerm`);
	CustomizationSearchTermInput = $(`.customizationSearchTerm input`);
	CustomizationSearchTermLabel = $(`.customizationSearchTerm .label`);

	CustomizationThesaurusCheckbox = $(`.customizationThesaurus input`);

	NotificationInfo = $(`.popupInfoNotification`);
	NotificationInfoText = $(`.popupInfoNotification div`);
	NotificationInfoLabel = $(`.popupInfoNotification label`);
	NotificationInfoCheckbox = $(`.popupInfoNotification input[type='checkbox']`);

	SaveAndClose = $(`button.close`);
	Cancel = $(`button.cancel`);
}

class CustomizationTopics {
	selector = `.customizationTopics`;

	Tabs = $$(`ul.tabs li`);

	Topics = $(`.topics`);
	TopicsList = $$(`.topics .topicColumn`);
	TopicsListCheckbox = $$(`.topics .topicColumn input[type='checkbox']`);
	TopicsListTitle = $$(`.topics .topicColumn span`);
}

module.exports = TrackerCustomizationPopup;
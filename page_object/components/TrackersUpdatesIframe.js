const { $, $$ } = require(`@cucumber-e2e/po2`);

class TrackersUpdatesIframe {
	selector = `#treatise, .treatise`;

	EmailInput = $(`input.email-controls__field`);
	SaveButton = $(`.email-controls__save-btn`);
	ViewDropdown = $(`.view-filter__select`);
	SelectAllCheckbox = $(`input#all`);
	NotificationsGroups = $$(`div.practice-area`);
	SubscribeButton = $(`button.controls__subscribe`);
	UnsubscribeButton = $(`.controls button:not(.controls__subscribe)`);
	NotificationsPACheckboxes = $$(`input.treatise-checkbox:not(#all)`);
	RSSIcons = $$(`.rss-column__icon`);
	NotificationsSubscribedItems = $$(`div.table__row`);
}

module.exports = TrackersUpdatesIframe;

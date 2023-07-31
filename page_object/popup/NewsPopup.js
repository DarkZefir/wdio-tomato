const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class NewsPopup extends Popup {
	selector = `.newsPopup .popup`;

	Trackers = $$(new Trackers());
	Content = $(`.scrollable`);
	NewslettersEmailInputLegend = $(`fieldset.email legend`);
	NewslettersEmailInput = $(`#email`);
	NewslettersViewDropdown = $(`.table-toolbar button.small`);
	NewslettersEmailSubscribeColumnHeader = $(`.trackersNew .subscribed>span`);
	NewslettersAggregatedEmailDigestColumnHeader = $(`.trackersNew .aggregatedEmailDigest>span`);
	NewslettersEmailFormatColumnHeader = $(`.trackersNew .emailFormat>span`);
	NewslettersHelpIcon = $(`a.help`);
	CancelButton = $(`.footer button.cancel`);
	SaveAndClose = $(`.footer button.close`);
	ViewDropdownItems = $$(`.table-toolbar ul li`);
	NewslettersNameColumnHeader = $(`.trackersNew .column.name>span`);
	NewslettersCustomizeColumnHeader = $(`thead td.customize`);
	NewslettersNameList = $$(`.type-header`);
	NewslettersNameListExpanded = $$(`.groupExpanded .type-header`);
	ActiveTab = $(`.header li.active span`);
	Tabs = $$(`.tabs li span`);
	ManageDailyAlerts = $(`.alertsLink a`);
	NewslettersEmailValidationError = $(`fieldset.email .validation-errors li`);
}

class Trackers {
	selector = `tr.item`;

	Title = $(`td.name`);
	Subscribe = $(`.subscribed input[type="checkbox"]`);
	Customize = $(`.customizeIcon`);
	InformationIcon = $(`.info`);
	RSS = $(`.rss`);
	AggregatedEmailDigest = $(`.aggregatedEmailDigest input[type="checkbox"]`);
	EmailFormatDropdown = $(`td.emailFormat button`);
	EmailFormatList = $$(`td.emailFormat li`);
}

module.exports = NewsPopup;

const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class ManageDailyAlertsPopup extends Popup {
	selector = `.manageDailyAlerts`;

	Dropdown = $(new Dropdown());
	Tab = $(`.alerts`);
	SearchInput = $(`input.addSearchInput`);
	ClearSearch = $(`a.delete`);
	SelectDailies = $(`.selectDailies .label`);
	ApplyButton = $(`button.applyButton`);
	TableHeader = $(`tr:not(.alertItem)`);
	InstructionMessage = $(`.instruction`);
	AlertItems = $$(`tr.alertItem`);
	AlertItemsName = $$(`tr.alertItem .name a`);
	AlertItemsInfo = $$(`tr.alertItem .infoIcon a`);
	AlertItemsDailiesDropdown = $$(`tr.alertItem .selectDailies button`);
	AlertItemsDelete = $$(`tr.alertItem .deleteIcon span`);
	CloseButton = $(`button.close.right`);
}

class Dropdown {
	selector = `.dropdown`;

	SelectAll = $(`.selectAll`);
	SelectAllCheckbox = $(`.selectAll input`);
	Items = $$(`.dailiesList li`);
	ItemsCheckbox = $$(`.dailiesList li input`);
}

module.exports = ManageDailyAlertsPopup;
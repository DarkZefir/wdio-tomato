const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const CalendarWidget = require(`../components/calendarWidget.component`);
const SearchSuggestions = require(`../components/searchSuggestions.component`);

class AdvancedSearchPopup extends Popup {
	selector = `.advancedSearch .popup`;

	SearchSuggestions = $(new SearchSuggestions(`.searchInputContainer>span:not(.input)`));
	ActiveDatepicker = $(new ActiveDatepicker());
	PresearchFilters = $$(new PresearchFilters());
	SelectedFiltersBox = $(new SelectedFiltersBox());
	CalendarWidget = $(new CalendarWidget());
	SearchInput = $(`.input textarea`);
	SearchButton = $(`button.search`);
	SearchDelete = $(`a.delete`);
	ClearAll = $(`button[ng-click="model.clearFilterSelection(true)"]`);
	SearchTitle = $(`.mainContentSearchScope`);
	DatepickerError = $(`.filterItem .filterItemDate .error`);
	PresearchPanel = $(`.searchScopeRefinementPanel`);
	CancelButton = $(`.buttons .left-menu button:not(.clear-all)`);
	HelpIcon = $(`a.help`);
	ApplyThesaurus = $(`.thesaurusCheckbox>input`);
}

class ActiveDatepicker {
	selector = `ch-date-input`;

	CurrentDay = $(`span.text-info`);
	GridItems = $$(`td span`);
}

class PresearchFilters {
	selector = `.preSearchFilterGroup`;

	FilterItems = $$(new FilterItems());
	Title = $(`.preSearchFilterGroupTitle`);
	Chevron = $(`.group > a`);
	PresearchFilterTitles = $$(`.preSearchFilterGroupElementTitle`);
	PresearchFilterCheckboxes = $$(`.preSearchFilterGroupElement>input`);
	SelectedFilterItems = $$(`.preSearchFilterGroupElement.selected`);
	SelectedFilterItemsTitles = $$(`.preSearchFilterGroupElement.selected .preSearchFilterGroupElementTitle`);
	SelectedFilterElements = $$(`.filterItem.selected .ch-pre-search-label`);
}

class SelectedFiltersBox {
	selector = `.groupBox.selectedFilters`;

	Items = $$(`.item`);
	ItemsTitle = $$(`.item span.ch-pre-search-label.ng-binding`);
	ItemsClear = $$(`.item .clearFilter`);
	ExpandButton = $(`.toggleIcon.collapsed`);
	CollapseButton = $(`.toggleIcon.expanded`);
}

class FilterItems {
	selector = `.preSearchFilterGroupElement`;

	FilterItemLevel0 = $$(new FilterItemLevel(`.level0`));
	FilterItemLevel1 = $$(new FilterItemLevel(`.level1`));
	FilterItemLevel2 = $$(new FilterItemLevel(`.level2`));
	Title = $(`.preSearchFilterGroupElementTitle`);
	Checkbox = $(`input[type=checkbox]`);
	Chevron = $(`.subtypes a`);
	FilterItemLevel0CheckedInputs = $$(`.level0 input:checked`);
	FilterItemLevel0UncheckedInputs = $$(`.level0 input:not(:checked)`);
	FilterItemLevel0CheckedLabels = $$(`.level0 input:checked + span.itemLabel > span`);
	FilterItemLevel0UncheckedLabels = $$(`.level0 input:not(:checked) + span.itemLabel > span`);
	FilterItemLevel1CheckedInputs = $$(`.level1 input:checked`);
	FilterItemLevel1UncheckedInputs = $$(`.level1 input:not(:checked)`);
	FilterItemLevel1CheckedLabels = $$(`.level1 input:checked + span.itemLabel > span`);
	FilterItemLevel1UncheckedLabels = $$(`.level1 input:not(:checked) + span.itemLabel > span`);
	FilterItemLevel2UncheckedInputs = $$(`.level2 input:not(:checked)`);
	FilterItemLevel2CheckedLabels = $$(`.level2 input:checked + span.itemLabel > span`);
	FilterItemLevel2UncheckedLabels = $$(`.level2 input:not(:checked) + span.itemLabel > span`);
	DateInput = $$(`.dateInput input`);
	SeeMoreLink = $(`.more, .show`);
	Labels = $$(`.ch-pre-search-label`);
}

class FilterItemLevel {
	constructor(selector) {
		this.selector = selector;
	}

	Input = $(`input`);
	Label = $(`span.itemLabel > span`);
	Chevron = $(`.subtypes > a`);
}

module.exports = AdvancedSearchPopup;

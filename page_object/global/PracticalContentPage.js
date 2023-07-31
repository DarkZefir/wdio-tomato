const { $, $$ } = require(`@cucumber-e2e/po2`);

class PracticalContentPage {
	ContentBoxes = $$(new ContentBoxes());
	PracticeAreasFilter = $(new PracticeAreasFilter());
	PracticalContentFilter = $(new PracticalContentFilter());
	MyPracticalContentFavoritesBox = $(new MyPracticalContentFavoritesBox());
	ResetAllFiltersButton = $(`.reset-all-filters`);
}

class ContentBoxes {
	selector = `.leftColumn .widget`;

	Title = $(`.text`);
	DisabledTitle = $$(`.text.disabled`);
	EnabledTitle = $$(`.text:not(.disabled`);
	Notification = $(`.subheader`);
	SearchInputField = $(`.wk-field-input`);
	SearchButton = $(`.wk-field-inlay button`);
	SeeAllButton = $(`.button-container .button`);
	Items = $$(`.linkItem`);
	NoResults = $(`.no-results`);
}

class PracticeAreasFilter {
	selector = `.multiselect-box.practice-areas-filters`;

	Label = $(`.label`);
	Container = $(`.options`);
	Options = $$(`.options .option`);
	OptionsLabel = $$(`.options .option span:not(.checkbox)`);
	OptionsCheckBox = $$(`.options .option .checkbox`);
	SelectAll = $(`.options .option.selectAll`);
	SelectAllCheckBox = $(`.options .option.selectAll .checkbox`);
	SelectAllSelected = $(`.options .option.selectAll.selected`);
	SelectAllSelectedCheckBox = $(`.options .option.selectAll.selected .checkbox`);
	SelectAllPartiallySelected = $(`.options .option.selectAll.partially-selected`);
	SelectAllPartiallySelectedCheckBox = $(`.options .option.selectAll.partially-selected .checkbox`);
	SelectedOptions = $$(`.options .option.selected:not(.selectAll)`);
	SelectedOptionsCheckBox = $$(`.options .option.selected:not(.selectAll) .checkbox`);
	SelectedEnabledOptions = $$(`.options .option.selected:not(.disabled)`);
	SelectedEnabledOptionsCheckBox = $$(`.options .option.selected:not(.disabled) .checkbox`);
	SelectedEnabledOptionsLabel = $$(`.options .option.selected:not(.disabled) span:not(.checkbox)`);
	SelectedDisabledOptions = $$(`.options .option.selected.disabled`);
	SelectedDisabledOptionsCheckBox = $$(`.options .option.selected.disabled .checkbox`);
	DisabledOptions = $$(`.options .option.disabled:not(.selected)`);
	NotSelectedEnabledOptions = $$(`.options .option:not(.disabled):not(.selected):not(.selectAll)`);
	NotSelectedEnabledOptionsTitle = $$(`.options .option:not(.disabled):not(.selected):not(.selectAll):last-child`);
}

class PracticalContentFilter {
	selector = `.multiselect-box.content-types-filter`;

	Label = $(`.label`);
	Container = $(`.options`);
	Options = $$(`.options .option`);
	OptionsLabel = $$(`.options .option span:not(.checkbox)`);
	OptionsCheckBox = $$(`.options .option .checkbox`);
	SelectAll = $(`.options .option.selectAll`);
	SelectAllCheckBox = $(`.options .option.selectAll .checkbox`);
	SelectAllSelected = $(`.options .option.selectAll.selected`);
	SelectAllSelectedCheckBox = $(`.options .option.selectAll.selected .checkbox`);
	SelectAllPartiallySelected = $(`.options .option.selectAll.partially-selected`);
	SelectAllPartiallySelectedCheckBox = $(`.options .option.selectAll.partially-selected .checkbox`);
	SelectedOptions = $$(`.options .option.selected:not(.selectAll)`);
	SelectedOptionsCheckBox = $$(`.options .option.selected:not(.selectAll) .checkbox`);
	SelectedOptionsLabel = $$(`.options .option.selected:not(.selectAll) span:not(.checkbox)`);
	SelectedEnabledOptions = $$(`.options .option.selected:not(.disabled)`);
	SelectedEnabledOptionsCheckBox = $$(`.options .option.selected:not(.disabled) .checkbox`);
	SelectedEnabledOptionsLabel = $$(`.options .option.selected:not(.disabled) span:not(.checkbox)`);
	SelectedDisabledOptions = $$(`.options .option.selected.disabled`);
	SelectedDisabledOptionsCheckBox = $$(`.options .option.selected.disabled .checkbox`);
	DisabledOptions = $$(`.options .option.disabled:not(.selected)`);
	NotSelectedEnabledOptions = $$(`.options .option:not(.disabled):not(.selected):not(.selectAll)`);
	NotSelectedEnabledOptionsTitle = $$(`.options .option:not(.disabled):not(.selected):not(.selectAll):last-child`);
}

class MyPracticalContentFavoritesBox {
	selector = `.practical-content-favorites-box`;

	Title = $(`.text`);
	StarIcon = $$(`.icon-star`);
	Links = $$(`.linkItem`);
	SeeAllButton = $(`.button`);
	NoResults = $(`.no-results`);
}

module.exports = PracticalContentPage;

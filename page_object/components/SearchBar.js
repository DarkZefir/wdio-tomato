const { $, $$ } = require(`@cucumber-e2e/po2`);
const SearchSuggestions = require(`../components/searchSuggestions.component`);

class SearchBar {
	selector = `div.titleBar.searchBar , .practical-content-search-bar, .search-bar`;

	SearchResultsDropdown = $(new SearchResultsDropdown());
	DocumentBreadcrumbs = $(new Breadcrumbs());
	SearchSuggestions = $(new SearchSuggestions(`.searchForm, .wordwheel`));
	PreSearchFilters = $$(new PreSearchFilters());
	PostSearchFilters = $$(new PostSearchFilters());
	SearchPills = $$(new SearchPill());
	CuratedWidget = $(new CuratedWidget());
	JurisdictionDropdown = $(new LRDropdown(`.wk-multiselect:first-child`));
	DocumentTypeDropdown = $(new LRDropdown(`.wk-multiselect:last-child`));
	SearchInput = $(`.input textarea , input.new-pill , input.input, input[name=\"searchInput\"]`);
	SearchButton = $(`button.search , .search-btn, [data-e2e=\"cg-search-button\"], [data-e2e=\"cg-button-field\"]`);
	SearchButtonLawsAndRegsCheck = $(`.search-field-wrapper`);
	SearchDelete = $(`a.delete, .delete-button, .close-icon, [data-e2e=\"cg-clear-button\"]`);
	SearchTitle = $(`.searchBarLeftSide span span`);
	ThesaurusCheckbox = $(`input[type =\"checkbox\"]`);
	WordWheel = $(`div.history`);
	HelpIcon = $(`a.help , .help-icon`);
	MisspelledTerms = $$(`.spellChecker .term.invalid`);
	Title = $(`.title`);
	SelectedFiltersToggleCollapsed = $(`.toggleIcon.collapsed`);
	SelectedFiltersToggleExpanded = $(`.toggleIcon.expanded`);
	CitationSearchBuilderButton = $(`.citationSearchContainer .citationSearch`);
	SpellChecker = $(`.spellChecker`);
	SpellCheckerInvalidTerms = $$(`.spellChecker .term.invalid`);
	PostSearchFiltersLabel = $(`.boxContent .label`);
	AdvancedSearch = $(`.searchForm .advancedSearchScope a, .advanced-search-label`);
	SearchResults = $(`.mainLink`);
	SearchLabel = $(`.search-for-label`);
	FutureVersionsButton = $(`.future-versions-button-wrapper .button-field-clickable-wrapper`);
	CuratedSearchLabel = $(`.curated-search-label`);
	CuratedSearchDropdown = $(`.curated-search-dropdown`);
	CuratedSearchDropdownPlaceholder = $(`.curated-search-dropdown .preview`);
}

class Breadcrumbs {
	selector = `.navigationLinksPanel, .documentBreadcrumbs`;

	MainBreadcrumbTrail = $(`.documentBreadcrumbs .mainLink, .documentBreadcrumbs a`);
	ExpandButton = $(`.expandBreadcrumbsButton`);
	AdditionalBreadcrumbTrails = $(`.additionalTrails`);
	AdditionalBreadcrumbLinks = $$(`.additionalTrails li.trailItem a`);
}
class SearchResultsDropdown {
	selector = `.backToSearchResultLink`;

	Link = $(`a.mainLink`);
	ExpandButton = $(`.expandButtonClass`);
	Items = $$(`li a`);
}

class PreSearchFilters {
	selector = `.selectedFilters .item`;

	ClearFilter = $(`.clearFilter`);
	FilterName = $(`span:not(.clearFilter)`);
}
class PostSearchFilters {
	selector = `.selectedFilters .filter`;

	ClearFilter = $(`.clearFilter`);
	FilterName = $(`.rs-search-narrow-label`);
}

class SearchPill {
	selector = `div.pill , .input-container .practical-content-search-pill`;

	Text = $(`.pill-text`);
	Edit = $(`.wk-icon-filled-pencil`);
	Input = $(`input , input.pill-input`);
	Update = $(`.wk-icon-filled-check`);
	Remove = $(`.wk-icon-close-circle`);
}

class LRDropdown {
	constructor(selector) {
		this.selector = selector;
	}

	Placeholder = $(`.wk-multiselect-placeholder`);
	ArrowDown = $(`.wk-icon-chevron-down`);
	ArrowUp = $(`.wk-icon-chevron-up`);
	Items = $$(`.wk-dropdown-menu-container li`);
	ItemCheckboxes = $$(`.wk-dropdown-menu-container li .wk-field-choice`);
}

class CuratedWidget {
	selector = `.curated-search-dropdown .dropdown-items`;

	ParentTopics = $$(`.first-level a`);
	ChildTopicsSection = $(`.second-level`);
	NoCuratedSearchIcon = $(`.no-curated-search .cg-icon-1-7-0`);
	NoCuratedSearchLabel = $(`.no-curated-search .label`);
	ChildSectionHeader = $(`.second-level h1`);
	ChildTopics = $$(`.second-level a`);
}

module.exports = SearchBar;

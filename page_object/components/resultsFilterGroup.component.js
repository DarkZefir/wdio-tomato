const { $, $$ } = require(`@cucumber-e2e/po2`);

class resultsFilterGroup {
	selector = `.narrowPanel [ch-search-narrow-filter=filter] .filter:not(.topic)`;

	TopicLabels = $$(`.labelBar .label`);
	TopicFilterItems = $$(`.items .filterItem .item span:nth-child(2)`);
	Label = $(`.labelBar .rs-search-narrow-label`);
	FilterItems = $$(`.filterItem .item .rs-search-narrow-label`);
	FilterChildrenItems = $$(`.children .filterItem .item .rs-search-narrow-label`);

	MoreLessLabel = $(`.showMoreLess`);
	MoreLabel = $(`.showMoreLess .more`);
	LessLabel = $(`.showMoreLess .less`);

	ShowSubtypes = $$(`.show-subtypes`);
	HideSubtypes = $$(`.hide-subtypes`);

	SelectedItems = $$(`.filterItem.selected>.item`);
	SelectedItemsCount = $$(`.filterItem.selected>.item .totalResults`);
	SelectedItemsCheckbox = $$(`.filterItem.selected>.item input[type=\"checkbox\"]`);
	SelectedItemsLabel = $$(`.filterItem.selected>.item .rs-search-narrow-label`);

	FilterItemsHitCount = $$(`.totalResults`);

	Subtypes = $$(`.children .filterItem`);
	SubtypesCheckbox = $$(`.children .filterItem input[type=\"checkbox\"]`);
	SubtypesLabel = $$(`.children .filterItem .rs-search-narrow-label`);
	SubtypesHitCount = $$(`.children .filterItem .totalResults`);

	FilterItemsCheckboxes = $$(`.filterItem .item input[type=\"checkbox\"]`);
}

module.exports = resultsFilterGroup;
const {$, $$} = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const FilterGroup = require(`../components/resultsFilterGroup.component`);
const Document = require(`../components/resultsItem.component`);

class RelatedItemsPopup extends Popup {
	selector = `.relatedPopup`;

	Documents = $$(new Document());
	FilterGroups = $$(new FilterGroup());
	FilterButton = $(`button.link.filter`);
	FilterXButton = $(`.small.close`);
	FilterPanel = $(`.narrowPanel`);
	ExpandFilterPanel = $(`.narrowPanel icon`);
	HitCount = $(`.hitCount`);
	CloseButton = $(`button.right`);
	OutsideFilterPanelArea = $(`.popup .curtain`);
	FilterItems = $$(`.selectedFilters .filterItem`);
	FilterItemLabels = $$(`.selectedFilters .filterItem span:not(.clearFilter)`);
}

module.exports = RelatedItemsPopup;

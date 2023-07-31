const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SearchInformationPopup extends Popup {
	selector = `.wk-modal-content`;

	SearchQueries = $(`.row.searchQueryInfo div[ng-init]`);
	AppliedTerms = $(`div.appliedTermsInfo div:nth-child(2)`);
	PreSearchSelectionsGroup = $(`.row[ng-if="::searchInformationCtrl.preSearchEnabled()"]`);
	PostSearchSelectionsGroup = $(`.postSearch`);
	CloseButton = $(`button.right`);
	EditButton = $(`button.left`);
	SavedSearchName = $(`.savedSearchName`);
	FutureVersionsSection = $(`div[ng-if*="isFutureVersionsSearch"]`);
	FutureVersionsSectionTitle = $(`div[ng-if*="isFutureVersionsSearch"] .label`);
	FutureVersionsSectionFlag = $(`div[ng-if*="isFutureVersionsSearch"] div:last-child`);
	Filters = $$(`.filtersList > li`);
	PracticeArea = $(`.practiceArea span:nth-child(2)`);
}

module.exports = SearchInformationPopup;

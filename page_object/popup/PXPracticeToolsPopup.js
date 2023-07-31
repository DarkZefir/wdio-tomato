const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class PracticeToolsPopup extends Popup {
	selector = `.titles-popup .cg-modal-content`;

	InfoBox = $(new InfoBox());
	PublicationContainers = $$(new PublicationContainers());
	ViewLabel = $(`.pa-selector-label`);
	ViewDropdown = $(`.pa-selector-dropdown`);
	ViewDropdownLabel = $(`.pa-selector-dropdown .toggle-btn-label`);
	ViewDropdownButton = $(`.pa-selector-dropdown .toggle-btn`);
	ViewDropdownMenuItems = $$(`.pa-selector-dropdown .option`);
	LetterNavigation = $(`.label-navigation`);
	LetterNavigationLetters = $$(`.label-navigation .navigation-item`);
	CloseButton = $(`.footer button`);
	SearchInput = $(`.simple-search-bar-input`);
	ClearSearchInput = $(`.input .delete`);
	SearchButton = $(`.search-btn`);
	LetterMarkers = $$(`.group-label`);
	PublicationsLinks = $$(`.heading a`);
	ResultsHighlights = $$(`mark`);
	ClearSearchResults = $(`.clear-search-button`);
	ResultsFound = $(`.search-header span:not(.clear-search-button)`);
	Content = $(`.titles-list`);
}

class InfoBox {
	selector = `.info-box`;
	InfoContainer = $(`.info.locations`);
	InfoContainerHeader = $(`.info.locations .info-label`);
	InfoContainerMessage = $(`.info.locations p:last-child`);
	InfoContainerBreadcrumbs = $$(`.info.locations a`);
	Summary = $$(`.info.summary`);
	SummaryBody = $(`.info.summary p:last-child`);

}

class PublicationContainers {
	selector = `.heading`;

	InfoButton = $(`.info-icon`);
}

module.exports = PracticeToolsPopup;

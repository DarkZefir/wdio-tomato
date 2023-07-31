const { $, $$ } = require(`@cucumber-e2e/po2`);

class TreatiesPage {
	Publications = $$(`.publicationContainer`);
	TreatiesHeader = $(`.publicationContainer .publicationHeader:not(a)`);
	InfoIcon = $(`.publicationContainer .publicationHeaderIcon`);
	TreatiesLinks = $$(`.publicationContainer li a`);
	GroupHeaders = $$(`.publicationContainer p.typeHeader:not(a)`);
	NoAmendmentsInfo = $(`.publicationContainer p.noTreatiesInfo`);
	TreatiesBrowseOverlay = $(`.treatiesBrowseContainer`);
	Title = $(`.treatiesBrowseContainer .header`);
	XIcon = $(`.treatiesBrowseContainer .close`);
	NavigationTabs = $$(`.treatiesBrowseContainer .tabNavigation li a`);
	ActiveTab = $$(`.treatiesBrowseContainer .tabNavigation .active`);
}

module.exports = TreatiesPage;
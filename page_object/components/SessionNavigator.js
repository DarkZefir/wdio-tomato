const { $, $$ } = require(`@cucumber-e2e/po2`);

class SessionNavigator {
	selector = `.menus.desktop .sessionNav`;

	ResoursesListItems = $$(new PracticeAreaItem(`.resources li.item`));
	PracticeAreasListItems = $$(new PracticeAreaItem(`.practiceAreas li.item`));
	SessionNavigatorTab = $(`button.toggle`);
	ResoursesListHeader = $(`.resources h3`);
	PracticeAreasListHeader = $(`.practiceAreas h3`);
}

class PracticeAreaItem {
	constructor(selector) {
		this.selector = selector;
	}

	EventsPanel = $(new EventsPanel());
	Expand = $(`a.indicator`);
}

class EventsPanel {
	selector = `.subOptions`;

	Event = $$(new Event());
	Title = $(`.title`);
	PATitle = $(`.title .paTitle`);
}

class Event {
	selector = `.subItem`;

	Link = $(`a.link`);
	Title = $(`.link`);
	TitleText = $(`.link span.ng-binding:not(.sub)`);
	TitleNumberOfResults = $(`.link span.sub.ng-binding`);
	Delete = $(`a.delete`);
}
module.exports = SessionNavigator;
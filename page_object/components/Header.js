const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`./dropdown.component`);

class Header {
	selector = `.pageHeader, #header`;

	UserMenu = $(new Dropdown(`.desktop .user.menu`));
	MySolutions = $(new Dropdown(`.menus.desktop .products`));
	WKLogo = $(`.wkLogo`);
	ApplicationLogo = $(`.appLogo`);
	WKLogoFull = $(`.wkLogoFull.screenReaderContent`);
	LogIn = $(`.anonymousLogIn`);
	Help = $(`.desktop a.help`);
	FeedbackButton = $(`.menus.desktop .feedback button`);

	HistoryDropdown = $(new HistoryDropdown());
	FoldersDropdown = $(new FoldersDropdown());
	SavedItemsDropdown = $(new Dropdown(`.menus.desktop .saved`));
	NewsDropdown = $(new NewsDropdown());
	Home = $(`.menus.desktop .homeLink`);
	LawsAndRegulationsButton = $(`.desktop .lawRegulationsBtn`);
	PracticalContentButton = $(`.pageHeader .desktop .secondary.practicalContentBtn`);
	TitlesButton = $(`.desktop .secondary[title=\"Titles\"]`);
	FavoritesButton = $(`.pageHeader .secondary.headerFavorites`);
	PracticeToolsButton = $(`.pageHeader .secondary.practiceToolsAzBtn`);
	Title = $(`.title`);
}

class FoldersDropdown {
	selector = `.menus.desktop .worklists`;

	Items = $$(`ul li .label`);
	ItemsCount = $$(`ul li .sub`);
	SeeAllButton = $(`li.all button`);
	NoFoldersNotice = $(`li.info`);
}

class NewsDropdown {
	selector = `.menus.desktop .news`;

	List = $$(`ul li`);
}

class HistoryDropdown {
	selector = `.menus.desktop .history`;

	ItemsTitle = $$(`li.history-list-item a`);
	ItemsTime = $$(`li.history-list-item span.time-elapsed-info-box`);
	SeeAll = $(`button.see-all-btn`);
}

module.exports = Header;

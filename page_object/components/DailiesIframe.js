const { $, $$ } = require(`@cucumber-e2e/po2`);

class DailiesIframe {
	selector = `#dailies, .dailies`;

	ViewDropdown = $(`.view-filter__btn`);
	DailiesHeader = $(`.table__header`);
	DailiesList = $$(`.table__row`);
	RssIcons = $$(`.rss-column__icon`);
}

module.exports = DailiesIframe;
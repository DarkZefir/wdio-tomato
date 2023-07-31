const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class ContentBox {
	selector = `ui-view .dashboard .right, .body.content`;

	MainContentTypes = $$(new MainContentTypes());
	Title = $(`h1`);
}

class MainContentTypes {
	selector = `.mainContentType, .box.usefulLinks`;

	ContentTypes = $$(new ContentTypes());
	SeeMore = $(`.expand a`);
	HeaderConfig = $(`.header a.config`);
	HeaderTitle = $(`.header h2`);
	HeaderArrowDown = $(`.header span.arrow-down`);
	HeaderArrowUp = $(`.header span.arrow-up`);
	HeaderCopyLink = $(`.header .saveLinksButton`);
}

class ContentTypes {
	selector = `.contentType:not(.last-even-box-placeholder), li.section`;

	Dropdowns = $$(new Dropdown(`.dropdownMenu`));
	Dropdown = $(new Dropdown(`.dropdownMenu`));
	Links = $$(`.contentLink .contentLinkItem a, li a`);
	Title = $(`.text .inner, div.subHeader > .text`);
	SeeAll = $(`li.seeAll button`);
	GoButton = $(`button.goButton`);
	Icon = $(`.iconContainer .icon`);
	QuickSelectIcon = $(`.contentLinkItem:hover > span.contentSearchIcon`);
	QuickSelectHeaderIcon = $(`.subHeader:hover span.contentSearchIcon`);
	LoadingIndicator = $(`.loading, .global-loading-indicator`);
	Titles = $$(`.text .inner`);
}

module.exports = ContentBox;

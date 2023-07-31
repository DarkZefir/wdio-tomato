const { $, $$ } = require(`@cucumber-e2e/po2`);

class NewsHeadlinesBox {
	selector = `.box.news`;

	SubSections = $$(new SubSections());
	Customize = $(`.config`);
	Header = $(`.header`);
	HeaderSignUp = $(`.header .signUpLink`);
	HeaderCustomize = $(`.header .config`);
	HeaderTitle = $(`.header span:not(.icon)`);
}

class SubSections {
	selector = `.subHeader`;

	Links = $$(`li a`);
	Customize = $(`.config`);
	SignUp = $(`.signUpLink`);
	ReadAllArticlesButtons = $$(`.seeAll button`);
	SubHeaders = $$(`.header-title`);
	Icon = $(`.icon`);
}

module.exports = NewsHeadlinesBox;
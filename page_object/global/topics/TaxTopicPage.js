const { $, $$ } = require(`@cucumber-e2e/po2`);
const ToolbarButtons = require(`../../components/toolbarButtons.component`);
const Dropdown = require(`../../components/dropdown.component`);

class TaxTopicPage {
	selector = `.topicViewContainer`;

	AuthorWidget = $(new AuthorWidget());
	OverviewWidget = $$(new OverviewWidget());
	TreatmentByStateWidget = $(new TreatmentByStateWidget());
	RecommendedTopicsWidget = $(new RecommendedTopicsWidget());
	NewsWidget = $(new NewsWidget());
	SmartChartsWidget = $(new SmartChartsWidget());
	TreatmentByJurisdictionWidget = $(new TreatmentByJurisdictionWidget());
	TaxSnapshotWidget = $(new TaxSnapshotWidget());
	CitationsWidget = $(new CitationsWidget());
	KeyPrimarySourcesWidget = $(new KeyPrimarySourcesWidget());
	ClientLettersWidget = $(new ClientLettersWidget());
	PracticeAidsWidget = $(new PracticeAidsWidget());
	FormsWidget = $(new FormsWidget());
	FormsAndInstructionsWidget = $(new FormsAndInstructionsWidget());
	IRSPublicationsWidget = $(new IRSPublicationsWidget());
	ToolbarButtons = $(new ToolbarButtons());
	TopicBreadcrumbs = $$(`.topicBreadcrumbs a`);
	TableOfContents = $(`.topicToc`);
	TableOfContentsItems = $$(`.topicToc a`);
	TopicTitle = $(`.title`);
	CitationLinks = $$(`a.link.osa-rsi-citation, span.ats-node-ref`);
	CitationPopover = $(`.popover-active`);
	Summary = $(`[id = 'summary']`);
	SummaryContent = $(`.section-content`);
	SummaryLinks = $$(`.ats-node-ref`);
	FavoriteButton = $(`.favorite .icon`);
	FavoriteButtonChecked = $(`.favorite a.remove`);
}

class IRSPublicationsWidget {
	selector = `.irsPublications`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	BoxTitles = $$(`div.documentItem .documentType`);
	Links = $$(`div.documentItem a div`);
}

class FormsAndInstructionsWidget {
	selector = `.formsInstructions`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	FormId = $$(`div.documentItem .formId`);
	BoxTitles = $$(`div.documentItem .documentType`);
	DocumentTitle = $$(`div.documentItem .documentTitle`);
	Items = $$(`div.documentItem a.subItem`);
}

class FormsWidget {
	selector = `.forms`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	FormId = $$(`div.documentItem .formId`);
	DocumentTitle = $$(`div.documentItem .documentTitle`);
	Items = $$(`div.documentItem a.subItem`);
}

class PracticeAidsWidget {
	selector = `.practiceAids`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	BoxTitles = $$(`div.documentItem .documentType`);
	Links = $$(`div.documentItem a div`);
}

class ClientLettersWidget {
	selector = `.clientLetters`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	BoxTitles = $$(`div.documentItem .documentType`);
	Links = $$(`div.documentItem a div`);
}

class KeyPrimarySourcesWidget {
	selector = `.keyPrimarySources`;

	Title = $(`.section-title`);
	Tabs = $$(`.tabItem`);
	Boxes = $$(`div.documentItem`);
	BoxTitles = $$(`div.documentItem .documentType`);
	Links = $$(`div.documentItem a div`);
}

class CitationsWidget {
	selector = `.topicCitationListSection`;

	Title = $(`.section-title`);
	Links = $$(`li a`);
}

class TaxSnapshotWidget {
	selector = `.topicSidebar .topicSnapshot .available`;

	Title = $(`.taxSnapshotTitle`);
	CountryTitle = $(`taxSnapshotTitle`);
	ViewTaxSnapshotButton = $(`button`);
}

class TreatmentByJurisdictionWidget {
	selector = `.topicTreatmentByCountrySection`;

	Title = $(`.section-title`);
	TopicTitle = $(`.topicTitle`);
	Dropdown = $(new Dropdown(`.menu`));
}

class SmartChartsWidget {
	selector = `.smartCharts`;

	Title = $(`.section-title`);
	Boxes = $$(`div.documentItem`);
	BoxTitles = $$(`div.documentItem .documentType`);
	BoxLinks = $$(`div.documentItem a div`);
}

class NewsWidget {
	selector = `.topicNewsListSection`;

	Title = $(`.section-title`);
	NewsItems = $$(`.newsItem`);
}

class RecommendedTopicsWidget {
	selector = `div#multi-document-list`;

	Title = $(`.section-title`);
	SubsectionTitle = $(`.subsection-title`);
	DocumentTitle = $(`a.documentTitle div`);
	ChildDocumentsLinks = $$(`.documentItem li a`);
}

class TreatmentByStateWidget {
	selector = `.topicTreatmentByStateSection`;

	Title = $(`.section-title`);
	NavigationTabs = $$(`.tabNavigation li a`);
	StatesContainer = $(`.statesContainer`);
	StateLinks = $$(`.statesContainer .state`);
	DisabledLinks = $$(`.statesContainer .state:not(.active)`);
	ActiveLinks = $$(`.statesContainer .state.active`);
}

class AuthorWidget {
	selector = `.author`;

	Name = $$(`.author-name-text`);
	Photo = $$(`.author-image img`);
	Affiliation = $(`.author-affiliation-text`);
}

class OverviewWidget {
	selector = `.overview, [id = 'summary']`;

	Title = $(`.section-title`);
	Content = $(`.section-content`);
	Links = $$(`.ats-node-ref`);
}

module.exports = TaxTopicPage;

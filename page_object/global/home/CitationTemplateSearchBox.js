const { $, $$ } = require(`@cucumber-e2e/po2`);

class CitationTemplateSearchBox {
	selector = `.fullScreenBox`;

	CitationGroups = $$(new CitationGroups());
	Header = $(`.header`);
	XCloseButton = $(`.close`);
	LoadingIndicator = $(`.loading , .global-loading-indicator`);
}

class CitationGroups {
	selector = `.citationGroup`;

	GroupTitle = $(`.groupTitle`);
	Templates = $$(new Templates());
}

class Templates {
	selector = `.template`;

	Title = $(`.leftTemplateColumn`);
	Inputs = $$(`input`);
	GoButton = $(`button.search`);
	ErrorMessage = $(`.errorMessage`);
}

module.exports = CitationTemplateSearchBox;
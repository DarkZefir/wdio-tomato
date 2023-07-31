const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class RBsourceFilings {
	selector = `.box.rbSourceFilings`;

	Content = $(new Content(``));
	Header = $(`.header`);
	GoButton = $(`button.search`);
	Labels = $$(`label`);
}

class Content {
	selector = `.content`;

	ScopeDropdown = $(new Dropdown(`span.menu[label=\"selectedScope\"]`));
	EdgarFormTypeDropdown = $(new Dropdown(`span.menu[label*=\"selectedFormType\"]`));
	DateFormDropdown = $(new Dropdown(`.dateForm .menu`));
	PrivatePlacementsForm = $(new PrivatePlacementsForm());
	LawFirmMemosForm = $(new LawFirmMemosForm());
	CompanyInput = $(`#edgarCompanyInput`);
	SearchTermInput = $(`textarea[ng-model=\"edgarSearchQuery\"]`);
}

class PrivatePlacementsForm {
	selector = `rb-source-filings-private-placements`;

	CompanyNameInput = $(`textarea#privatePlacementsCompanyNameInput`);
	GoverningLawInput = $(`textarea#privatePlacementsGoverningLawInput`);
	BookrunnerInput = $(`textarea#privatePlacementsBookrunnerInput`);
	SearchTermInput = $(`textarea[ng-model="privatePlacementsSearchTerm"]`);
}

class LawFirmMemosForm {
	selector = `rb-source-filings-law-firm-memos-form`;

	CategoryDropdown = $(new Dropdown(`span.menu[label*=\"selectedCategory\"]`));
	SubcategoryDropdown = $(new Dropdown(`span.menu[label*=\"selectedSubcategory\"]`));
	KeywordInput = $(`textarea[ng-model=\"keyword\"]`);
}

module.exports = RBsourceFilings;
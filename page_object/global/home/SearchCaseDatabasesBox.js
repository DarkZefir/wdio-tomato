const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class SearchCaseDatabasesBox {
	selector = `.box.caseDatabaseSearch`;

	Dropdowns = $$(new Dropdown(`button[ng-class="buttonClass"]`));
	Scope = $(new Dropdown(`.scopeContainer .menu`));
	SearchBy = $(new Dropdown(`.searchByContainer .menu`));
	Header = $(`.header`);
	SearchTerm = $(`.searchTermContainer textarea`);
	GoButton = $(`.submitContainer .search`);
	Items = $$(`li .label.ng-binding`);
}

module.exports = SearchCaseDatabasesBox;

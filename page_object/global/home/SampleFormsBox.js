const { $, $$ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../components/dropdown.component`);

class SampleFormsBox {
	selector = `.box.topicFinder.sf`;

	Dropdowns = $$(new Dropdown(`.menu`));
	ActiveDropdown = $(new Dropdown(`.menu.expanded`));
	Title = $(`.header`);
	SearchTermLabel = $(`label.first`);
	SearchTermInput = $(`.query > textarea`);
	SearchButton = $(`.search`);
	DropdownLabel = $(`.topic label`);
}

module.exports = SampleFormsBox;

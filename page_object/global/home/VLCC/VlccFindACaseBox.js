const { $ } = require(`@cucumber-e2e/po2`);
const Dropdown = require(`../../../components/dropdown.component`);

class VlccFindACaseBox {
	selector = `.box.findCase`;

	SearchByDropdown = $(new Dropdown(`.menu`));
	Title = $(`.title`);
	SearchTermInput = $(`.box.findCase input`);
	GoButton = $(`button:last-child`);
}

module.exports = VlccFindACaseBox;
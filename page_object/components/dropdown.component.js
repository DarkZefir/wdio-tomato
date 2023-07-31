const { $, $$ } = require(`@cucumber-e2e/po2`);

class Dropdown {
	constructor(selector) {
		this.selector = selector;
	}

	Button = $(`button`);
	Label = $(`button span.label, .toggle-btn-label`);
	Items = $$(`.overlay ul li:not(.close), .option, option`);
	Links = $$(`li a`);
	Close = $(`.overlay ul li.close`);
	List = $(`ul`);
	Countries = $$(`li a .label`);
}

module.exports = Dropdown;

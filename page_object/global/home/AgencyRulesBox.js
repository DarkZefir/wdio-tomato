const { $ } = require(`@cucumber-e2e/po2`);

class AgencyRulesBox {
	selector = `#fdkcWidget`;

	HeaderTitle = $(`.header h2`);
	HeaderIcon = $(`.header .icon`);
	HeaderSubTitle = $(`.header span:not(.icon):not(.iconContainer)`);
}

module.exports = AgencyRulesBox;
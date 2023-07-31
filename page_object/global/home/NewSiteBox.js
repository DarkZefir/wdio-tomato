const { $ } = require(`@cucumber-e2e/po2`);

class NewSiteBox {
	selector = `div.notification-box`;

	Title = $(`.notification-box-header span:not(.wk-icon-announce)`);
	Icon = $(`.wk-icon-announce`);
	Message = $(`.notification-box-message`);
	VisitLink = $(`a`);
	VisitButton = $(`button`);
}

module.exports = NewSiteBox;
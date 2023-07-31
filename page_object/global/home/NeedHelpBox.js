const { $, $$ } = require(`@cucumber-e2e/po2`);

class NeedHelpBox {
	selector = `.boxWrapper>div>.box.needHelp`;

	Header = $(`.header .title`);
	ViewOnlineHelp = $(`.viewHelp`);
	ViewOnlineHelpLink = $(`.viewHelp a`);
	AccessTrainingAndReferenceMaterial = $$(`.training`);
	AccessTrainingAndReferenceMaterialLink = $$(`.training a`);
	EmailCustomerSupport = $$(`.supportEmail`);
	EmailCustomerSupportLink = $$(`.supportEmail a`);
	CallCustomerSupport = $$(`.supportPhone`);
}

module.exports = NeedHelpBox;
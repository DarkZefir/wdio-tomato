const { $ } = require(`@cucumber-e2e/po2`);

class Footer {
	selector = `.pageFooter`;

	PrivacyAndCookies = $(`.links a:nth-child(1)`);
	TermsOfUse = $(`.links a:nth-child(2)`);
	Copyright = $(`.copyright`);
}

module.exports = Footer;
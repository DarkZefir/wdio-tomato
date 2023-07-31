const { $ } = require(`@cucumber-e2e/po2`);

class InfoBanner {
	selector = `.hintContainer`;

	LogIn = $(`a.link.underline`);
	Close = $(`a.link.close`);
}

module.exports = InfoBanner;

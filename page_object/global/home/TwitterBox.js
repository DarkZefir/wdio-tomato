const { $ } = require(`@cucumber-e2e/po2`);

class TwitterBox {
	selector = `.box.twitter`;

	Customize = $(`.config`);
	Header = $(`.header`);
}

module.exports = TwitterBox;
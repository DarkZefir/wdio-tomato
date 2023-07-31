const { $ } = require(`@cucumber-e2e/po2`);

class Popup {
	Title = $(`.wk-modal-title, .cg-modal-title, .title`);
	XCloseButton = $(`.wk-modal-close, [data-e2e="cg-close-button"], .cg-modal-header-buttons button`);
}

module.exports = Popup;

const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class WhitePapersPopup extends Popup {
	selector = `.wk-modal-opened`;

	Links = $$(`li a`);
	HighlightsLinks = $$(`li a mark`);
	CloseButton = $(`.wk-button-group-right .wk-button`);
	SearchInput = $(`input.wk-field-input`);
	SearchButton = $(`.wk-icon-search`);
	ResetSearchButton = $(`.reset-search-form`);
	NoResults = $(`.hints-container .query`);
}

module.exports = WhitePapersPopup;
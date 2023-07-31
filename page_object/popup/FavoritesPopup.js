const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);
const ToolbarButtons = require(`../components/toolbarButtons.component`);

class FavoritesPopup extends Popup {
	selector = `.cg-modal-content`;

	ToolbarButtons = $(new ToolbarButtons());
	DeleteButton = $(`.delete-button`);
	ConfirmButton = $(`.confirm-button`);
	SelectAllCheckbox = $(`thead input[type="checkbox"]`);
	NoResultsMessage = $(`.no-results p`);
	CloseButton = $(`.close-button`);
	Items = $$(`.list-item`);
	ItemNames = $$(`.link-item`);
	ItemCheckboxes = $$(`input`);
}

module.exports = FavoritesPopup;

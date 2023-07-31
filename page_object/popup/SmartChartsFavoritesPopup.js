const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SmartChartsFavoritesPopup extends Popup {
	selector = `.favoriteSmartChart .popup.visible`;

	SaveAndCloseButton = $(`.footer button.right`);
	NameOfFavoritesLabel = $(`.content label`);
	TextInput = $(`.content input`);
	CancelButton = $(`.footer button:not(.right)`);
}

module.exports = SmartChartsFavoritesPopup;
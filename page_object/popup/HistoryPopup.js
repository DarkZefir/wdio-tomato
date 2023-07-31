const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class HistoryPopup extends Popup {
	selector = `history-popup`;

	Items = $$(new Items());
	ViewDropdown = $(new ViewDropdown());
	SearchWithinNames = $(`input`);
	GoButton = $(`.search-btn`);
	CloseButton = $(`footer button`);
}

class ViewDropdown {
	selector = `.history-dropdown`;

	Items = $$(`.option`);
}

class Items {
	selector = `.result-item`;

	SearchInformationIcon = $(`.history-info-icon`);
	UnavailableItemInfo = $(`.unavailableItemIcon`);
	Link = $(`a`);
}

module.exports = HistoryPopup;
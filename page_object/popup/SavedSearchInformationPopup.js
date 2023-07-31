const { $ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class SavedSearchInformationPopup extends Popup {
	selector = `bmb-popup[name="savedSearchInformation"]`;

	SearchQueries = $(`div.searchQueryInfo div:nth-child(2)`);
}

module.exports = SavedSearchInformationPopup;
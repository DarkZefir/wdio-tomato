const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class CitedByPopup extends Popup {
	selector = `.citedByDetails div.popup`;

	DocumentInfoBox = $(new DocumentInfoBox());
	ContentItems = $(new ContentItems());
	ContentBox = $(`div.content`);

	OKButton = $(`button.send`);
	CloseButton = $(`.footer .close, .footer .button, .close.left`);
	ProceedButton = $(`.remove`);
	NumberItems = $$(`td:first-child div.ng-binding`);
	PrintButton = $(`.close.right`);
}

class DocumentInfoBox {
	selector = `.citedDocumentInfoContainer`;

	CaseTitle = $(`[ng-if="citedByDetailsCtrl.citedDocumentInfo.title"]`);
	CaseSignature = $(`[ng-if="historyItem.title"]`);
	CitationItemsLinks = $$(`[ng-repeat="citation in ::citedByDetailsCtrl.citedDocumentInfo.citations"]`);
	CitedByText = $(`span.citedByTextInfo`);
}

class ContentItems {
	selector = `table.citedByCitationsList`;

	Number = $(`td:first-child div.ng-binding`);
	CaseTitles = $$(`.case`);
	CitationList = $$(`.citationList`);
	Citations = $$(`span.citation`);
}

module.exports = CitedByPopup;
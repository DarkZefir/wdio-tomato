const { $ } = require(`@cucumber-e2e/po2`);

class ToolbarButtons {
	selector = `.buttons:nth-child(1), .buttons-left`;

	QuickPrintButton = $(`button.icon.print.quick, .quick-print-icon`);
	QuickEmailButton = $(`button.icon.email.quick, .quick-email-icon`);
	AddToButton = $(`button.icon.addTo, .add-to-icon`);
	PrintButton = $(`button:not(.quick).icon.print, .print-icon`);
	EmailButton = $(`button.icon.email:not(.quick), .email-icon`);
	DownloadButton = $(`button.icon.download, .download-icon`);
	CopyLinkButton = $(`button.icon.copyLink, .copy-link-icon`);
}

module.exports = ToolbarButtons;
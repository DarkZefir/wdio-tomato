const { $, $$ } = require(`@cucumber-e2e/po2`);
const TabTriggers = require(`./read/TabTriggers`);
const ContentsTab = require(`./read/ContentsTab`);
const InformationTab = require(`./read/InformationTab`);
const HistoryTab = require(`./read/HistoryTab`);
const DocumentFrame = require(`./read/DocumentFrame`);
const Toolbar = require(`./read/Toolbar`);
const ToolbarButtons = require(`../components/toolbarButtons.component`);

class ReadPage {
	ContentsTab = $(new ContentsTab());
	DocumentFrame = $(new DocumentFrame());
	HistoryTab = $(new HistoryTab());
	InformationTab = $(new InformationTab());
	TabTriggers = $(new TabTriggers());
	Toolbar = $(new Toolbar());
	ToolbarButtons = $(new ToolbarButtons());
	DATitle = $(`.titleBar .daTitle .title`);
	FootnotesTab = $(`.footnotes-panel, .footnotesTab`);
	FootnotesTabItems = $$(`.footnotes-panel .endBoxBottom`);
	FootnotesTabLinks = $$(`.footnotesTab .footnoteDesc a`);
	FootnotesTabRefs = $$(`.footnotes-panel .footnoteRef, .footnotesTab .footnoteRef`);
	FootnotesTabDescriptions = $$(`.footnotes-panel .footnoteDesc`);
	NotesHighlights = $$(`.osa-doc-annotation-fragment`);
	NotesIcons = $$(`.noteIcon`);
	MetadataPairs = $$(`tr.metadata`);
	ShowMetadata = $(`a.metadataLink`);
	MetadataLoadingIndicator = $(`.metadata-loading-indicator`);
	InlineWidget = $(`.documentInlineWidget`);
	InlineWidgetItems = $$(`.documentInlineWidget ul li a`);
	DocumentLoadingIndicator = $(`.document-loading-indicator`);
}

module.exports = ReadPage;

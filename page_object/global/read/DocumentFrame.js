const { $, $$ } = require(`@cucumber-e2e/po2`);

class DocumentFrame {
	selector = `.documentFrame, .documentContainer`;

	DocumentContent = $(new DocumentContent());
	RelatedItemsDropdown = $$(new RelatedItemsDropdown());
	SelectedHighlight = $(`.docSearchTermActive, .docSearchTerm.selected`);
	subDATitle = $(`.level2`);
	HighlightsWithoutSelectedElement = $$(`.docSearchTerm:not(.docSearchTermActive)`);
	Citations = $$(`.osa-rsi-citation, .citation-link`);
	DocumentParagraphs = $$(`.article p.hP, p.hP`);
	DocumentParagraphTitles = $$(`p.level-heading`);
	FootnoteBodyAnchors = $$(`a.osa-doc-anchor-link[uib-tooltip-template], .osa-doc-anchor-link:not(.endBoxBottom .osa-doc-anchor-link)`);
	FootnoteTooltip = $(`.tooltip`);
	FootnoteTooltipLinks = $$(`.tooltip a`);
	FootnoteTooltipTexts = $$(`.tooltip .hP.footnote.atomHL`);
	FootnotesHeader = $(`.osa-doc-footer-link`);
	FootnoteRefs = $$(`.endBoxBottom td.tableNote sup a.footnoteRef`);
	FootnoteDescriptions = $$(`td.footnoteDesc, .endBoxBottom .footnoteDesc`);
	Highlights = $$(`.docSearchTerm`);
	DisabledHighlights = $$(`.docSearchTerm.disable-highlights`);
	HistoryNotes = $$(`.osa-relate-item`);
	PathTitles = $$(`.pathTitle`);
	Title = $(`.docDisplay.docTitle, header h1`);
	DocumentPath = $(`.documentPath`);
	DocumentPathNodes = $$(`.documentPathNode`);
	GraphicLinks = $$(`.graphic`);
	HeadnoteHeader = $(`.osa-doc-header-link`);
	HeadnoteExpanded = $(`.osa-doc-header-link.expanded`);
	HeadnoteCollapsed = $(`.osa-doc-header-link.collapsed`);
}

class DocumentContent {
	selector = `.docContent, div.document-content`;

	CurrentVersionsLink = $(new CurrentVersionsLink());
	Title = $(`.title, .docTitle`);
	CautionLine = $(`.cg-notification-warning`);
	HistoryMenuItems = $$(`.history-menu-item:not(.active)`);
	ActiveHistoryMenuItems = $(`.history-menu-item.active`);
	CurrentVersionsDropdown = $(`.cg-dropdown-menu-wrapper`);
	CurrentVersionsDropdownItems = $$(`.cg-dropdown-menu-wrapper li *`);
}

class CurrentVersionsLink {
	selector = `#concurrent-versions-dropdown`;

	ArrowDown = $(`.wk-icon-filled-triangle-down`);
	ArrowUp = $(`.wk-icon-filled-triangle-up`);
}

class RelatedItemsDropdown {
	selector = `div.osa-relate-block`;

	Items = $$(`.osa-relate-block-item`);
}

module.exports = DocumentFrame;

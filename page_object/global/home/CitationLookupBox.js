const { $ } = require(`@cucumber-e2e/po2`);

class CitationLookupBox {
	selector = `.citationLookup.box`;

	Header = $(`.header`);
	GoButton = $(`.inputField button`);
	InputField = $(`.inputField input`);
	HelpIcon = $(`a.help`);
	ErrorMessage = $(`.errorMessage`);
}

module.exports = CitationLookupBox;
const { $, $$ } = require(`@cucumber-e2e/po2`);

class SearchWithinTagBox {
	selector = `.tagSearchBrowseFaqSection`;

	TopicsDropdown = $(new TopicsDropdown());
	Header = $(`.tagHeader`);
	Label = $(`label`);
	Separator = $(`.separator`);
	SearchInput = $(`.searchInput input`);
	SearchButton = $(`button[type=\"submit\"]`);
	BrowseWithinTheTopicsLink = $(`.browseWithin`);
}

class TopicsDropdown {
	selector = `.dropdown`;

	Button = $(`.selectTopics`);
	SelectAll = $(`.selectAll`);
	SelectAllCheckbox = $(`.selectAll .checkbox-label`);
	SelectAllInput = $(`.selectAll input`);
	Items = $$(`ul li`);
	ItemsLabel = $$(`ul li .input-title`);
	ItemsCheckbox = $$(`ul li .checkbox-label`);
	ItemsInput = $$(`ul li input`);
}

module.exports = SearchWithinTagBox;
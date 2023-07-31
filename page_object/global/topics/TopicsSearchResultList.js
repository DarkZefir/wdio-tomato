const { $, $$ } = require(`@cucumber-e2e/po2`);

class TopicsSearchResultList {
	selector = `.dashboard .box`;

	TopicsListContainer = $(`.topicsListContainer`);
	Header = $(`.topicsListContainer .topicsResultsHeader`);
	Name = $(`.topicsListContainer .topicsResultsHeader .topicsSorting`);
	SortingIcon = $(`.topicsListContainer .topicsResultsHeader .topicsSortingIcon`);
	Category = $(`.topicsListContainer .topicsResultsHeader .topicsHeaderItem:not(.topicsSorting)`);
	TopicLinks = $$(`.topicsListContainer a.topicsRowTopic`);
	Categories = $$(`.topicsListContainer span.topicsRowItem:not(.topicsHeaderItem)`);
	NoResultsMessage = $(`.topicsListContainer .topicsNoResultsMessage`);
}

module.exports = TopicsSearchResultList;

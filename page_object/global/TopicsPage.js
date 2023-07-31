const { $ } = require(`@cucumber-e2e/po2`);

const TaxStateTopicsList = require(`./topics/TaxStateTopicsList`);
const TaxInternationalTopicsListCountry = require(`./topics/TaxInternationalTopicsListCountry`);
const TaxFederalTopicsList = require(`./topics/TaxFederalTopicsList`);
const TopicsSearchResultList = require(`./topics/TopicsSearchResultList`);
const TaxTopicPage = require(`./topics/TaxTopicPage`);
const TaxSnapshotIframe = require(`./topics/TaxSnapshotIframe`);

class TopicsPage {
	TaxStateTopicsList = $(new TaxStateTopicsList());
	TaxInternationalTopicsListCountry = $(new TaxInternationalTopicsListCountry());
	TaxFederalTopicsList = $(new TaxFederalTopicsList());
	TopicsSearchResultList = $(new TopicsSearchResultList());
	TaxTopicPage = $(new TaxTopicPage());
	TaxSnapshotIframe = $(new TaxSnapshotIframe());

	ExpandAll = $(`.topButtonsContainer .topButton:first-of-type`);
	ArrowDown = $(`.topButtonsContainer .topButton:first-of-type .wk-icon-chevron-down`);
	CollapseAll = $(`.topButtonsContainer .topButton:last-of-type`);
	ArrowUp = $(`.topButtonsContainer .topButton:last-of-type .wk-icon-chevron-up`);

	TopicsListHeader = $(`.topicsHeaderContainer`);
	TopicsListTitle = $(`.topicsHeaderContainer .topicsPublicationTitle`);
	TopicsListSearchIcon = $(`.topicsHeaderContainer .topicsSearchIcon`);
	TopicsListSearchInput = $(`.topicsHeaderContainer .topicsSearchInput`);
	TopicsListClearSearch = $(`.topicsHeaderContainer .topicsClearSearch`);

}

module.exports = TopicsPage;
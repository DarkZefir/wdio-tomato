const { $, $$ } = require(`@cucumber-e2e/po2`);

class TaxStateTopicsList {
	selector = `.dashboard .box`;

	Boxes = $$(`.topicsTreeContainer .header.topicsAtsTree`);
	BoxTitles = $$(`.fullScreenBoxTitle a`);
	TopicLinks = $$(`a.secondLevelNode`);
	TopicsTreeContainer = $(`.topicsTreeContainer`);
}

module.exports = TaxStateTopicsList;
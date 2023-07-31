const { $, $$ } = require(`@cucumber-e2e/po2`);

class HistoryBox {
	selector = `.dashboard-history-box`;

	Title = $(`.boxTitle`);
	Links = $$(`.linkItem`);
	Time = $$(`.time-elapsed-info-box`);
	SeeAllButton = $(`.button`);
}

module.exports = HistoryBox;
const { $, $$ } = require(`@cucumber-e2e/po2`);

class PracticeAreasBox {
	selector = `.box.practiceAreas`;

	Customize = $(`.config`);
	SeeAll = $(`.seeAll>button`);
	Title = $(`.title`);
	PracticeAreaLinks = $$(`a:not(.config)`);
}

module.exports = PracticeAreasBox;
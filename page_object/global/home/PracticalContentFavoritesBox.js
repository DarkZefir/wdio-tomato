const { $, $$ } = require(`@cucumber-e2e/po2`);

class PracticalContentFavoritesBox {
	selector = `.practical-content-favorites-box`;

	Title = $(`.text`);
	StarIcon = $$(`.icon-star`);
	Links = $$(`.linkItem`);
	SeeAllButton = $(`.button`);
}

module.exports = PracticalContentFavoritesBox;
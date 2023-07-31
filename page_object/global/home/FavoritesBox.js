const { $, $$ } = require(`@cucumber-e2e/po2`);

class FavoritesBox {
	selector = `.favorites-box`;

	Title = $(`.boxTitle`);
	NoResults = $(`.no-results`);
	StarIcons = $$(`.icon-star`);
	Links = $$(`.linkItem`);
	SeeAll = $(`.button`);
}

module.exports = FavoritesBox;
const { $ } = require(`@cucumber-e2e/po2`);

class PxCchLearningCenterCoursesBox {
	selector = `div.box.courses`;

	Title = $(`h2 a`);
	Icon = $(`span.icon`);
	Summary = $(`span.summary`);
}

module.exports = PxCchLearningCenterCoursesBox;
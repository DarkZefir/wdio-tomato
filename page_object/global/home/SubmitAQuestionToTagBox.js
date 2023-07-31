const { $ } = require(`@cucumber-e2e/po2`);

class SubmitAQuestionToTAGBox {
	selector = `.tag-submit-question-widget`;

	Title = $(`.title`);
	TextForUser = $(`.text`);
	CompleteLink = $(`.online-form`);
	QuestionIcon = $(`.wk-icon-question`);
	BookIcon = $(`.wk-icon-book-page`);
}

module.exports = SubmitAQuestionToTAGBox;
const { $, $$ } = require(`@cucumber-e2e/po2`);

class CalendarWidget {
	selector = `.uib-datepicker-popup`;

	CloseButton = $(`.uib-close`);
	RightArrow = $(`button.uib-right`);
	LeftArrow = $(`button.uib-left`);
	TitleButton = $(`button.uib-title`);
	SelectedElement = $(`button.active`);
	SelectedMonthDays = $$(`.btn-sm span.ng-binding:not(.text-muted)`);
}

module.exports = CalendarWidget;
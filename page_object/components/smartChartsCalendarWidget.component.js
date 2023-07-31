const {$, $$} = require(`@cucumber-e2e/po2`);

class SmartChartsCalendarWidget {
	selector = `.highlight-updates-popover-tooltip.simple-tooltip`;

	XButton = $(`.close`);
	Title = $(`.popup-title span`);
	Description = $(`p:not(.popup-title)`);
	LeftNavigationButton = $(`.datepicker .pull-left`);
	RightNavigationButton = $(`.datepicker .pull-right`);
	YearMonthButton = $(`.datepicker .uib-daypicker .uib-title`);
	YearButton = $(`.datepicker .uib-title`);
	DaysButtons = $$(`.datepicker .btn.btn-default.btn-sm:not(.pull-left):not(.pull-right):not(.uib-title)`);
	CurrentDate = $(`.datepicker .btn.btn-default.btn-sm.active`);
	MonthButtons = $$(`.datepicker .btn.btn-default:not(.pull-left):not(.pull-right):not(.uib-title)`);
	YearButtons = $$(`.datepicker .btn.btn-default:not(.pull-left):not(.pull-right):not(.uib-title)`);
}

module.exports = SmartChartsCalendarWidget;

const { $, $$ } = require(`@cucumber-e2e/po2`);
const Popup = require(`../components/popup.component`);

class AccountInformationPopup extends Popup {
	selector = `bmb-popup.accountInformation`;

	EnterCurrentPassword = $(`.authorization input[type='password']`);
	EditButton = $(`.authorization button.close`);
	AccountInformationForm = $(`fieldset`);
	FirstName = $(`input[name='firstName']`);
	LastName = $(`input[name='lastName']`);
	CommunicationEmail = $(`.personal input[name='email']`);
	UserID = $(`.email input[name='endUserId']`);
	RetypeNewUserID = $(`.email input[ng-model*='accountInfo.retypedId']`);
	NewPassword = $(`.password input[ng-model*='accountInfo.password']`);
	RetypeNewPassword = $(`.password input[ng-model*='accountInfo.retypedPassword']`);
	ShowPassword = $(`#showPasswords`);
	SaveandClose = $(`.footer button.close.right`);
	CancelButton = $(`.footer .remove`);
	ErrorMessages = $$(`.error`);
}

module.exports = AccountInformationPopup;

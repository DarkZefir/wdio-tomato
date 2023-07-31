const { $ } = require(`@cucumber-e2e/po2`);

class LoginForm {
	selector = `.loginPage, .Login-styles__wk-page-layout--3a5LD, .IdpSelector-styles__wk-page-layout--2rQJu`;

	UsernameInput = $(`#vLogin_UserEmail , form>div:nth-of-type(2)>label:nth-of-type(1) input, input[name=username], [name=userId]`);
	PasswordInput = $(`#vLogin_Password , form>div:nth-of-type(2)>label:nth-of-type(2) input, input[name=password]`);
	LoginButton = $(`#vLogin , form button[type=\"submit\"]:not(#vForgot), .CoreButton-styles__core--1zkFn`);
	ApplicationLogo = $(`.appLogo, .HeaderIc-styles__appLogo--3E2Nq`);
	LoginButtonWithoutSSO = $(`button[type=\"submit\"]`);
	LoginErrorMessage = $(`form[name=loginForm] .error`);
	LoadingIndicator = $(`.loading , .global-loading-indicator`);
	RememberMe = $(`.actions span`);
	TermsOfUse = $(`.footer>span:first-of-type>a, .LoginForm-styles__terms-of-use--_8-zD :first-child a`);
	PrivacyAndCookies = $(`.footer>span:last-of-type>a, .LoginForm-styles__terms-of-use--_8-zD :last-child a`);
	ForceMeToLoginCheckbox = $(`[data-bind=\"checked: loginForced, click: loginForcedCheck\"], .CheckBox-styles__checkbox-field--KEUIg>input`);
	RememberMyUserIDCheckbox = $(`[data-bind=\"checked: rememberMyUserId, click: userIdCheck\"]`);
	RememberMyPasswordCheckbox = $(`[data-bind=\"checked: rememberMyPassword, click: passwordCheck\"]`);
	ForgotPassword = $(`.forgotPassword>a, .LoginForm-styles__footer-links--3fQ-8>a`);
	CreateUserID = $(`.create>a, .LoginForm-styles__username--3yeUL>a`);
	ErrorMessage = $(`.LoginForm-styles__wk-error--ZN4PW`);
}

module.exports = LoginForm;

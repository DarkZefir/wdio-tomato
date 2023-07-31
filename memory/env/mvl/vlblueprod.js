const Constants = require(`../../constants`);
class VLBLUEPROD extends Constants {
	url = `https://alb-prime-b.prod.vitallaw-production.wolterskluwer.cloud/`;
	openTokenUrl = `https://login.wolterskluwer.com/auth/getLogin`;
	createSessionUrl = `https://my.vitallaw.com/wk-cheetah-sso/createSession`;
	osaContextUrl = `https://services.intelliconnect.cch.com`;
	cpid = `WKUS-Legal-Cheetah`;
	cookiePostfix = ``;
	envTags = `@mvl and not (@dvl_only or @stg_only)`;
	loginPageTitle = `VitalLaw™ Login`;
	mainPageTitle = `VitalLaw`;
	treeNodeId = `csh-da-filter!WKUS-TAL-DOCS-PHC-{634E9C61-CD0D-415C-B241-F7F8EB1ECC9E}`;
}

module.exports = VLBLUEPROD;

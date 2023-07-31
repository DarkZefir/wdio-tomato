const Constants = require(`../../constants`);
class VLSTG extends Constants {
	url = `https://stg.my.vitallaw.com/`;
	openTokenUrl = `https://login.intelliconnect.stg.cch.com/auth/getLogin`;
	createSessionUrl = `https://stg.my.vitallaw.com/wk-cheetah-sso/createSession`;
	osaContextUrl = `https://services.intelliconnect.stg.cch.com`;
	cpid = `WKUS-Legal-Cheetah`;
	cookiePostfix = `_stg`;
	envTags = `@mvl and not (@dvl_only or @prod_only)`;
	loginPageTitle = `VitalLaw™ Login`;
	mainPageTitle = `VitalLaw`;
	treeNodeId = `csh-da-filter!WKUS-TAL-DOCS-PHC-{634E9C61-CD0D-415C-B241-F7F8EB1ECC9E}`;
}

module.exports = VLSTG;

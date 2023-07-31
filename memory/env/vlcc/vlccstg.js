const Constants = require(`../../constants`);
class VLCCSTG extends Constants {
	url = `https://stg.corporate.vitallaw.com/`;
	openTokenUrl = `https://login.intelliconnect.stg.cch.com/auth/getLogin`;
	createSessionUrl = `https://stg.corporate.vitallaw.com/wk-cheetah-sso/createSession`;
	osaContextUrl = `https://services.intelliconnect.stg.cch.com`;
	cpid = `WKUS-Legal-GCN`;
	cookiePostfix = ``;
	envTags = `@vlcc and not (@dvl_only or @prod_only)`;
	loginPageTitle = `VitalLaw™ for Corporate Counsel Login`;
	mainPageTitle = `VitalLaw for Corporate Counsel`;
	treeNodeId = `csh-da-filter!WKUS-TAL-DOCS-PHC-{26F6416F-7967-4410-A94B-60C594D8CD1D}`;
}

module.exports = VLCCSTG;

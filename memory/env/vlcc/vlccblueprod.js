const Constants = require(`../../constants`);

class VLCCBLUEPROD extends Constants {
	url = `https://alb-prime-b.prod.corporate-vl-prod.wolterskluwer.cloud/`;
	openTokenUrl = `https://login.wolterskluwer.com/auth/getLogin`;
	createSessionUrl = `https://alb-prime-b.prod.corporate-vl-prod.wolterskluwer.cloud/wk-cheetah-sso/createSession`;
	osaContextUrl = `https://services.intelliconnect.cch.com`;
	cpid = `WKUS-Legal-GCN`;
	cookiePostfix = ``;
	envTags = `@vlcc and not (@dvl_only or @stg_only)`;
	loginPageTitle = `VitalLaw™ for Corporate Counsel Login`;
	mainPageTitle = `VitalLaw for Corporate Counsel`;
	treeNodeId = `csh-da-filter!WKUS-TAL-DOCS-PHC-{26F6416F-7967-4410-A94B-60C594D8CD1D}`;
}

module.exports = VLCCBLUEPROD;

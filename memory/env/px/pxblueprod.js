const Constants = require(`../../constants`);
class PXBLUEPROD extends Constants {
	url = `https://alb-prime-b.prod.paychex-production.wolterskluwer.cloud/`;
	cpid = `WKUS-Legal-Paychex`;
	cookiePostfix = ``;
	envTags = `@px and not (@dvl_only or @stg_only)`;
	loginPageTitle = `Paychex® Login`;
	mainPageTitle = `Paychex`;
}

module.exports = PXBLUEPROD;

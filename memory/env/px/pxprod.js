const Constants = require(`../../constants`);
class PXPROD extends Constants {
	url = `https://paychex.wolterskluwer.com/`;
	cpid = `WKUS-Legal-Paychex`;
	cookiePostfix = ``;
	envTags = `@px and not (@dvl_only or @stg_only)`;
	loginPageTitle = `Paychex® Login`;
	mainPageTitle = `Paychex`;
}

module.exports = PXPROD;

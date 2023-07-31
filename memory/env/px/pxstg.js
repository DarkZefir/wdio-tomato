const Constants = require(`../../constants`);
class PXSTG extends Constants {
	url = `https://paychex-stg.wolterskluwer.com/`;
	cpid = `WKUS-Legal-Paychex`;
	cookiePostfix = `_stg`;
	envTags = `@px and not (@dvl_only or @prod_only)`;
	loginPageTitle = `Paychex® Login`;
	mainPageTitle = `Paychex`;
}

module.exports = PXSTG;

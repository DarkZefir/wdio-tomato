require(`expect-webdriverio`).setOptions({ wait: 10000 });
module.exports = global.expect;
delete global.expect;

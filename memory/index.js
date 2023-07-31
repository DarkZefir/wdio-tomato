const envs = {
	'VLSTG': require(`./env/mvl/vlstg`),
	'VLBLUEPROD': require(`./env/mvl/vlblueprod`),
	'VLPROD': require(`./env/mvl/vlprod`),
	'VLCCSTG': require(`./env/vlcc/vlccstg`),
	'VLCCBLUEPROD': require(`./env/vlcc/vlccblueprod`),
	'VLCCPROD': require(`./env/vlcc/vlccprod`),
	'PXSTG': require(`./env/px/pxstg`),
	'PXBLUEPROD': require(`./env/px/pxblueprod`),
	'PXPROD': require(`./env/px/pxprod`),
};

module.exports = new envs[process.env.ENV ?? `VLSTG`]();

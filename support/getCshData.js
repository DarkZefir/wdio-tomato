const memory = require(`@cucumber-e2e/memory2`);
const { fetchCSHData } = require(`./scripts`);

function getPAFilterName(paName) {
	const cpid = memory.getValue(`$cpid`);
	const cshPaMap = memory.getValue(`$cshPaMap`);
	let productName;
	switch (cpid) {
	case `WKUS-Legal-Cheetah`:
		productName = `VL`;
		break;
	case `WKUS-Legal-GCN`:
		productName = `VLCC`;
		break;
	default:
		productName = `VL`;
		break;
	}
	const paFilter = cshPaMap[productName][paName];
	if (!paFilter) {
		throw new Error(`No filter found for [${paName}] PA name`);
	}
	return paFilter;
}

async function getCshTreesForPA(paName) {
	const envUrl = memory.getValue(`$url`);
	const url = `${envUrl}__remoteService/dashboard/getCshTreesForPAs`;
	const paFilter = getPAFilterName(paName);
	const data = {
		paIds: [`csh-da-filter!${paFilter}`]
	};
	const response = await browser.executeAsync(fetchCSHData, url, data).catch(err => {
		throw new Error(`Failed to get csh tree for "${paName}" PA: ${err}`);
	});
	return response[0];
}

async function getBoxChildren(nodeId) {
	const envUrl = memory.getValue(`$url`);
	const url = `${envUrl}__remoteService/dashboard/getBoxChildren`;
	const data = {
		nodeIds: [nodeId]
	};
	const response = await browser.executeAsync(fetchCSHData, url, data).catch(err => {
		throw new Error(`Failed to get csh data for [${nodeId}] box: ${err}`);
	});
	return response[0];
}

function getMainContentTypes(cshData) {
	const mainContentTypes = cshData.rootNodes.filter(item => item.__metadata === `ContentRoot`);
	if (mainContentTypes.length === 0) throw new Error(`No Main Content Types found!`);
	return mainContentTypes;
}

function getMainContentTypeTitles(cshData) {
	const mainContentTypes = getMainContentTypes(cshData);
	return mainContentTypes.map(item => item.title.toUpperCase());
}

async function getContentTypeTitles(cshData) {
	const mainContentTypes = getMainContentTypes(cshData);
	const mainContentTypeBoxes = await Promise.all(mainContentTypes.map(item => getBoxChildren(item.id)));
	return mainContentTypeBoxes.map(box => box.children.map(item => item.title.toUpperCase().trim()));
}

async function getLawsAndRegulationsCsh(envUrl) {
	const url = `${envUrl}__remoteService/laws-regulations/getAvailableContentBoxes`;
	const envTreeNodeId = memory.getValue(`$treeNodeId`);
	const data = {
		treeNodeId: envTreeNodeId
	};
	return browser.executeAsync(fetchCSHData, url, data).catch(err => {
		throw new Error(`Failed to get csh data for Law and Regulations: ${err}`);
	});
}

module.exports = {
	getCshTreesForPA,
	getMainContentTypeTitles,
	getContentTypeTitles,
	getLawsAndRegulationsCsh
};

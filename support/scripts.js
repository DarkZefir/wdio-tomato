"use strict";

// TODO update all functions
function cleanUsersCustomization() {
	const asArray = data => {
		if (Array.isArray(data)) {
			return data;
		}
		if (!data) {
			return [];
		}
		return [data];
	};

	const x = angular.element(document.body).scope().$userConfigModel;
	return Promise.all([x.find(`dashboard`, [`box_`, `_linksGroupContent`, `_linksGroupVisibility`], false),
		x.find(`dashboard`, [`layoutMiddle_order`], false)]).then(function (results) {
		return asArray(results[0]).concat(results[1]);
	}).then(customizationsArray => {
		if (customizationsArray.length !== 0) {
			const userConfigModel = angular.element(document.body).scope().$userConfigModel;
			return userConfigModel.cleanAll().then(() => {
				window.location.reload();
				return Promise.resolve();
			});
		} else {
			return Promise.resolve();
		}
	});
}

function cleanSavedSearches(done) {
	const savedSearchesModel = angular.element(document).injector().get(`savedSearchesModel`);
	return savedSearchesModel.loadSavedSearches({ odataKey: `LastRunDate`, direction: `asc` })
		.then(savedSearches => savedSearchesModel.deleteSavedSearches(savedSearches))
		.then(done);
}

function logout() {
	return angular.element(document.body).scope().$state.go(`logout`);
}

function removeUserFolders(done) {
	const folderModel = angular.element(document).injector().get(`$folder`);
	return folderModel.loadFoldersList()
		.then(() => {
			const arrayOfFolders = folderModel.getVisibleFolders();
			const arrayOfPromises = [];
			arrayOfFolders.forEach(folder => {
				if (folder.accessLevel === `Owner`) {
					return arrayOfPromises.push(folderModel.deleteFolder(folder));
				}
			});
			return Promise.all(arrayOfPromises);
		})
		.then(done);
}

function cleanNewslettersSubs() {
	const newslettersModel = angular.element(document).injector().get(`$osaTracker`);
	return newslettersModel.getUserTrackers().then(subs => {
		if (subs.length > 0) {
			const promises = [];
			subs.forEach(sub => promises.push(osa.ca.service.userTrackers.remove(sub.id)));
			return Promise.all(promises)
				.then(() => window.location.reload());
		}
	})
		.then(() => Promise.resolve())
		.catch(err => console.error(err));
}

function cleanAnnotations(done) {
	const annotationsModel = angular.element(document.body).scope().$annotations;
	const deleteAnnotations = function (annotations) {
		const annotationsDocMap = new Map();
		annotations.forEach(annotation => {
			annotationsDocMap.set(annotation.annotationId, null);
		});
		return annotationsModel.deleteAnnotations(annotationsDocMap);
	};
	annotationsModel.getAllAnnotations()
		.then(deleteAnnotations)
		.then(done);
}

function cleanFavorites(done) {
	const favoritesModel = angular.element(document.body).scope().$favorites;
	const deleteFavorites = function (favorites) {
		favorites.forEach(function (favorite) {
			if (!favorite.isSystem) {
				favoritesModel.removeFavorites(favorite);
			}
		});
	};
	favoritesModel.getFavorites()
		.then(deleteFavorites)
		.then(done);
}

function cleanVisitedLinks(done) {
	const authModel = angular.element(document.body).scope().$auth;
	return authModel.getUserProfile().then(function (userProfile) {
		return Promise.resolve(window.localStorage.removeItem(`visitedlink_${userProfile.id}`));
	}).then(done);
}

function setOpenInNewTabToFalse() {
	const searchModel = angular.element(document.body).scope().$search;
	const openStatus = searchModel.getOpenInNewTabState();
	if (openStatus) {
		return searchModel.toggleOpenInNewTabState();
	}
}

function setDefaultPracticeArea(practiceAreaName) {
	const practiceAreasModel = angular.element(document).injector().get(`contextModel`);
	return practiceAreasModel.getContexts().then(arrayOfPracticeAreas => {
		const practiceAreaToSelect = arrayOfPracticeAreas.find(practiceArea => {
			return practiceArea.title === practiceAreaName;
		});
		return practiceAreasModel.setDefaultContextByShortName(practiceAreaToSelect.shortName).then(() => {
			return Promise.resolve();
		});
	});
}

function showTableOfContentToolbar(done) {
	const userPrefs = angular.element(document).injector().get(`$userPrefs`);
	return userPrefs.setUserPref(`cheetah.userprefs.showTocToolbar`, `true`).then(() => {
		// eslint-disable-next-line no-console
		console.log(`PREFERENCE: cheetah.userprefs.showTocToolbar set to true`);
		if (document.cookie.indexOf(`disableTocToolbarForSession`) != -1) {
			document.cookie = `disableTocToolbarForSession=; Max-Age=-99999999;`;
			// eslint-disable-next-line no-console
			console.log(`COOKIE disableTocToolbarForSession removed`);
		} else {
			// eslint-disable-next-line no-console
			console.log(`COOKIE disableTocToolbarForSession not found`);
		}
		done();
	});
}

function setThesaurusState(state) {
	angular.element(document.body).scope().$search.setThesaurusState(state);
	angular.element(document.body).scope().$search.saveThesaurusState();
}

function addDocumentToFolder(docId, folderName) {
	let isFolderExists = false;
	function getDocument(searchTerm) {
		const searchModel = angular.element(document.body).scope().$search;
		return searchModel.execute({ query: searchTerm }).then(result => {
			return result._result._metadata.osa2data.result.items[0];
		});
	}

	function getUserFoldersList() {
		const folderModel = angular.element(document).injector().get(`$folder`);
		return folderModel.loadFoldersList().then(() => {
			const foldersArray = folderModel.getVisibleFolders();
			return foldersArray.filter(folder => !folder.isSystem && folder.accessLevel === `Owner`);
		});
	}

	function createFolder(folderName) {
		const folderModel = angular.element(document).injector().get(`$folder`);
		return folderModel.createFolder(folderName);
	}

	function getUserFolderByName(folderName) {
		return getUserFoldersList().then(userFoldersArray => {
			const targetFolder = userFoldersArray.find(folder => folder.title === folderName);
			if (targetFolder) {
				isFolderExists = true;
				return targetFolder;
			} else {
				return createFolder(folderName).then(() => {
					return getUserFoldersList().then(foldersList => {
						const createdFolder = foldersList.find(folder => folder.title === folderName);
						if (createdFolder) {
							return createdFolder;
						} else {
							throw new Error(`Folder[${folderName}] not created properly!`);
						}
					});
				});
			}
		});
	}
	const folderModel = angular.element(document).injector().get(`$folder`);
	return getDocument(docId).then(doc => {
		return getUserFolderByName(folderName).then(targetFolder => {
			return folderModel.addDocumentsToFolder({ [doc.documentId]: { da: null, pa: `AllContent` } }, [doc], targetFolder, !isFolderExists).then(() => {
				return Promise.resolve();
			});
		});
	});
}

function addDocumentToFavorites(docId, allContent) {

	function getDocument(documentId) {
		const searchModel = angular.element(document).injector().get(`$search`);
		return searchModel.execute({ query: documentId }).then(search => {
			return search.result().items()[0];
		});
	}

	function createDocContextMap(doc, allContent) {
		const practiceAreasService = angular.element(document).injector().get(`practiceAreasHelper`);
		const practiceAreasModel = angular.element(document).injector().get(`practiceAreasModel`);
		const paPromise = allContent ? Promise.resolve(`AllContent`) : practiceAreasService.getShortName(practiceAreasModel.getCurrentPracticeArea());
		return paPromise.then(pa => {
			return {
				[doc.documentId]: {
					docContext: {
						pa
					}
				}
			};
		});
	}

	const favoritesModel = angular.element(document).scope().$favorites;
	return getDocument(docId).then(doc => {
		return createDocContextMap(doc, allContent).then(docContextMap => {
			return favoritesModel.addFavorites(doc, docContextMap);
		});
	});
}

function isDocumentPresentInFolder(docId, folderName) {
	const folderModel = angular.element(document).injector().get(`$folder`);

	function getUserFoldersList() {
		const folderModel = angular.element(document).injector().get(`$folder`);
		return folderModel.loadFoldersList().then(() => {
			const foldersArray = folderModel.getVisibleFolders();
			return foldersArray.filter(folder => !folder.isSystem && folder.accessLevel === `Owner`);
		});
	}

	function getUserFolderByName(folderName) {
		return getUserFoldersList().then(userFoldersArray => {
			const targetFolder = userFoldersArray.find(folder => folder.title === folderName);
			if (targetFolder) {
				return targetFolder;
			} else {
				throw new Error(`No folder with [${folderName}] name found!`);
			}
		});
	}

	return getUserFolderByName(folderName).then(folder => {
		return folderModel.getAllFolderItems(folder).then(folderItems => {
			return folderItems.some(folderItem => folderItem.documentId === docId);
		});
	});
}

async function deleteDailyAlerts() {
	const dailiesAlertsModel = angular.element(document).injector().get(`$searchDailyAlertsModel`);
	const userDailiesAlerts = await dailiesAlertsModel.getListOfAlerts();
	const removePromises = [];
	userDailiesAlerts.forEach(alert => {
		removePromises.push(dailiesAlertsModel.deleteAlertItem(alert.id));
	});
	Promise.all(removePromises).then(() => {
		// eslint-disable-next-line no-console
		console.log(`User's dailies alerts removed.`);
	});
}

function closePendo() {
	const okButtonsList = document.querySelectorAll(`._pendo-button-primaryButton._pendo-button`);
	const closeButtonsList = document.querySelectorAll(`._pendo-close-guide`);
	okButtonsList.forEach(btn => btn.click());
	return closeButtonsList.forEach(btn => btn.click());
}

function changeCommunicationEmail(newEmail) {
	const authModel = angular.element(document).injector().get(`$auth`);
	const authHelper = angular.element(document).injector().get(`authHelper`);
	const userInfo = new cheetah.ux.accountInformation.vo.AccountInfoVO(authModel.userProfile);
	if (userInfo.email !== newEmail) {
		fetch(`${location.origin}/__remoteService/account-information/updateAccountInformation`, {
			headers: {
				'content-type': `application/json`
			},
			body: `{"0":{"accountInfo":{"account":"${userInfo.account}","loginId":"${userInfo.loginId}","firstName":"${userInfo.firstName}","lastName":"${userInfo.lastName}","email":"${newEmail}","id":"${userInfo.id}","retypedId":"","password":"","retypedPassword":""}}}`,
			method: `POST`
		}).then(() => {
			authHelper.reloadUserProfile();
		});
	}
}

function fetchCSHData(serviceUrl, data, done) {
	return fetch(serviceUrl, {
		method: `POST`,
		headers: {'content-type': `application/json`},
		body: JSON.stringify({
			0: data,
		})
	})
		.then(response => response.json())
		.then(done);
}

module.exports = {
	setDefaultPracticeArea,
	cleanUsersCustomization,
	cleanSavedSearches,
	removeUserFolders,
	cleanNewslettersSubs,
	cleanAnnotations,
	cleanFavorites,
	cleanVisitedLinks,
	setOpenInNewTabToFalse,
	logout,
	setThesaurusState,
	addDocumentToFolder,
	addDocumentToFavorites,
	isDocumentPresentInFolder,
	deleteDailyAlerts,
	closePendo,
	changeCommunicationEmail,
	showTableOfContentToolbar,
	fetchCSHData
};

const { $ } = require(`@cucumber-e2e/po2`);

class InformationTab {
	selector = `.sidePanel.infoTab`;

	DocumentTitle = $(`.docTitle div:nth-child(2)`);
	Version = $(`.docInfo [ng-if='infoTabCtrl.edition'] .disabled`);
	CurrentAsOfDate = $(`.docInfo [ng-repeat='event in infoTabCtrl.ccEvents'] .disabled`);
	LastUpdatedDate = $(`.docInfo [ng-if='infoTabCtrl.releaseLastDay'] .disabled`);
	NextUpdateDate = $(`.docInfo [ng-if='infoTabCtrl.releaseUpdates.length > 0'] .disabled`);
	AuthorsBox = $(`.docInfo [ng-if='infoTabCtrl.creators.existAny()']`);
	Jurisdiction = $(`.docInfo [ng-if='infoTabCtrl.jurisdiction'] span`);
	CitationFormats = $(`.docInfo[ng-if='infoTabCtrl.citationBlockMetadataExists()'] li`);
	ScopeOfCoverage = $(`.docInfo [ng-if='infoTabCtrl.summary'] span`);
	UpdateFrequency = $(`.docInfo [ng-if='infoTabCtrl.updateFrequency'] span`);
}

module.exports = InformationTab;
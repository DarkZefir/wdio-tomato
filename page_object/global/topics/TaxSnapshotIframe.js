const { $ } = require(`@cucumber-e2e/po2`);

class TaxSnapshotIframe {
	selector = `.taxSnapshotFrame, .ac-tax-snapshot`;

	Header = $(`.ac-tax-snapshot-header`);
	HeaderCountry = $(`.ac-tax-snapshot-header .title-container h1`);
	HeaderTitle = $(`.ac-tax-snapshot-header .title-container small`);
	TaxAuthority = $(`.ac-tax-authority h2`);
	TaxAuthorityLink = $(`.ac-tax-authority a`);
	TaxYear = $(`.tax-year h2`);
	TaxYearBody = $(`.tax-year div`);
}

module.exports = TaxSnapshotIframe;

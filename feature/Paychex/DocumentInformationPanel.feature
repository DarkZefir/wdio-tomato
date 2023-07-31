@smoke
@px
@document_information_panel
Feature: Document Information Panel

  @CU-33111
  Scenario: [PX] Verify that info in Document Info Panel corresponds to document metadata
    * I am logged in
    * I open "09013e2c875842a0" document
    * "Document Frame > Document Content" should be visible
    * I click "Tab Triggers > Information"
    * "Information Tab" should be visible
    * Text of "Information Tab" should contain "INFORMATION"
    * I remember text of "Information Tab > Document Title" as "docTitle"
    * I remember text of "Information Tab > Jurisdiction" as "docJurisdiction"
    * I remember text of "Information Tab > Citation Formats" as "docCitationsFormats"
    * I remember text of "Information Tab > Scope Of Coverage" as "docScopeOfCoverage"
    * Text of "Information Tab" should not contain "CCH Incorporated and its affiliates and licensors. All rights reserved." ignoring case
    * I scroll to the bottom
    * I click "Show Metadata"
    * I should see "title" metadata parameter with "{$docTitle}" value
    * I should see "region" metadata parameter with "{$docJurisdiction}" value
    * I should see "ltr:summary" metadata parameter with "{$docScopeOfCoverage}" value
    * I should see "cch-paragraph-number" metadata parameter with "{$docCitationsFormats}" value

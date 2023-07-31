@critical_path
@mvl
Feature: Document Information Panel

  @CU-29701
  @local
  Scenario: Verify information in document info panel corresponds to the information in metadata
    * I am logged in
    * I perform search of "Regulation: Federal Tax Regulations, §1.0-1, Internal Revenue Code of 1954"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * I click "Tab Triggers > Information"
    * "Information Tab" should be visible
    * I remember text of "Information Tab > Document Title" as "docTitle"
    * I remember text of "Information Tab > Jurisdiction" as "docJurisdiction"
    * I remember text of "Information Tab > Citation Formats" as "docCitationsFormats"
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    * I should see "title" metadata parameter with "{$docTitle}" value
    * I should see "region" metadata parameter with "{$docJurisdiction}" value
    * I should see "citation" metadata parameter with "{$docCitationsFormats}" value

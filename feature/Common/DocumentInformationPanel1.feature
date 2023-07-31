@smoke
@mvl @vlcc
@ipa
@document_information_panel
Feature: Document Information Panel

  @CU-32037 @CU-32276
  Scenario: Verify fields of Document Info Panel and that they corresponds to document metadata
    * I am logged in
    # Open any document with all appropriate fields
    * I open "3d948fbe7c4a1000b00090b11c2ac4f107" document
    # Open Info Panel
    * "Document Frame > Document Content" should be visible
    * I click "Tab Triggers > Information"
    * "Information Tab" should be visible
    * Text of "Information Tab" should contain "INFORMATION"
    * "Information Tab > Version" should be visible
    * I remember text of "Information Tab > Version" as "docVersion"
    * I remember text of "Information Tab > Document Title" as "docTitle"
    # Check that appropriate items are displayed (those which can't be verified via metadata because of data format eg Dates)
    * "Information Tab > Current As Of Date" should be visible
    * "Information Tab > Last Updated Date" should be visible
    * "Information Tab > Next Update Date" should be visible
    * "Information Tab > Update Frequency" should be visible
    * "Information Tab > Authors Box" should be visible
    # Remember other items values
    * I remember text of "Information Tab > Jurisdiction" as "docJurisdiction"
    * I remember text of "Information Tab > Citation Formats" as "docCitationsFormats"
    * I remember text of "Information Tab > Scope Of Coverage" as "docScopeOfCoverage"
    * Text of "Information Tab" should not contain "CCH Incorporated and its affiliates and licensors. All rights reserved." ignoring case
    # Open metadata section
    * I scroll to the bottom
    * I click "Show Metadata"
    # Compare values from Info Panel with provided metadata parameters
    * I should see "title" metadata parameter with "{$docTitle}" value
    * I should see "edition" metadata parameter with "{$docVersion}" value
    * I should see "region" metadata parameter with "{$docJurisdiction}" value
    * I should see "ltr:summary" metadata parameter with "{$docScopeOfCoverage}" value
    * I should see "citation" metadata parameter with "{$docCitationsFormats}" value

@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegs

  @CU-43202
  Scenario: Verify toolbar panel for future version documents on Laws & Regulations
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    * I click "Search Bar > Future Versions Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I click "#{$randomInt(1, 25)} of Documents > Document Title"
    * "Document Frame > Title" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be enabled
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be enabled
    * "Toolbar Buttons > Print Button" should not be visible
    * "Toolbar Buttons > Email Button" should not be visible
    * "Toolbar Buttons > Download Button" should not be visible
    * "Toolbar Buttons > Copy Link Button" should not be visible

  @CU-43203
  Scenario Outline: Verify results navigation arrows for future versions on Laws & Regulations
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    * I click "Search Bar > Future Versions Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I remember random integer <condition> as "futVersToClick"
    * I remember text of "#{$<operation>($futVersToClick, 1)} of Documents > Document Title" as "docTit2"
    * I click "#{$futVersToClick} of Documents > Document Title"
    * "Document Frame > Title" should be visible
    * "Toolbar > <arrow>" should be visible
    * I click "Toolbar > <arrow>"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    * I remember "value" of "pcilr:hasEnforcementDate" metadata parameter as "versionDate" for L&R
    * I remember text of "Document Frame > Title" as "readPageTitle"
    * "{$docTit2}" text should contain "{$readPageTitle}" text ignoring whitespaces ignoring case ignoring punctuation marks
    * "{$versionDate}" date should be after current date

    Examples:
      | condition                | operation | arrow                   |
      | below "25"               | add       | Next Results Button     |
      | below "25" and above "1" | subtract  | Previous Results Button |

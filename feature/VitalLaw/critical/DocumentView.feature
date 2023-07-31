@critical_path
@mvl
Feature: Document View

  @CU-29091
  @local
  Scenario: Verify only "next result" control is displayed when the very first document from SRL was opened
    * I am logged in
    * I perform search of "international franchising"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Toolbar > Previous Results Button" should not be visible
    * "Toolbar > Next Results Button" should be visible

  @CU-29096
  @local
  Scenario: Verify only "previous result" control is displayed when the very last document from SRL is opened
    * I am logged in
    * I perform search of "mab012d5850ea7c401000952190b11c18cbab01 or eb92e6207e011000a437000d3a8b5a8e02"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#2 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Toolbar > Previous Results Button" should be visible
    * "Toolbar > Next Results Button" should not be visible

  @CU-29097
  Scenario: Verify that search terms highlights are not displayed when "Highlight search terms" checkbox is unchecked
    * I am logged in
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Toolbar" should be visible
    * Count of "Document Frame > Highlights" should be more than "0"
    * Background color of "Document Frame > #1 of Highlights" should be "#ffff00"
    * "Toolbar > Highlight Checkbox" should be selected
    * I click "Toolbar > Highlight Checkbox"
    * Background color of "Document Frame > #1 of Highlights" should not be "#ffff00"

  @CU-29100
  Scenario: Verify that focus is set on the first highlighted match when document is opened from SRL
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "business"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Toolbar" should be visible
    * Count of "Document Frame > Highlights" should be more than "0"
    * "Toolbar > Highlight Checkbox" should be selected
    * Each element of "Document Frame > Highlights" should match "^(business|Business|businesses)$"
    * Background color of "Document Frame > #1 of Highlights" should be "#fed009"

  @CU-29102
  Scenario: Verify focus is set on next highlighted search term on clicking "Next search highlight" button
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should not be visible
    * "Document Frame > Document Content" should be visible
    * "Toolbar" should be visible
    * Count of "Document Frame > Highlights" should be more than "0"
    * Each element of "Document Frame > Highlights" should match "^(tax|Tax|TAX)$"
    * "Toolbar > Highlight Checkbox" should be selected
    * Background color of "Document Frame > #1 of Highlights" should be "#fed009"
    * I click "Toolbar > Next Highlight Button"
    * Background color of "Document Frame > #2 of Highlights" should be "#fed009"

  @CU-32618
  Scenario: Verify that the focus is set to the corresponding section of document on clicking links from mini TOC in read view
    * I am logged in
    * I perform search of "WKUS_TAL_451"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * I remember text of "Document Frame > #4 of Citations" as "textOfCitation"
    * I click "Document Frame > #4 of Citations"
    * I wait 1 seconds
    * "Document Frame > #{$textOfCitation} in Document Paragraph Titles" should be in viewport

  @CU-32636
  Scenario: Verify that document opens in new tab when User clicks on citation link in read view which points to other document
    * I am logged in
    * I open "09013e2c82c6f65b" document
    * "Document Frame > Document Content" should be visible
    * I remember number of browser tabs
    * "Document Frame > #1 of Citations" should be visible
    * I scroll "Document Frame > #1 of Citations" to center of the window
    * I click "Document Frame > #1 of Citations"
    * I wait until "Loading Indicator" is gone
    * I switch to new tab

  @CU-32647
  Scenario: Verify that Results Overlay opens when User clicks on link which points to multiple results
    * I am logged in
    * I open "4cf9a44e7c8b10009a1ed8d385ad169404" document
    * "Document Frame > Document Content" should be visible
    * I click "Document Frame > #1 of Citations"
    * "Results Popup" should be visible

  @CU-32665
  Scenario: Verify document read view is opened when User clicks link on Results Overlay
    * I am logged in
    * I open "4cf9a44e7c8b10009a1ed8d385ad169404" document
    * "Document Frame > Document Content" should be visible
    * I click "Document Frame > #1 of Citations"
    * "Results Popup" should be visible
    * "Results Popup > #1 of Documents" should be visible
    * I remember number of browser tabs
    * I click "Results Popup > #1 of Documents"
    * I switch to new tab
    * "Document Frame > Document Content" should be visible

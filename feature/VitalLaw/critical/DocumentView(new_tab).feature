@critical_path
@mvl
Feature: Document View (new tab)

  @CU-29859
  Scenario: Verify that Global Header is present for the document opened in new tab by clicking a link to it from other document's text
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * I remember number of browser tabs
    * I click "Document Frame > #1 of Citations"
    * I wait until "Loading Indicator" is gone
    * I switch to new tab
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > Application Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header > Favorites Button" should be visible
    * "Header > History Dropdown" should be visible
    * "Header > Folders Dropdown" should be visible
    * "Header > Saved Items Dropdown" should be visible
    * "Header > News Dropdown" should be visible


  @CU-29860
  Scenario: Verify that Global Header is displayed for the document opened in new tab from 'Related Items' menu
    * I am logged in
    * I open "irc0109013e2c83d8fbd4" document
    * "Document Frame > Document Content" should be visible
    * I scroll to the top
    * I click "Document Frame > #1 of Related Items Dropdown"
    * I click "Document Frame > #1 of Related Items Dropdown > #1 of Items"
    * "Related Items Popup" should be visible
    * I click "Related Items Popup > #1 of Documents"
    * I switch to last tab
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > Application Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header > Favorites Button" should be visible
    * "Header > History Dropdown" should be visible
    * "Header > Folders Dropdown" should be visible
    * "Header > Saved Items Dropdown" should be visible
    * "Header > News Dropdown" should be visible

  @CU-29862
  Scenario: Verify that Global Header is displayed for the document opened in new tab through click on 'View In New Window' icon in document's read view
    * I am logged in
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    * "Document Frame > Document Content" should be visible
    * "Toolbar > View In New Window" should be visible
    * I click "Toolbar > View In New Window"
    * I switch to last tab
    * "Document Frame > Document Content" should be visible
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > Application Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header > Favorites Button" should be visible
    * "Header >  History Dropdown" should be visible
    * "Header > Folders Dropdown" should be visible
    * "Header > Saved Items Dropdown" should be visible
    * "Header > News Dropdown" should be visible


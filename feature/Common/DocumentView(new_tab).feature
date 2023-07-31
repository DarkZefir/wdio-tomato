@smoke
@mvl @vlcc
@document_view_new_tab
Feature: Document View (new tab)

  @CU-29858 @CU-32292
  Scenario: Verify that Global Header is present for the document opened in new tab from SRL
    * I am logged in
    # Search for "law"
    * I perform search of "deny"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    # Select "Open In New Tab" checkbox
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Click on 1st doc from Results List
    * I click "#1 of Documents"
    # Verify that doc is opened in new browser tab
    * I switch to last tab
    # Verify that Glabal Header is displayed
    * "Header" should be visible
    # Verify that the following elements are displayed in Global Header
    * "Header > WK Logo" should be visible
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
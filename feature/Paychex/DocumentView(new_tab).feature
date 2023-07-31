@smoke
@px
@document_view_new_tab
Feature: Document View (new tab)

  @CU-32953
  Scenario: [PX] Verify that Global Header is present for the document opened in new tab from SRL
    * I am logged in
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * I click "#1 of Documents"
    * I switch to last tab
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > WK Logo Full" should be visible
    * "Header > Home" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Practice Tools Button" should be visible
    * "Header > Favorites Button" should be visible
    * "Header > History Dropdown" should be visible
    * "Header > Folders Dropdown" should be visible
    * "Header > Saved Items Dropdown" should be visible
    * "Header > News Dropdown" should be visible

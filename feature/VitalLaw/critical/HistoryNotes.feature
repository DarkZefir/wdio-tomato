@critical_path
@mvl
Feature: History Notes

  @CU-29796
  Scenario: Verify "History Notes" trigger is displayed in document body
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "irc0109013e2c83d8fbd4"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of History Notes" should be visible
    * I click "Document Frame > #1 of History Notes"
    * "History Notes Popup" should be visible

  @CU-29807
  Scenario: Verify that corresponding document opens in new tab on clicking links in "History Notes" overlay
    * I am logged in
    * I perform search of "irc0109013e2c83d8fbd4"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of History Notes" should be visible
    * I click "Document Frame > #1 of History Notes"
    * "History Notes Popup" should be visible
    * I click "History Notes Popup > #1 of Documents"
    * I switch to last tab
    * I click "Show Metadata"
    * Text of "Document Frame" should contain "Current Internal Revenue Code, History Notes - SEC. 1, TAX IMPOSED.— History notes applicable to entire section."

  @CU-32691
  Scenario Outline: Verify that History notes overlay could be accessible from different documents
    * I am logged in
    * I open "<documentID>" document
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of History Notes" should be visible
    * I click "Document Frame > #1 of History Notes"
    * "History Notes Popup" should be visible
    * I click "History Notes Popup > X Close Button"
    * "History Notes Popup" should not be visible

    Examples:
      | documentID            |
      | irc0109013e2c83d8fbeb |
      | irc0109013e2c83dc429b |
      | irc0109013e2c83d8fbd4 |

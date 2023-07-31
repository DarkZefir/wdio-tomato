@smoke
@px
@notes_and_highlights
Feature: Notes And Highlights

  @CU-33258
  Scenario: [PX] Verify that Highlight from Read view is added to "Notes&Highlights" overlay
    * I am logged in
    * I open "09013e2c843fbcc1" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #3 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * I wait 2 seconds
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Items" should be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "1"
    * Text of "Notes And Highlights Popup" should contain "Last Modified"
    * Text of "Notes And Highlights Popup > #1 of Items" should contain "{$selectedText}" ignoring whitespaces
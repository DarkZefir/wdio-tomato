@critical_path
@mvl
Feature: Notes And Highlights 1

  @CU-29028
  Scenario: Verify that correct document with Highlight can be opened from "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * I remember text of "Document Frame > Title" as "docTitle"
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    * I remember text of "#1 of Notes Highlights" as "noteHighlight"
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Item Titles" should be visible
    * I click "Notes And Highlights Popup > #1 of Item Titles"
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > Title" should be "{$docTitle}"
    * Text of all "Notes Highlights" should equal "{$selectedText}" ignoring whitespaces
    * Text of "#1 of Notes Highlights" should contain "{$noteHighlight}" ignoring whitespaces
    * Background color of "#1 of Notes Highlights" should be "#aaffff"
    * Text color of "#1 of Notes Highlights" should be "#595959"

  @CU-29016
  Scenario: Verify that user can delete Highlights from "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Item Checkboxes" should be visible
    * I click "Notes And Highlights Popup > #1 of Item Checkboxes"
    * I click "Notes And Highlights Popup > Delete Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Notes And Highlights Popup > #1 of Items" should not be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "0"

  @CU-29019
  Scenario: Verify that Highlights from Read view is added to "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Items" should be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "1"
    * Text of "Notes And Highlights Popup" should contain "Last Modified"
    * I remember text of "Notes And Highlights Popup > #1 of Item Texts" as "popupText"
    * "$selectedText" text should contain "$popupText" text ignoring whitespaces ignoring punctuation marks

  @CU-29014
  Scenario: Verify that user can delete Notes from ‘Notes & Highlights’ overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * "Inline Widget" should be visible
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "first note" in "Add Note Popup > Note Input"
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * I click "Notes And Highlights Popup > #1 of Item Checkboxes"
    * I click "Notes And Highlights Popup > Delete Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "0"

  @CU-29008
  Scenario: Verify that user can delete highlight from Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    * I click "#1 of Notes Highlights"
    * "#1 of Inline Widget Items" should be visible
    * I click "#REMOVE HIGHLIGHT in Inline Widget Items"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "#1 of Notes Highlights" should not be visible
    * Count of "Notes Highlights" should be equal to "0"
    * Background color of "Document Frame > #2 of Document Paragraphs" should not be "#aaffff"

  @CU-29002
  Scenario: Verify that user can delete Note from Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum dolor sit amet" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * I click "#1 of Notes Icons"
    * I click "Edit Note Popup > Delete Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Edit Note Popup" should not be visible
    * "#1 of Notes Icons" should not be visible
    * "#1 of Notes Highlights" should not be visible

  @CU-28999
  Scenario: Verify UI elements on "Add Note" overlay on Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * Text of "Add Note Popup > Title" should be "ADD NOTE"
    * Value in "Add Note Popup > Note Input" should be ""
    * "Add Note Popup > Cancel" should be visible
    * "Add Note Popup > Cancel" should be enabled
    * "Add Note Popup > X Close Button" should be visible
    * "Add Note Popup > X Close Button" should be enabled
    * "Add Note Popup > Save And Close" should be visible
    * "Add Note Popup > Save And Close" should not be enabled
    * I click "Add Note Popup > Cancel"
    * "Add Note Popup" should not be visible

  @CU-28985
  Scenario: Verify that user can add Note to document from Read view
    * I am logged in
    * I open "sec01405c0ca87cc31000bd6a90b11c18cbab056" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    * I remember text of "#1 of Notes Highlights" as "noteHighlight"
    * Text of all "Notes Highlights" should contain "{$selectedText}" ignoring whitespaces
    * Background color of "#1 of Notes Highlights" should be "#aaffff"
    * Text color of "#1 of Notes Highlights" should be "#595959"

  @CU-28994
  Scenario: Verify that user can Edit Note on Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum dolor sit amet" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * I click "#1 of Notes Icons"
    * "Edit Note Popup" should be visible
    * I type " test" in "Edit Note Popup > Edit Note Input"
    * "Edit Note Popup > Save And Close Button" should be clickable
    * I click "Edit Note Popup > Save And Close Button"
    * "Edit Note Popup" should not be visible
    * I click "#1 of Notes Icons"
    * "Edit Note Popup" should be visible
    * Value in "Edit Note Popup > Edit Note Input" should be "Lorem ipsum dolor sit amet test"
    * I click "Edit Note Popup > X Close Button"
    * "Edit Note Popup" should not be visible
    * I remember "title" attribute of "#1 of Notes Icons" as "noteTooltip"
    * "{$noteTooltip}" text should be equal to "Lorem ipsum dolor sit amet test" text

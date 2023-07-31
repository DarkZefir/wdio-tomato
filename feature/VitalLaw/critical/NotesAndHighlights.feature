@critical_path
@mvl
Feature: Notes And Highlights

  @CU-29024
  Scenario: Verify that Note from Read view is added to "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * "#1 of Notes Highlights" should be visible
    * I remember text of "#1 of Notes Highlights" as "notesHighlightsText"
    * "#1 of Notes Icons" should be visible
    * Text of all "Notes Highlights" should equal "{$selectedText}" ignoring whitespaces
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Items" should be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "1"
    * Text of "Notes And Highlights Popup" should contain "Last Modified"
    * I remember text of "Notes And Highlights Popup > #1 of Item Texts" as "popupText"
    * "$selectedText" text should contain "$popupText" text ignoring whitespaces ignoring punctuation marks
    * "$popupText" text should contain "$notesHighlightsText" text ignoring whitespaces ignoring punctuation marks

  @CU-29038
  Scenario: Verify that Highlight will be removed from "Notes And Highlights" overlay when user removes Highlight from Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * I click "#1 of Notes Highlights"
    * "#1 of Inline Widget Items" should be visible
    * I click "#REMOVE HIGHLIGHT in Inline Widget Items"
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * Text of "Notes And Highlights Popup" should contain "You currently have no notes or highlights."

  @CU-29056
  Scenario: Verify that Note is removed from document when user removes it from "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I remember selected text as "selectedText"
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum dolor sit amet" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * I click "Notes And Highlights Popup > #1 of Item Checkboxes"
    * I click "Notes And Highlights Popup > Delete Button"
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Notes And Highlights Popup > #1 of Items" should not be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "0"
    * I click "Notes And Highlights Popup > Close Button"
    * "Notes And Highlights Popup" should not be visible
    * "Notes Icons" should not be visible
    * Background color of "Document Frame > #1 of Document Paragraphs" should not be "#aaffff"

  @CU-28977
  Scenario: Verify that user can add Note to document from Read view
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I remember selected text as "selectedText"
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, q" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * "#1 of Notes Icons" should be visible
    * Background color of "#1 of Notes Highlights" should be "#aaffff"
    * Text color of "#1 of Notes Highlights" should be "#595959"

  @CU-29057
  Scenario Outline: Verify that Highlight is removed from document when user removes it from "Notes&Highlights" overlay
    * I am logged in
    * I open "<docId>" document
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * "#1 of Inline Widget Items" should be visible
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#HIGHLIGHT in Inline Widget Items"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Items" should be visible
    * I click "Notes And Highlights Popup > #1 of Item Checkboxes"
    * I click "Notes And Highlights Popup > Delete Button"
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Notes And Highlights Popup > #1 of Items" should not be visible
    * Count of "Notes And Highlights Popup > Items" should be equal to "0"
    * I click "Notes And Highlights Popup > Close Button"
    * "Notes And Highlights Popup" should not be visible
    * Background color of "Document Frame > #1 of Document Paragraphs" should not be "#aaffff"

    Examples:
      | docId                              |
      | 2cefab2e7bf71000a73d90b11c2ac4f102 |

  @CU-29037
  Scenario: Verify that Note will be removed from "Notes and Highlights" overlay when user removes Note from Read view
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
    * I click "Confirmation Popup > Confirm Button"
    * "Edit Note Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > No Results Text" should be visible
    * Text of "Notes And Highlights Popup" should contain "You currently have no notes or highlights."

  @CU-29033
  Scenario: Verify that "Notes & Highlights" overlay can be opened from "Saved Items" drop down (UI elements)
    * I am logged in
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * Text of "Notes And Highlights Popup" should contain "You currently have no notes or highlights."
    * Size of "Notes And Highlights Popup > Content" should be "500" by "650"
    * Text of "Notes And Highlights Popup > Title" should be "NOTES & HIGHLIGHTS"
    * "Notes And Highlights Popup > Search Input" should be visible
    * Placeholder text for "Notes And Highlights Popup > Search Input" should be "Search Within ..."
    * "Notes And Highlights Popup > Search Button" should be visible
    * "Notes And Highlights Popup > Search Button" should not be enabled
    * "Notes And Highlights Popup > Sorting Menu" should be visible
    * Text of "Notes And Highlights Popup > Sorting Menu" should be "LAST MODIFIED"
    * "Notes And Highlights Popup > Toolbar Buttons" should be visible
    * "Notes And Highlights Popup > Toolbar Buttons > Download Button" should be visible
    * "Notes And Highlights Popup > Toolbar Buttons > Email Button" should be visible
    * "Notes And Highlights Popup > Toolbar Buttons > Print Button" should be visible
    * "Notes And Highlights Popup > Toolbar Buttons > Download Button" should not be enabled
    * "Notes And Highlights Popup > Toolbar Buttons > Email Button" should not be enabled
    * "Notes And Highlights Popup > Toolbar Buttons > Print Button" should not be enabled
    * "Notes And Highlights Popup > Close Button" should be visible
    * "Notes And Highlights Popup > Close Button" should be enabled
    * "Notes And Highlights Popup > X Close Button" should be visible
    * "Notes And Highlights Popup > X Close Button" should be enabled
    * "Notes And Highlights Popup > Delete Button" should be visible
    * "Notes And Highlights Popup > Delete Button" should not be enabled
    * Text of "Notes And Highlights Popup" should contain "Last Modified"
    * Text of "Notes And Highlights Popup" should contain "Note/Highlight"
    * I click "Notes And Highlights Popup > Close Button"
    * "Notes And Highlights Popup" should not be visible

  @CU-29027
  Scenario: Verify that correct document with Note can be opened from "Notes&Highlights" overlay
    * I am logged in
    * I open "mtg0186dd14a47be91000944a90b11c2ac4f103" document
    * "Document Frame > Document Content" should be visible
    * I remember text of "Document Frame > Title" as "docTitle"
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    * I click "#ADD NOTE in Inline Widget Items"
    * "Add Note Popup" should be visible
    * I type "Lorem ipsum" in "Add Note Popup > Note Input"
    * "Add Note Popup > Save And Close" should be clickable
    * I click "Add Note Popup > Save And Close"
    * "Add Note Popup" should not be visible
    * "#1 of Notes Icons" should be visible
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Item Titles" should be visible
    * I remember text of "Notes And Highlights Popup > #1 of Item Texts" as "popupText"
    * "$selectedText" text should contain "$popupText" text ignoring whitespaces ignoring punctuation marks
    * I click "Notes And Highlights Popup > #1 of Item Titles"
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > Title" should be "{$docTitle}"
    * Background color of "#1 of Notes Highlights" should be "#aaffff"
    * Text color of "#1 of Notes Highlights" should be "#595959"
    * "#1 of Notes Icons" should be visible

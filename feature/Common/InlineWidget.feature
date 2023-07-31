@smoke
@mvl @vlcc @px
@inline_widget
Feature: Inline Widget Print, Copy

  @CU-29072 @CU-32432 @CU-33151
  Scenario: Verify Inline widget appears when user select (highlight) a part of the text in document body
    * I am logged in
    # Perform search of "merger"
    * I perform search of "merger"
    # Open Second doc from results in Read View
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    # Select text in Second paragraph
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    # Verify that "Inline Widget" is displayed
    * "Inline Widget" should be visible
    # Verify that the following items are displayed within "Inline Widget":
    * Text of "#3 of Inline Widget Items" should contain "PRINT"
    * Text of "#1 of Inline Widget Items" should contain "ADD NOTE"
    * Text of "#2 of Inline Widget Items" should contain "HIGHLIGHT"
    * Text of "#4 of Inline Widget Items" should contain "COPY"

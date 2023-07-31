@smoke
@px
@document_view
Feature: Document View

  @CU-32959
  Scenario: [PX] Verify next doc from SRL opens in read view on clicking "next result" control
    * I am logged in
    * I perform search of "library"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * I remember text of "#2 of Documents > Document Title" as "secondDoc"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * I click "Toolbar > Next Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "search-title" metadata parameter as "metadataTitle"
    * "{$metadataTitle}" text should contain "{$secondDoc}" text ignoring whitespaces ignoring case

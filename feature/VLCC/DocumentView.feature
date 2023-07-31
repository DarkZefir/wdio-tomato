@smoke
@vlcc
@document_view
Feature: Document View

  @CU-32299
  @ipa
  Scenario Outline: Verify next doc from SRL opens in read view on clicking "next result" control
    * I am logged in
    # Perform search
    * I perform search of "<searchTerm>"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    # Remember title of 2nd doc in results as "secondDoc"
    * I remember text of "#2 of Documents > Document Title" as "secondDoc"
    # Open 1st doc from results in Read View
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    # Click "Next Result" button in Read View
    * I click "Toolbar > Next Results Button"
    * I wait until "Loading Indicator" is gone
    # Wait until other doc's content is loaded
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    # Open "Show Metadata" section
    * I wait 5 seconds
    * I click "Show Metadata"
    * I wait until "Loading Indicator" is gone
    # Verify that "search-title" parameter corresponds 2nd doc's title from "Results" page remembered as "{$secondDoc}"
    * I remember <step1>
    * <step2> text ignoring whitespaces ignoring case

    Examples:
      | doc type | step1                                                         | step2                                                 | searchTerm |
      | regular  | value of "search-title" metadata parameter as "metadataTitle" | "{$metadataTitle}" text should contain "{$secondDoc}" | tax        |

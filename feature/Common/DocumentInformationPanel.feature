@smoke
@mvl @vlcc @px
@ipa
@document_information_panel
Feature: Document Information Panel

  @CU-29073 @CU-32284 @CU-33110
  Scenario: Verify document info panel is displayed on document read view
    * I am logged in
    # Perform search of "tax" and open first doc from results in Read View
    * I perform search of "tax"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    # Click on "Information" icon next to Content Panel
    * I click "Tab Triggers > Information"
    # Verify that "Information" tab content is displayed with title "INFORMATION"
    * "Information Tab" should be visible
    * Text of "Information Tab" should contain "INFORMATION"

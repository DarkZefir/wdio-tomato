@critical_path
@mvl
Feature: Help

  @CU-29798
  Scenario: Verify that "Help' Overlay can be opened from Global Header
    * I am logged in
    * I am on "ALL CONTENT" PA
    * "Header > Help" should be visible
    * I click "Header > Help"
    * I wait until page title is "VitalLaw™ Help"
    * I should see "HELP" text on page
@smoke
@mvl @vlcc
@treatise_updates

Feature: Treatise Updates

  @CU-29808 @CU-32390
  Scenario: Verify UI of 'Treatise Updates' tab in 'News' overlay
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #3 of List"
    * Text of "News Popup > Active Tab" should contain "TREATISE UPDATES"
    * I switch to "Trackers Updates Iframe" iframe
    * I wait until "Loading Indicator" is gone
    * "Trackers Updates Iframe > Email Input" should be clickable
    * "Trackers Updates Iframe > Email Input" text should not be equal to "" text
    * "Trackers Updates Iframe > Save Button" should not be enabled
    * Text of "Trackers Updates Iframe > View Dropdown" should contain "ALL"
    * "Trackers Updates Iframe > Select All Checkbox" should be visible
    * "Trackers Updates Iframe > #1 of Notifications Groups" should be visible
    * "Trackers Updates Iframe > Subscribe Button" should not be enabled
    * "Trackers Updates Iframe > Unsubscribe Button" should not be enabled
    * Order of "Trackers Updates Iframe > Notifications Groups" should be alphabetical ignoring syntax
@critical_path
@mvl
Feature: Treatises Updates

  @CU-29811
  Scenario: Verify UI of expanded list of treatises
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #3 of List"
    * Text of "News Popup > Active Tab" should contain "TREATISE UPDATES"
    * I switch to "Trackers Updates Iframe" iframe
    * "Trackers Updates Iframe > #1 of Notifications Groups" should be visible
    * "Trackers Updates Iframe > #1 of Notifications PA Checkboxes" should not be visible
    * "Trackers Updates Iframe > #1 of RSS Icons" should not be visible
    * I click "Trackers Updates Iframe > #1 of Notifications Groups"
    * "Trackers Updates Iframe > #1 of Notifications Subscribed Items" should be visible
    * "Trackers Updates Iframe > #1 of RSS Icons" should be visible
    * "Trackers Updates Iframe > #1 of Notifications PA Checkboxes" should be visible

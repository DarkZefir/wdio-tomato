@smoke
@ipa
@mvl @vlcc
@subscribed_titles
Feature: Subscribed Titles

  @CU-31347 @CU-32381
  Scenario: Verify that Subscribed Titles Overlay can be opened
    * I am logged in
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items"
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * "Titles Popup > Search Input" should be visible
    * "Titles Popup > Search Button" should be visible
    * "Titles Popup > Letter Navigation" should be visible
    * "Titles Popup > #1 of Publications Links" should be visible
    * "Titles Popup > View Dropdown" should be visible
    * "Titles Popup > X Close Button" should be visible
    * "Titles Popup > Close Button" should be visible
    * I click "Titles Popup > View Dropdown Button"
    * "Titles Popup > #1 of View Dropdown Menu Items" should be visible
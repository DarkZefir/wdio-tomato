@smoke
@px
@subscribed_titles
Feature: Subscribed Titles

  @CU-33091
  Scenario: [PX] Verify that Practice Tools Overlay can be opened
    * I am logged in
    * I click "Header > Practice Tools Button"
    * "Practice Tools Popup" should be visible
    * "Practice Tools Popup > Search Input" should be visible
    * "Practice Tools Popup > Search Button" should be visible
    * "Practice Tools Popup > Letter Navigation" should be visible
    * "Practice Tools Popup > #1 of Publications Links" should be visible
    * "Practice Tools Popup > X Close Button" should be visible
    * "Practice Tools Popup > Close Button" should be visible

  @CU-33092
  Scenario: [PX] Verify that Subscribed Titles Overlay can be opened
    * I am logged in
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * "Titles Popup > Search Input" should be visible
    * "Titles Popup > Search Button" should be visible
    * "Titles Popup > Letter Navigation" should be visible
    * "Titles Popup > #1 of Publications Links" should be visible
    * "Titles Popup > X Close Button" should be visible
    * "Titles Popup > Close Button" should be visible

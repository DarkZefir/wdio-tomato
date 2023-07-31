@performance
Feature: Practice Tools

  Scenario Outline: Practice_Tools_Popup_Load PT Overlay can be opened <n>
    * I am logged in
    * "Header > Practice Tools Button" should be visible
    * I click "Header > Practice Tools Button"

    * I start "Practice Tools Popup Load" measurement
    * "Practice Tools Popup" should be visible
    * "Practice Tools Popup > Search Input" should be visible
    * "Practice Tools Popup > Search Input" should be clickable
    * "Practice Tools Popup > Search Button" should be visible
    * "Practice Tools Popup > #1 of Letter Markers" should be visible
    * "Practice Tools Popup > #1 of Publications Links" should be visible
    * "Practice Tools Popup > View Dropdown" should be visible
    * "Practice Tools Popup > X Close Button" should be visible
    * "Practice Tools Popup > Close Button" should be visible
    * I stop "Practice Tools Popup Load" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

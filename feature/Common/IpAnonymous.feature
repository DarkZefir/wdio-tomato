@smoke
@mvl @vlcc
@ipa_only
Feature: IP Anonymous

  @CU-37759 @CU-37896
  Scenario: Verify UI of Global Header for IP Anonymous user
    * I am logged in
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should not be visible
    * "Header > Log In" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > WK Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Favorites Button" should not be visible
    * "Header > History Dropdown" should not be visible
    * "Header > Folders Dropdown" should not be visible
    * "Header > Saved Items Dropdown" should not be visible
    * "Header > News Dropdown" should not be visible
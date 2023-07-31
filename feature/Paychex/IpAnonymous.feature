@smoke
@px
@ipa_only
Feature: IP Anonymous

  @CU-37897
  Scenario: [PX] Verify that user can open the app as IP Anonymous user
    * I am logged in
    * "Info Banner" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should not be visible
    * "Header > Log In" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > WK Logo Full" should be visible
    * "Header > Home" should be visible
    * "Header > Practice Tools Button" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Favorites Button" should not be visible
    * "Header > History Dropdown" should not be visible
    * "Header > Folders Dropdown" should not be visible
    * "Header > Saved Items Dropdown" should not be visible
    * "Header > News Dropdown" should not be visible
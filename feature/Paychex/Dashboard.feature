@smoke
@px
@dashboard
Feature: Dashboard

  @CU-33155
  Scenario: [PX] Verify UI of Home Page
    * I am logged in
    * "Px Resources Box" should be visible
    * "Px Hot Topics Box" should be visible
    * "Px Useful Links Box" should be visible
    * "Px Cch Learning Center Courses Box" should be visible
    * "Px Tools Box" should be visible
    * "#1 of News Headlines Box" should be visible
    * "Px Accountant Knowledge Center Box" should be visible

  @CU-33157
  Scenario: [PX] Verify Home page is opened on clicking the Application logo
    * I am logged in
    * I perform search of "tax"
    * "Header > Application Logo" should be visible
    * I click "Header > Application Logo"
    * I wait until page title is "Paychex"
    * I perform search of "wage"
    * I click "#1 of Documents"
    * "Header > Application Logo" should be visible
    * I click "Header > Application Logo"
    * I wait until page title is "Paychex"

  @CU-33226
  Scenario: [PX] Verify List of items in Useful Links box on Home Page
    * I am logged in
    * "Px Useful Links Box" should be visible
    * Text of "Px Useful Links Box > Title" should be "USEFUL LINKS"
    * Count of "Px Useful Links Box > Links" should be equal to "4"
    * I should see the following lines in "Px Useful Links Box > Links":
      | Client Referral Program |
      | Customer Support        |
      | Member Book Discount    |
      | Video Highlights        |
    * "Px Useful Links Box > Links" urls should contain the following lines:
      | https://www.paychex.com/form/refer-a-client-to-paychex |
      | https://support.cch.com/contact/                       |
      | https://www.cchcpelink.com/paychex                     |
      | https://wklrus-td.wistia.com/medias/5gentk81on         |

  @CU-33229
  Scenario: [PX] Verify CCH Learning Center Courses Box on Home Page
    * I am logged in
    * "Px Cch Learning Center Courses Box" should be visible
    * "Px Cch Learning Center Courses Box > Icon" should be visible
    * Text of "Px Cch Learning Center Courses Box > Title" should be "CCH LEARNING CENTER COURSES"
    * Text of "Px Cch Learning Center Courses Box > Summary" should contain "Earn FREE CPE credits from your desktop or mobile device. Access the featured courses online - any time."


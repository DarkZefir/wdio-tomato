@critical_path
@mvl
Feature: Site Preferences

  @logout
  @CU-29079
  Scenario Outline: Verify that all subscribed PAs plus All Content are displayed in Site Preferences
    * I am logged in as "<UserName>" with "<UserPassword>" password
    * I am on "ALL CONTENT" PA
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember text of "Practice Areas Box > Practice Area Links" as "practiceAreasNames"
    * I include "All Content" into "$practiceAreasNames"
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Practice Area Dropdown"
    * I remember text of "Site Preferences Popup > Practice Area Dropdown > Practice Areas List Items" as "sitePreferencesPAOptions"
    * "$practiceAreasNames" collection should be equal to "$sitePreferencesPAOptions" collection ignoring case ignoring order
    Examples:
      | UserName                    | UserPassword |
      | AutoUser1@wolterskluwer.com | password     |
      | govercontract@wk.com        | password     |

  @CU-29080
  Scenario: Verify that PA is set as home page when user chooses it as default in Site Preferences
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Practice Area Dropdown"
    * I remember number of "Site Preferences Popup > Practice Area Dropdown > Items" as "PAs"
    * I remember random integer below "{$PAs}" as "index"
    * I remember text of "Site Preferences Popup > Practice Area Dropdown > #{$index} of Items" as "text"
    * I click "Site Preferences Popup > Practice Area Dropdown > #{$index} of Items"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I click "Header > Home"
    * Text of "Session Navigator > Session Navigator Tab" should be "{$text}" ignoring case

  @CU-29083
  Scenario: Verify the UI of Site Preferences overlay
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * Text of "Site Preferences Popup > Popup Title" should be "SITE PREFERENCES"
    * "Site Preferences Popup > Practice Area Dropdown" should be visible
    * "Site Preferences Popup > Show Toolbar Checkbox" should be visible
    * "Site Preferences Popup > Show Toolbar Checkbox" should be selected
    * "Site Preferences Popup > Show Toolbar Label" should be visible
    * Text of "Site Preferences Popup > Show Toolbar Label" should be "Show Table of Contents Toolbar"
    * "Site Preferences Popup > Save And Close" should not be enabled
    * "Site Preferences Popup > Cancel" should be enabled
    * "Site Preferences Popup > X Close Button" should be enabled
    * "Site Preferences Popup > Help Icon" should be enabled
    * "Site Preferences Popup > Practice Area Dropdown" should be enabled

    * I remember "title" attribute of "Site Preferences Popup > Help Icon" as "tooltip1"
    * "{$tooltip1}" text should contain "Site Preferences" text

    * I click "Site Preferences Popup > Practice Area Dropdown"
    * "Site Preferences Popup > Practice Area Dropdown > Practice Areas List Header" should be visible
    * "Site Preferences Popup > Practice Area Dropdown > Resources List Header" should be visible
    * Text of "Site Preferences Popup > Practice Area Dropdown > Practice Areas List Header" should be "PRACTICE AREAS"
    * Text of "Site Preferences Popup > Practice Area Dropdown > Resources List Header" should be "RESOURCES"
    * Count of "Site Preferences Popup > Practice Area Dropdown > Practice Areas List Items" should be more than "0"
    * Count of "Site Preferences Popup > Practice Area Dropdown > Resources List Items" should be more than "0"
    * Order of "Site Preferences Popup > Practice Area Dropdown > Practice Areas List Items" should be alphabetical
    * Order of "Site Preferences Popup > Practice Area Dropdown > Resources List Items" should be alphabetical

    * I click "Site Preferences Popup > Practice Area Dropdown > #Securities - All in Items"
    * Text of "Site Preferences Popup > Practice Area Dropdown" should contain "SECURITIES - ALL"
    * "Site Preferences Popup > Save And Close" should be enabled

    * I click "Site Preferences Popup > Cancel"
    * "Site Preferences Popup" should not be visible
    * Text of "Session Navigator > Session Navigator Tab" should be "ALL CONTENT"

  @CU-35821
  Scenario: Verify Practical Content And Laws & Regulations could be set as a default page
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Practice Area Dropdown"
    * I should see "RESOURCES" text on page
    * I should see "PRACTICE AREAS" text on page

    * I remember number of "Site Preferences Popup > Practice Area Dropdown > Resources List Items" as "resources"
    * I remember random integer below "{$resources}" as "index"
    * I remember text of "Site Preferences Popup > Practice Area Dropdown > #{$index} of Resources List Items" as "page"
    * I click "Site Preferences Popup > Practice Area Dropdown > #{$index} of Resources List Items"
    * Text of "Site Preferences Popup > Practice Area Dropdown" should be "{$page}" ignoring case ignoring whitespaces
    * "Site Preferences Popup > Save And Close" should be enabled

    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible

    * I click "Header > Home"
    * I wait until page title is "VitalLaw"

  @CU-37685
  Scenario: Verify that the correct Help page is opened after click on 'Help' icon in 'Site Preferences' overlay
    * I am logged in
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Help Icon"
    * I switch to last tab
    * I wait until page title is "Setting Home Page – VitalLaw™ Help"
    * I should see "Setting Home Page" text on page
    * I switch to first tab

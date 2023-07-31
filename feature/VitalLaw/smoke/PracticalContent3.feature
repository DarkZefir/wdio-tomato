@smoke
@mvl
@practical_content
Feature: Practical Content

  @CU-35336
  @logout
  Scenario: Verify that filter selections made on "Practical Content" dashboard are not sticky between sessions
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I remember number of "Content Boxes" as "cbNum"
    * I click "Practice Areas Filter > Label"
    * I click "Practice Areas Filter > Select All CheckBox"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "avlblPA1"
    * I click "Practice Areas Filter > #{$randomInt(1, $avlblPA1)} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "avlblPA2"
    * I click "Practice Areas Filter > #{$randomInt(1, $avlblPA2)} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * I click "Practice Areas Filter > Label"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I click "Practical Content Filter > Select All CheckBox"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "avlblPC1"
    * I click "Practical Content Filter > #{$randomInt(1, $avlblPC1)} of Not Selected Enabled Options"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "avlblPC2"
    * I click "Practical Content Filter > #{$randomInt(1, $avlblPC2)} of Not Selected Enabled Options"
    * "Practical Content Filter > Selected Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    * Count of "Content Boxes" should be equal to "2"
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Logout in Items"
    * I wait until "Loading Indicator" is gone
    * I type "practCont@wk.com" in "Login Form > Username Input"
    * I type "password" in "Login Form > Password Input"
    * I click "Login Form > Login Button"
    * I wait until page title is "$mainPageTitle"
    * I wait until "Loading Indicator" is gone
    * "Header > Practical Content Button" should be clickable
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$cbNum}"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "{$subtract($PAs,2)}"
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"
    * I click "Practice Areas Filter > Label"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "$cbNum"
    * Text of "Practical Content Filter > Label" should be "All Practical Content"

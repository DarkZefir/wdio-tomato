@smoke
@vlcc
@practical_content
Feature: Practical Content

  @CU-35421
  @logout
  Scenario: [VLCC] Verify that filter selections made on "Practical Content" dashboard are not sticky between sessions
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I remember number of "Content Boxes" as "boxes"
    * I click "Practice Areas Filter > Label"
    * I click "Practice Areas Filter > Select All CheckBox"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "avlblPA"
    * I remember random integer below "{$avlblPA}" as "ch1"
    * I click "Practice Areas Filter > #{$ch1} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "avlblPA"
    * I remember random integer below "{$avlblPA}" as "ch2"
    * I click "Practice Areas Filter > #{$ch2} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * I click "Practice Areas Filter > Label"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I click "Practical Content Filter > Select All CheckBox"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "avlblPC"
    * I remember random integer below "{$avlblPC}" as "ch1"
    * I click "Practical Content Filter > #{$ch1} of Not Selected Enabled Options"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "avlblPC"
    * I remember random integer below "{$avlblPC}" as "ch2"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > #{$ch2} of Not Selected Enabled Options"
    * "Practical Content Filter > Selected Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    * Count of "Content Boxes" should be equal to "2"
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Logout in Items"
    * I wait until "Loading Indicator" is gone
    * I am logged in as "practCont@wk.com" with "password" password
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$boxes}"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "{$PAs}"
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"
    * I click "Practice Areas Filter > Label"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "{$boxes}"
    * Text of "Practical Content Filter > Label" should be "All Practical Content"

  @CU-35449
  @logout
  Scenario: [VLCC] Verify that all PAs are displayed in "Practice Areas" filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "ALL CONTENT" PA
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember text of "Practice Areas Box > Practice Area Links" as "practiceAreasNames"
    * I include "All Practice Areas" into "$practiceAreasNames"
    * I remember number of "Practice Areas Box > Practice Area Links" as "practiceAreasNum"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * Count of "Practice Areas Filter > Options" should be equal to "{$add($practiceAreasNum, 1)}"
    * I remember text of "Practice Areas Filter > Options Label" as "practiceAreasFilterOptions"
    * "$practiceAreasNames" collection should be equal to "$practiceAreasFilterOptions" collection ignoring case ignoring punctuation marks ignoring whitespaces ignoring order

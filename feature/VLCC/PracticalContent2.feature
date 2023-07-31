@smoke
@vlcc
@practical_content
Feature: Practical Content

  @CU-35404
  @logout
  Scenario: [VLCC] Verify that user is able to change selections in 'Practice Areas' Filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    # Remembers number of PAs and calculates number of items in Practice Areas Filter
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    # Opens PAs filter
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * I remember number of "Practice Areas Filter > Selected Disabled Options" as "disabledOptions"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "{$PAs}"
    # Selects random PA to click
    * I click "Practice Areas Filter > Select All Selected CheckBox"
    * Text of "Practice Areas Filter > Label" should be "0 Practice Areas" ignoring case
    *  "Practice Areas Filter > Select All" should be visible
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "optionsToSelect"
    * I remember random integer below "{$optionsToSelect}" and above "1" as "selectedPA"
    * I remember text of "Practice Areas Filter > #{$selectedPA} of Not Selected Enabled Options" as "title"
    * I click "Practice Areas Filter > #{$selectedPA} of Not Selected Enabled Options"
    * "Practice Areas Filter > #1 of Selected Options" should be visible
    * "Practice Areas Filter > Select All Partially Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "1"
    * Text of "Practice Areas Filter > Label" should be "{$title}" ignoring case
    # Selects second random PA to click
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "optionsToSelect2"
    * I remember random integer below "{$optionsToSelect2}" and above "1" as "selectedPA2"
    * I click "Practice Areas Filter > #{$selectedPA2} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas" ignoring case
    # Selects All
    * I click "Practice Areas Filter > Select All Partially Selected CheckBox"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"
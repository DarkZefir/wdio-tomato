@smoke
@mvl
@practical_content
Feature: Practical Content

  @CU-36167
  @logout
  Scenario: Verify that "Reset All Filters" button is displayed on Practical Content when "Practice Areas" filter is not in a default state
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Practice Areas Filter > Label"
    * I remember number of "Practice Areas Filter > Selected Enabled Options" as "PAs"
    * I remember random integer below "{$PAs}" and above "1" as "PAforclick"
    * I click "Practice Areas Filter > #{$PAforclick} of Selected Options CheckBox"
    * I remember number of "Practice Areas Filter > Selected Enabled Options" as "numOfPAs"
    * I click "Practice Areas Filter > Label"
    * Text of "Practice Areas Filter > Label" should be "{$numOfPAs} Practice Areas" ignoring case
    * I click "Practice Areas Filter > Label"
    * I click "Reset All Filters Button"
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * "Reset All Filters Button" should not be visible

  @CU-36170
  @logout
  Scenario: Verify that "Reset All Filters" button is displayed on Practical Content when "Content Type" filter is not in a default state
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * I remember number of "Practical Content Filter > Selected Enabled Options" as "Contentnumber"
    * I remember random integer below "{$Contentnumber}" as "Contentforclick"
    * I click "Practical Content Filter > #{$Contentforclick} of Selected Enabled Options CheckBox"
    * I remember number of "Practical Content Filter > Selected Enabled Options" as "numOfcont"
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > Label" should be "{$numOfcont} Practical Content Types" ignoring case
    * I click "Reset All Filters Button"
    * Text of "Practical Content Filter > Label" should be "All Practical Content" ignoring case
    * "Reset All Filters Button" should not be visible

  @CU-36172
  @logout
  Scenario: Verify that "Reset All Filters" button is displayed on Practical Content SRL when filters are not in a default state
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "Practice Areas Filter" should be visible
    * I click "Practice Areas Filter > Label"
    * I remember number of "Practice Areas Filter > Selected Enabled Options" as "PAs"
    * I remember random integer below "{$PAs}" and above "1" as "PAforclick"
    * I click "Practice Areas Filter > #{$PAforclick} of Selected Enabled Options CheckBox"
    * I remember number of "Practice Areas Filter > Selected Enabled Options" as "numOfPAs"
    * I click "Practice Areas Filter > Label"
    * Text of "Practice Areas Filter > Label" should be "{$numOfPAs} Practice Areas" ignoring case
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * I remember number of "Practical Content Filter > Selected Enabled Options" as "Contentnumber"
    * I remember random integer below "{$Contentnumber}" as "Contentforclick"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > #{$Contentforclick} of Selected Enabled Options CheckBox"
    * I remember number of "Practical Content Filter > Selected Enabled Options" as "numOfcont"
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > Label" should be "{$numOfcont} Practical Content Types" ignoring case
    * I click "Reset All Filters Button"
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * Text of "Practical Content Filter > Label" should be "All Practical Content" ignoring case
    * "Reset All Filters Button" should not be visible

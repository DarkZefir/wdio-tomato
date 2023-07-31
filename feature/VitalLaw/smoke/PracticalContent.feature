@smoke
@mvl
@practical_content
Feature: Practical Content

  @CU-35065
  @logout
  Scenario: Verify UI of 'Practical Content' Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * "Practice Areas Filter" should be visible
    * Count of "Content Boxes" should be equal to "8"
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * Count of "Practice Areas Filter > Options" should be equal to "{$subtract($PAs, 1)}"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I remember number of "Content Boxes" as "boxes"
    * Text of "Practical Content Filter > Label" should be "All Practical Content"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Options" should be equal to "{$add($boxes, 1)}"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should not be visible
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within Practical Content"
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Thesaurus Checkbox" should be visible
    * "#1 of Content Boxes" should be visible
    * Text of "My Practical Content Favorites Box > Title" should be "My Practical Content Favorites" ignoring case
    * Text of "Footer > Copyright" should be "© 2022 CCH Incorporated and its affiliates and licensors. All rights reserved."
    * "Footer > Terms Of Use" should be visible
    * "Footer > Privacy And Cookies" should be visible
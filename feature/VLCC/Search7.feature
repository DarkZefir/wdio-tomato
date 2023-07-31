@smoke
@vlcc
@search
Feature: Search 7

  @CU-38127
  Scenario: [VLCC] Verify that VITALLAW AGREEMENT & CLAUSE BUILDER links can be found in SRL
    * I am logged in
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    # random item from dropdown is being selected here
    * I remember number of "Lawgood Box > Select Dropdown > Items" as "dropdownCount"
    * I remember random integer below "{$dropdownCount}" as "randomItem"
    * I remember text of "Lawgood Box > Select Dropdown > #{$randomItem} of Items" as "selectedItemText"
    * I click "Lawgood Box > Select Dropdown > #{$randomItem} of Items"
    # random link is being selected here
    * I remember number of "Lawgood Box > Links" as "linksCount"
    * I remember random integer below "{$linksCount}" as "randomItem"
    * I remember text of "Lawgood Box > #{$randomItem} of Links" as "selectedItemText"
    # search from All Content page
    * I perform search of "Lawgood: {$selectedItemText}"
    * Text of "#1 of Search Result Items > Link" should contain "Lawgood: {$selectedItemText}"

  @CU-38866
  Scenario: [VLCC] Verify that 'Bankruptcy Essentials' link can be opened from SRL
    * I am logged in
    * I perform search of "Bankruptcy Essentials"
    * Text in collection of "Search Result Items > Link" should contain "Bankruptcy Essentials"
    * I click "#Bankruptcy Essentials in Search Result Items > Link"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should contain "BANKRUPTCY ESSENTIALS"

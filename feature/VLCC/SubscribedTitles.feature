@smoke
@vlcc
@subscribed_titles
Feature: Subscribed Titles

  @CU-38117
  Scenario: [VLCC] Verify that VITALLAW AGREEMENT & CLAUSE BUILDER links can be found in Titles overlay
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
    * I remember text of "Lawgood Box > #{$randomInt(1, $linksCount)} of Links" as "selectedItemText"
    # search in Titles overlay
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * I type "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text of "Titles Popup > #1 of Publications Links" should contain "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}"

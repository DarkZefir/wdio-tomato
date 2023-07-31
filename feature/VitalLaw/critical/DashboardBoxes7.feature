@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-42956
  Scenario Outline: VITALLAW AGREEMENT & CLAUSE BUILDER Agreements links can be found in SRL
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    # random item from dropdown is being selected here
    * I click "Lawgood Box > Select Dropdown > #1 of Items"
    # random link is being selected here
    * I remember number of "Lawgood Box > Links" as "linksCount"
    * I remember random integer below "{$linksCount}" as "randomItem"
    * I remember text of "Lawgood Box > #{$randomItem} of Links" as "selectedItemText"
    # search from All Content page
    * I perform search of "Lawgood: {$selectedItemText}"
    * Text of "#1 of Search Result Items > Link" should contain "Lawgood: {$selectedItemText}"

    Examples:
      | Practice Area                             |
      | Labor & Employment Law                    |
      | Human Resources                           |
      | Intellectual Property                     |
      | Securities - Corporation Law & Governance |
      | Practice of Law                           |

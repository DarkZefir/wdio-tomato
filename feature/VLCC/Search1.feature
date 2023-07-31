@smoke
@vlcc
@search
Feature: Search 1

  @CU-32443
  Scenario Outline: [VLCC] Search panel UI verification - field, button, advanced search link, help icon
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within <Practice Area>"
    * "Search Bar > Help Icon" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Advanced Search" should be visible

    Examples:
      | Practice Area          |
      | All Content            |
      | Government Contracts   |
      | HR, Labor & Employment |
      | Life Sciences          |
      | Energy                 |

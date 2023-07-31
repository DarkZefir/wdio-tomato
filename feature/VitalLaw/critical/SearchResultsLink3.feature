@critical_path
@mvl
Feature: Search Results Link 3

  @CU-37284
  Scenario Outline: Verify that 'Search Results' link is not displayed on TLP's Read view opened by click on 'View In New Window' icon
    * I am logged in
    * I perform search of "<term>"
    * I wait until "Loading Indicator" is gone
    * I remember index of "Filter Groups > Label" exactly matching "TAX ESSENTIALS" as "topics"
    * I remember number of "#{$topics} of Filter Groups > Filter Items" as "topicsNum"
    * I click "#{$topics} of Filter Groups > #{$randomInt(1, $topicsNum)} of Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar > View In New Window" should be visible
    * I click "Toolbar > View In New Window"
    * I switch to last tab
    * "Search Bar > Search Results" should not be visible
    Examples:
      | term |
      | law  |

  @CU-37282
  Scenario Outline: Verify that 'Search Results' link is not displayed on document's Read view opened by click on 'View In New Window' icon
    * I am logged in
    * I perform search of "<term>"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar > View In New Window" should be visible
    * I click "Toolbar > View In New Window"
    * I switch to last tab
    * "Search Bar > Search Results" should not be visible
    Examples:
      | term |
      | law  |

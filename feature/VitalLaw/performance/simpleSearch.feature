@performance
Feature: Search Performance

  Scenario Outline: Simple Global Search #<n>
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I type "tax" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"

    * I start "Simple Global Search" measurement
    * "#1 of Search Result Items" should be visible
    * I stop "Simple Global Search" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

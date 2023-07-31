@critical_path
@mvl
Feature: Search Pills

  @CU-32091
  @local
  Scenario: Verify that search works correctly when user removes first pill
    * I am logged in
    * I perform search of "child OR dependent"
    * I perform search of "care tax"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "care tax"
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "care tax"

  @CU-32092
  @local
  Scenario: Verify that user can edit second pill
    * I am logged in
    * I am on "TAX - FEDERAL" PA
    * I perform search of "State Taxation"
    * I type "Reve" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #3 of Suggestions > Text" should be visible
    * I remember text of "Search Bar > Search Suggestions > Most Relevant Cluster > #3 of Suggestions > Text" as "searchText"
    * I click "Search Bar > Search Suggestions > Most Relevant Cluster > #3 of Suggestions > Text"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #2 of Search Pills > Edit"
    * I type " on the classification" in "Search Bar > #2 of Search Pills > Input"
    * I click "Search Bar > #2 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "State Taxation"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "{$searchText} on the classification"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "State Taxation >> {$searchText} on the classification"

  @CU-32093
  @local
  Scenario: Verify that user can remove second pill and then perform new SW
    * I am logged in
    * I perform search of "Blue Sky Regulation News"
    * I type "maj" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text" should be visible
    * I click "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #2 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * I perform search of "major"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Blue Sky Regulation News"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "major"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "Blue Sky Regulation News >> major"

  @CU-32095
  @local
  Scenario: Verify that SW works correctly ( first search is selected from recent searches and second - typed in quotes)
    * I am logged in
    * I click "Search Bar > Search Input"
    * I remember random integer below "5" as "recentSearch"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #{$recentSearch} of Suggestions > Text" should be visible
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #{$recentSearch} of Suggestions > Text" as "recentSearchText"
    * I click "Search Bar > Search Suggestions > Recent Searches Cluster > #{$recentSearch} of Suggestions > Text"
    * I wait until "Loading Indicator" is gone
    * I type ""Accounting for Income Taxes"" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$recentSearchText}"
    * Text of "Search Bar > #2 of Search Pills > Text" should be ""Accounting for Income Taxes""
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "{$recentSearchText} >> "Accounting for Income Taxes""

  @CU-32096
  @local
  Scenario: Verify that user can remove all search pills and select Titles from Search suggestions
    * I am logged in
    * I perform search of "Contract drafting"
    * I perform search of "of Lawyering OR Hazard"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "0"
    * I type "trad" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" should be visible
    * I remember text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" as "title"
    * I click "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * Text of "DA Title" should be "{$title}"

  @CU-32267
  @local
  Scenario Outline: Verify that Boolean connectors can be applied to SWSR
    * I am logged in
    * I perform search of "law day"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "law day"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "law day >> <search>"
    Examples:
      | search             |
      | court and appeals  |
      | child or dependent |
      | child OR dependent |
      | rico not puerto    |
      | rico NOT puert     |


@smoke
@mvl @vlcc @px
@search_results_link
Feature: Search Results Link

  @CU-32703 @CU-33296 @CU-33213
  @local
  Scenario: Verify that Search Results List is displayed after click on 'Search Results' link in document's Read view
    * I am logged in
    * I perform search of "Central bank"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#2 of Documents"
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search1}" number should be equal to "{$search2}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Central bank"
    * Count of "Search Bar > Search Pills" should be equal to "1"

  @CU-32756 @CU-33298 @CU-33214
  @local
  Scenario: Verify that 'Search Results' link is not displayed in document's Read view opened in New tab
    * I am logged in
    * I perform search of "Central bank"
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * I remember number of browser tabs
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * I switch to new tab
    * "Search Bar > Search Results" should not be visible
  # test case is expected to fail because of the issue CU-32759

  @CU-32706 @CU-33300 @CU-33215
  @local
  Scenario: Verify that after performing Search Within results user is able to navigate to original Search Results List by click on 'Search Results' link on 'Search Results' page
    * I am logged in
    * I perform search of "Cental bank"
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "case"
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search1}" number should be equal to "{$search2}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Cental bank"
    * Count of "Search Bar > Search Pills" should be equal to "1"

  @CU-32712 @CU-33301 @CU-33216
  Scenario: Verify that if more than one Search Within results is done, 'Search Results' drop down is available with links to previous Search Results Lists on 'Search Results' page
    * I am logged in
    * I perform search of "california"
    * I perform search of "law"
    * I perform search of "tax"
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "california""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "law""

  @CU-32718 @CU-33302 @CU-33217
  Scenario: Verify that 'Search Results' drop down is available with links to previous Search Results Lists on Read view after execution of Search Within
    * I am logged in
    * I perform search of "california"
    * I perform search of "law"
    * I wait until "Loading Indicator" is gone
    * I click "#2 of Documents > Link"
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "2"
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "california""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "law""

  @CU-32720 @CU-33303 @CU-33218
  Scenario: Verify that user is able to navigate to original Search Results List by click on First link in 'Search Results' drop down from Read view after performance of Search Within Results
    * I am logged in
    * I perform search of "state"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "idaho"
    * I wait until "Loading Indicator" is gone
    * I click "#2 of Documents > Link"
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "2"
    * I click "Search Bar > Search Results Dropdown > #1 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search2}" number should be equal to "{$search1}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "state"
    * Count of "Search Bar > Search Pills" should be equal to "1"

  @CU-32721 @CU-33304 @CU-33219
  Scenario: Verify that user is able to navigate to List of Results for Search Within by click on correspondent link in 'Search Results' drop down from Read view after performance of Search Within Results
    * I am logged in
    * I perform search of "case"
    * I perform search of "bank"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#3 of Documents > Link"
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "2"
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search2}" number should be equal to "{$search1}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "case"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "bank"
    * Count of "Search Bar > Search Pills" should be equal to "2"
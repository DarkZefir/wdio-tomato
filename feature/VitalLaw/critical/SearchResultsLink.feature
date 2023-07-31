@critical_path
@mvl
Feature: Search Results Link

  @CU-32715
  Scenario: Verify that 'Search Results' drop down on 'Search Results' page contains link to the original Search Result List and up to 5 last Search Within Results Lists
    * I am logged in
    * I perform search of "tax"
    * I perform search of "law"
    * I perform search of "case"
    * I perform search of "idaho"
    * I perform search of "merger"
    * I perform search of "state"
    * I perform search of "appeal"
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "6"
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "tax""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "law""
    * Text of "Search Bar > Search Results Dropdown > #3 of Items" should be "Search within results from keyword "case""
    * Text of "Search Bar > Search Results Dropdown > #4 of Items" should be "Search within results from keyword "idaho""
    * Text of "Search Bar > Search Results Dropdown > #5 of Items" should be "Search within results from keyword "merger""
    * Text of "Search Bar > Search Results Dropdown > #6 of Items" should be "Search within results from keyword "state""
    * I click "Search Bar > Search Results Dropdown > Expand Button" using JS
    * I perform search of "order"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "6"
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "tax""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "case""
    * Text of "Search Bar > Search Results Dropdown > #3 of Items" should be "Search within results from keyword "idaho""
    * Text of "Search Bar > Search Results Dropdown > #4 of Items" should be "Search within results from keyword "merger""
    * Text of "Search Bar > Search Results Dropdown > #5 of Items" should be "Search within results from keyword "state""
    * Text of "Search Bar > Search Results Dropdown > #6 of Items" should be "Search within results from keyword "appeal""

  @CU-32716
  Scenario: Verify that 'Search Results' drop down on Read view contains link to the original Search Result List and up to 5 last Search Within Results Lists
    * I am logged in
    * I perform search of "tax"
    * I perform search of "law"
    * I perform search of "case"
    * I perform search of "idaho"
    * I perform search of "merger"
    * I perform search of "state"
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "6"
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "tax""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "law""
    * Text of "Search Bar > Search Results Dropdown > #3 of Items" should be "Search within results from keyword "case""
    * Text of "Search Bar > Search Results Dropdown > #4 of Items" should be "Search within results from keyword "idaho""
    * Text of "Search Bar > Search Results Dropdown > #5 of Items" should be "Search within results from keyword "merger""
    * Text of "Search Bar > Search Results Dropdown > #6 of Items" should be "Search within results from keyword "state""
    * I click "Search Bar > Search Results Dropdown > #6 of Items"
    * I perform search of "appeal"
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Count of "Search Bar > Search Results Dropdown > Items" should be equal to "6"
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "tax""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "case""
    * Text of "Search Bar > Search Results Dropdown > #3 of Items" should be "Search within results from keyword "idaho""
    * Text of "Search Bar > Search Results Dropdown > #4 of Items" should be "Search within results from keyword "merger""
    * Text of "Search Bar > Search Results Dropdown > #5 of Items" should be "Search within results from keyword "state""
    * Text of "Search Bar > Search Results Dropdown > #6 of Items" should be "Search within results from keyword "appeal""

  @CU-32738
  Scenario: Verify that user is able no navigate to each of previous Search Results Lists if number of Searches Within done does not move Search within results links up in 'Search Results' drop down on 'Search Results' page
    * I am logged in
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "count"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * I perform search of "merger"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * I perform search of "california"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * I perform search of "credit"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search5"
    * I perform search of "bank"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search6"
    * I perform search of "state"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #6 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search6"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #5 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search5"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #4 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search4"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #3 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search3"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search2"
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"

  @CU-32741
  Scenario: Verify that correct SRL is displayed after user clicks on one of the links to Search Within Results list if number of Searches Within moved links up in 'Search Results' drop down on document's Read view
    * I am logged in
    * I perform search of "tax"
    * I perform search of "count"
    * I perform search of "merger"
    * I perform search of "California"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "credit"
    * I perform search of "bank"
    * I perform search of "state"
    * I click "#4 of Documents"
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #3 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "4"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "count"
    * Text of "Search Bar > #3 of Search Pills > Text" should be "merger"
    * Text of "Search Bar > #4 of Search Pills > Text" should be "California"

  @CU-32742
  Scenario: Verify that correct SRL is displayed after user clicks on one of the links to Search Within Results list if number of Searches Within moved links up in 'Search Results' drop down on 'Search Results' page
    * I am logged in
    * I perform search of "quality"
    * I perform search of "law"
    * I perform search of "state"
    * I perform search of "merger"
    * I perform search of "public"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "control"
    * I perform search of "approval"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #5 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "5"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "quality"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "law"
    * Text of "Search Bar > #3 of Search Pills > Text" should be "state"
    * Text of "Search Bar > #4 of Search Pills > Text" should be "merger"
    * Text of "Search Bar > #5 of Search Pills > Text" should be "public"

  @CU-32747
  Scenario: Verify that Post Search Filters are not applied anymore when user navigates to previous Search Results List from 'Search Results' drop down on 'Search Results' page
    * I am logged in
    * I perform search of "insurance"
    * I click "#4 of Filter Groups > #Treatises in Filter Items"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Post Search Filters" should be visible
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should contain "Treatises"
    * I perform search of "regulation"
    * I click "#3 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #2 of Post Search Filters" should be visible
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should contain "Treatises"
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should contain "Federal"
    * I perform search of "payment"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should not contain "Federal"
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should not contain "Treatises"
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should not contain "Federal"

  @CU-32751
  Scenario: Verify that Pre Search Filters remain applied when user navigates to previous Search Results List from 'Search Results' drop down on 'Search Results' page
    * I am logged in
    * I perform search of "merger" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Jurisdiction > Federal                       |
    * "Search Bar > #1 of PreSearch Filters" should be visible
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * I perform search of "insurance"
    * I perform search of "payment"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"

  @CU-32752
  Scenario: Verify that user is able to navigate to original Search Results List by click on 'Search Results' link after navigation through results using 'Next search result' button in Read view
    * I am logged in
    * I perform search of "quality"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#2 of Documents"
    * "Toolbar > Next Results Button" should be visible
    * I click "Toolbar > Next Results Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"

  @CU-32753
  Scenario: Verify that user is able to navigate to previous Search Results List by click on 'Search Results' link after navigation through results using 'Previous search result' button in Read view
    * I am logged in
    * I perform search of "quality"
    * I perform search of "legal"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#4 of Documents"
    * "Toolbar > Previous Results Button" should be visible
    * I click "Toolbar > Previous Results Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"

  @CU-32754
  Scenario: Verify that user is able to navigate to previous Search Results List by click on 'Search Results' link after navigation through document's contents using 'Next document' button in Read view
    * I am logged in
    * I perform search of "bank"
    * I perform search of "policy"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#3 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar > Next Document Button" should be visible
    * I click "Toolbar > Next Document Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"

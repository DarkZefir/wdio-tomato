@critical_path
@mvl
Feature: Search Pills 4

  @CU-32041
  Scenario: Verify that correct placeholder text is displayed on SRL
    * I am logged in
    * I perform search of "loyalty"
    * I remember text of "Results Toolbar > Hit Count" as "result1"
    * Placeholder text for "Search Bar > Search Input" should be "Search here within the {$result1} results for "loyalty""
    * I perform search of "duty"
    * I remember text of "Results Toolbar > Hit Count" as "result2"
    * Placeholder text for "Search Bar > Search Input" should be "Search here within the {$result2} results for "duty""

  @CU-32062
  @local
  Scenario: Verify that previously selected Post search filters are applied when user performs new search from SRL
    * I am logged in
    * I perform search of "indirect damage"
    * I click "#4 of Filter Groups > #1 of Show Subtypes"
    * I click "#4 of Filter Groups > #Annotations in Filter Children Items"
    * I click "#6 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Annotations"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "indirect damage california"
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "2"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Annotations"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Text of "Results Toolbar > Current Search Query" should be "“indirect damage california”"

  @CU-32070
  @local
  Scenario: Verify that search works correctly even extra space was left after search term
    * I am logged in
    * I perform search of "deed -revocation"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "deed " in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Current Search Query" should be "“deed”"

  @CU-32071
  @local
  Scenario: Verify that search works correctly even extra space was left before search term
    * I am logged in
    * I perform search of "legal court"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type " court" in "Search Bar > #1 of Search Pills > Input"
    * I send sequence of keys "Enter" to element "Search Bar > #1 of Search Pills > Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Current Search Query" should be "“court”"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I type " room" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Current Search Query" should be "“court room”"
    * Count of "Search Bar > Search Pills" should be equal to "1"

  @CU-32073
  @local
  Scenario: Verify that user can remove search pill with term from recent searches and then perform new search
    * I am logged in
    * I click "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should be visible
    * I click "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text"
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "Alternative Clause"
    * "Results Toolbar > Current Search Query" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Alternative Clause"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Results Toolbar > Current Search Query" should contain "Alternative Clause"

  @CU-32076
  @local
  Scenario: Verify that user can select any value from recent searches while editing existing search pill
    * I am logged in
    * I perform search of "basic information"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I send sequence of keys "Control, A, Delete" to element "Search Bar > #1 of Search Pills > Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should be visible
    * I remember number of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" as "recentSearch"
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #{$recentSearch} of Suggestions > Text" as "recentSearchText"
    * I send sequence of keys "ArrowUp" to element "Search Bar > #1 of Search Pills > Input"
    * I send sequence of keys "Enter" to element "Search Bar > #1 of Search Pills > Input"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Current Search Query" should be visible
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Results Toolbar > Current Search Query" should contain "{$recentSearchText}"

  @CU-32079
  @local
  Scenario: Verify that user can select Titles suggestion while editing search pill
    * I am logged in
    * I perform search of "september 2020"
    * "#1 of Documents" should be visible
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Edit"
    * "Search Bar > #1 of Search Pills > Input" should be visible
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "sep" in "Search Bar > #1 of Search Pills > Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" should be visible
    * I wait 3 seconds
    * I remember text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" as "title"
    * I click "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * Text of "DA Title" should be "{$title}"

  @CU-32089
  @local
  Scenario Outline: Verify that search operator hyphen (-) can be applied to SWSR
    * I am logged in
    * I type "Tax" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text" should be visible
    * I remember text of "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text" as "searchText"
    * I send sequence of keys "ArrowDown" to element "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * I perform search of "<search>"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$searchText}"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "{$searchText} >> <search>"

    Examples:
      | search           |
      | anti-abuse tax   |
      | deed -revocation |


  @CU-32090
  @local
  Scenario: Search Within: Verify that user can edit first pill
    * I am logged in
    * I perform search of "Author: "Steven Mark Levy""
    * I perform search of "securities"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "regulation of securities" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "regulation of securities"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "securities"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "regulation of securities >> securities"

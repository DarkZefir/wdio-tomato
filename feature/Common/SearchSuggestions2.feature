@smoke
@vlcc @px
@search_suggestions
Feature: Search Suggestions

  @CU-32316 @CU-33079
  Scenario: Verify that Global search is present in Recent searches list on top position
    * I am logged in
    * I disable thesaurus
    * I perform search of "test search"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "test search"
    * I click "Header > Home"
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be more than "0"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "test search"


  @CU-32352 @CU-32975
  Scenario Outline: Verify UI and basic functionality of Most Relevant Cluster
    * I am logged in
    * I type "<term1>" in "Search Bar > Search Input"
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be more than "0"
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text Highlights" should contain "<term1>" ignoring case
    * I type " <term2>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions >#2 of Text Highlights" should be visible
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be more than "0"
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text" should contain "<term2>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text Highlights" should match "(<term1>|<term2>)" ignoring case

    Examples:
      | term1  | term2 |
      | active | duty  |
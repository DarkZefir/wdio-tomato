@smoke
@mvl @vlcc
@search_suggestions
Feature: Search Suggestions 1

  @CU-37339 @CU-37359
  Scenario Outline: Verify basic functionality of 'Q&A' cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster" should be visible
    * "Search Bar > Search Suggestions > QandA Cluster > Cluster Title" should be visible
    * Text of "Search Bar > Search Suggestions > QandA Cluster > Cluster Title" should be "Q&A"
    * Count of "Search Bar > Search Suggestions > QandA Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > QandA Cluster > Suggestions > Text Highlights" should contain "<term>" ignoring case

    Examples:
      | term |
      | case |

  @CU-37340 @CU-37360
  Scenario: Verify that 'Q&A' cluster appears for 3rd letter in the input
    * I am logged in
    * I type "l" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster" should not be visible
    * I type "a" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster" should not be visible
    * I type "w" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster" should be visible

  @CU-37348 @CU-37361
  Scenario Outline: Verify that user can open a document by click on an item in ‘Q&A’ cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster" should be visible
    * I remember number of "Search Bar > Search Suggestions > QandA Cluster > Suggestions" as "number"
    * I remember random integer below "{$number}" as "numberToClick"
    * I remember text of "Search Bar > Search Suggestions > QandA Cluster > #{$numberToClick} of Suggestions > Text" as "title"
    * I move mouse over "Search Bar > Search Suggestions > QandA Cluster > #{$numberToClick} of Suggestions > Text"
    * "Search Bar > Search Suggestions > QandA Cluster > #{$numberToClick} of Suggestions > Answer Popup" should be visible
    * I remember text of "Search Bar > Search Suggestions > QandA Cluster > #{$numberToClick} of Suggestions > Answer Popup" as "answerText"
    * I click "Search Bar > Search Suggestions > QandA Cluster > #{$numberToClick} of Suggestions"
    * "Document Frame > Title" should be visible
    * Text of "Document Frame > Title" should contain "{$title}" ignoring case ignoring punctuation marks
    * Text of "Document Frame > Document Content" should contain "{$answerText}" ignoring punctuation marks
    Examples:
      | term |
      | case |

  @CU-37353 @CU-37362
  Scenario Outline: Verify that all search suggestions clusters can be displayed simultaneously with maximum number of suggestions
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should be visible
    * "Search Bar > Search Suggestions > QandA Cluster" should be visible
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be equal to "<expectedNumber>"
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "<expectedNumber>"
    * Count of "Search Bar > Search Suggestions > QandA Cluster > Suggestions" should be equal to "<expectedNumber>"
    Examples:
      | term | expectedNumber |
      | tax  | 5              |
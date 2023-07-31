@smoke
@mvl @vlcc @px
@search_suggestions
@ipa
Feature: Search Suggestions

  @CU-31628 @CU-32353 @CU-32976
  Scenario: Verify UI and basic functionality of Recent Searches
    * I am logged in
    * I perform search of "term"
    * Text of "Search Bar > #1 of Search Pills" should be "term"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "tax"
    * Text of "Search Bar > #1 of Search Pills" should be "tax"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "bank"
    * Text of "Search Bar > #1 of Search Pills" should be "bank"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "system"
    * Text of "Search Bar > #1 of Search Pills" should be "system"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "news"
    * Text of "Search Bar > #1 of Search Pills" should be "news"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "train"
    * Text of "Search Bar > #1 of Search Pills" should be "train"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * "Search Bar > #1 of Search Pills" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "election"
    * Text of "Search Bar > #1 of Search Pills" should be "election"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "way"
    * Text of "Search Bar > #1 of Search Pills" should be "way"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "format"
    * Text of "Search Bar > #1 of Search Pills" should be "format"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I perform search of "support"
    * Text of "Search Bar > #1 of Search Pills" should be "support"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I wait 2 seconds
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I click "Header > Home"
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be equal to "10"
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions > Time" should be equal to "10"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #10 of Suggestions > Text" should contain "term"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #9 of Suggestions > Text" should contain "tax"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #8 of Suggestions > Text" should contain "bank"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #7 of Suggestions > Text" should contain "system"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #6 of Suggestions > Text" should contain "news"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #5 of Suggestions > Text" should contain "train"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #4 of Suggestions > Text" should contain "election"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #3 of Suggestions > Text" should contain "way"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #2 of Suggestions > Text" should contain "format"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "support"

  @CU-31666 @CU-32354 @CU-32977
  Scenario Outline: Verify that Titles Cluster appears for 3rd letter in the input
    * I am logged in
    * I type "<letter1>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "<letter2>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "<letter3>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<letter1><letter2><letter3>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should contain "<letter1><letter2><letter3>" ignoring case

    Examples:
      | letter1 | letter2 | letter3 |
      | f       | e       | d       |

  @CU-31662 @CU-32360 @CU-32980
  Scenario Outline: Verify that user can run search by clicking on suggestion from Most Relevant Cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be equal to "5"
    * I remember text of "Search Bar > Search Suggestions > Most Relevant Cluster > #3 of Suggestions > Text" as "suggestion"
    * I click "Search Bar > Search Suggestions > Most Relevant Cluster > #{$suggestion} in Suggestions > Text"
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$suggestion}"
    * "#1 of Search Result Items" should be visible
    * Count of "Search Result Items" should be equal to "25"
    * "Problem Encountered Popup" should not be visible

    Examples:
      | term     |
      | security |

  @CU-31669 @CU-32361 @CU-32982
  Scenario Outline: Verify that user can open document by clicking on suggestion from Titles Cluster
    * I am logged in
    * I type "<titlesClusterTitle>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * Text in collection of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should contain "<titlesClusterTitle>"
    * I click "Search Bar > Search Suggestions > Titles Cluster > #<titlesClusterTitle> in Suggestions > Text"
    * "Notice Popup" should not be visible
    * Text of "DA Title" should be "<readPageTitle>" ignoring case ignoring whitespaces
    * "Problem Encountered Popup" should not be visible

    Examples:
      | titlesClusterTitle            | readPageTitle                 |
      | HR Tracker                    | HR Tracker                    |
      | Labor Relations: Federal Laws | Labor Relations: Federal Laws |

  @CU-31661 @CU-32362 @CU-32983
  Scenario Outline: Verify that Most Relevant Cluster appears for 3rd letter in the input
    * I am logged in
    * I type "<letter1>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "<letter2>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "<letter3>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text" should contain "<letter1><letter2><letter3>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions > Text Highlights" should contain "<letter1><letter2><letter3>" ignoring case

    Examples:
      | letter1 | letter2 | letter3 |
      | l       | a       | b       |

  @CU-31665 @CU-32358 @CU-32979
  Scenario Outline: Verify UI and basic functionality of Titles Cluster
    * I am logged in
    * I type "<term1>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should contain "<term1>" ignoring case
    * I type " <term2>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > #2 of Text Highlights" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term2>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should match "(<term1>|<term2>)" ignoring case

    Examples:
      | term1 | term2   |
      | law   | library |
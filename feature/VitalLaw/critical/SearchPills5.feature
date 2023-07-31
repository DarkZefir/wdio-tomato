@critical_path
@mvl
Feature: Search Pills 5

  @CU-32271
  @local
  Scenario Outline: Verify that Date-Related Search Operators can be applied to SWSR
    * I am logged in
    * I perform search of "tax"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Current Search Query" should be "“<search>”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> <search>"
    Examples:
      | search                                 |
      | after 1/25/2007                        |
      | before January 25, 2008                |
      | "rule 144" from 1/25/2007 to 1/24/2008 |
      | Doctype: cases on Dec 10 2012          |

  @CU-32272
  Scenario Outline: Verify that wildcard can be applied to SWSR
    * I am logged in
    * I perform search of "tax"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> <search>"
    Examples:
      | search  |
      | bl*w    |
      | advis?r |
      | ??clude |


  @CU-32281
  Scenario: Verify that saved SWSR can be re-execute from Saved Searches (system restores the state of SWSR on the moment of saving)
    * I am logged in
    * I perform search of "agreements" with the following presearch filters:
      | SELECT FILTERS > Document Type > Treatises |
    * "#2 of Filter Groups > #1 of Filter Items" should be visible
    * I click "#2 of Filter Groups > #State in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#2 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I perform search of "rule"
    * I remember text of "Results Toolbar > Hit Count" as "count"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-32281" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * I click "Saved Searches Popup > #CU-32281 in Items > Name"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Hit Count" should be "{$count}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "agreements"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "rule"
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "2"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "State"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Count of "Search Bar > PreSearch Filters > Filter Name" should be equal to "1"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Treatises"

  @CU-32101
  Scenario: Verify that user can select any suggestion from Titles while editing second search pill
    * I am logged in
    * I perform search of "merger"
    * I perform search of "rate"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #2 of Search Pills > Edit"
    * I clear "Search Bar > #2 of Search Pills > Input"
    * I type "man" in "Search Bar > #2 of Search Pills > Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" should be visible
    * I wait until text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > #1 of Text Highlights" is "man" ignoring case
    * I remember number of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" as "count"
    * I remember text of "Search Bar > Search Suggestions > Titles Cluster > #{$count} of Suggestions > Text" as "title"
    * I click "Search Bar > Search Suggestions > Titles Cluster > #{$count} of Suggestions"
    * I wait until "Loading Indicator" is gone
    * "Document Frame" should be visible
    * Text of "DA Title" should be "{$title}"

  @CU-32266
  Scenario: Verify that new Global Search (not SWSR) is performed from Refine Search Scope
    * I am logged in
    * I perform search of "advertising cases"
    * I perform search of "Columbia"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I clear "Advanced Search Popup > Search Input"
    * I type "nexus" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Current Search Query" should be "“nexus”"

@smoke
@mvl @vlcc @px
@search_pills
Feature: Search Pills

  @CU-32035 @CU-32449 @CU-33011
  Scenario Outline: Verify that user is able to remove search pill
    * I am logged in
    * I perform search of "taxation"
    * I click "<Remove icon>"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "0"
    Examples:
      | Remove icon                              |
      | Search Bar > #1 of Search Pills > Remove |
      | Search Bar > Search Delete               |

  @CU-32039 @CU-32451 @CU-33012
  @local
  Scenario: Search pills: Verify that user is able to retype whole search term
    * I am logged in
    * I perform search of "security policy"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "healthcare" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "healthcare"
    * Text of "Results Toolbar > Current Search Query" should be "“healthcare”"

  @CU-32044 @CU-32452 @CU-33022
  @ipa
  @local
  Scenario: Verify that the result of SWSR includes both the original phrase and the SWR phrase
    * I am logged in
    * I perform search of "Alabama Department"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "Resource"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Alabama Department"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "Resource"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search2}" number should be less than "{$search1}"
    * I click "Search Bar > Search Delete"
    * I perform search of "Resource"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * I perform search of "Alabama Department"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Resource"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "Alabama Department"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * "{$search4}" number should be less than "{$search3}"
    * "{$search4}" number should be equal to "{$search2}"


  @CU-32068 @CU-32453 @CU-33026
  Scenario: Verify that user is able to edit search pill (select value from most relevant)
    * I am logged in
    * I perform search of "tax"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "sec" in "Search Bar > #1 of Search Pills > Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text" should be visible
    * I remember text of "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text" as "search"
    * I click "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions > Text"
    * "Results Toolbar > Current Search Query" should be visible
    * Text of "Results Toolbar > Current Search Query" should be "“{$search}”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "{$search}"

  @CU-32094 @CU-32454 @CU-33027
  @local
  Scenario: Verify that search works correctly when user removes middle pill
    * I am logged in
    * I perform search of "regulation news"
    * I perform search of "property"
    * I perform search of "final and proposed"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #2 of Search Pills > Remove"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "regulation news"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "final and proposed"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "regulation news >> final and proposed"


  @CU-32038 @CU-32459 @CU-33032
  Scenario Outline: Search pills: Verify that user can edit search pill (add something)
    * I am logged in
    * I perform search of "tax"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I type "<search term>" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Current Search Query" should be visible
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax<search term>"
    * Text of "Results Toolbar > Current Search Query" should be "“tax<search term>”"
    Examples:
      | search term |
      | ation       |
      | able bonds  |


  @CU-32032 @CU-32460 @CU-33033
  Scenario: Search pills: Verify UI elements on search pill
    * I am logged in
    * I perform search of "loyalty"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "loyalty"
    * "Search Bar > #1 of Search Pills > Remove" should be visible
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Edit"
    * "Search Bar > #1 of Search Pills > Update" should be visible

  @CU-32060 @CU-32461 @CU-33034
  @local
  Scenario Outline: Verify that each search query is displayed in the search pill
    * I am logged in
    * I type "<search query>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<search query>"
    * "Results Toolbar > Current Search Query" should be visible
    * Text of "Results Toolbar > Current Search Query" should be "“<search query>”"

    Examples:
      | search query               |
      | taxation                   |
      | internal revenue           |
      | Trade Regulation Reporter  |
      | Author: "Steven Mark Levy" |
      | court and appeal           |
      | "Racketeer Influenced"     |
      | afdedef                    |
      | "Rackedef                  |

  @CU-32531 @CU-32634 @CU-33044
  @ipa
  Scenario: Verify that SW Read Results is performed correctly (within the results of DA search)
    * I am logged in
    * I open "WKUS_TAL_5057" document
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "tax"
    * I perform search of "law"
    * "Search Bar" should be visible
    * Text of "Search Bar > Title" should be "{$DAtitle}"
    * Text of "Results Toolbar > Previous Search Query" should be "“tax”"
    * Text of "Results Toolbar > Current Search Query" should be "“law”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> law"

  @CU-32541 @CU-32635 @CU-33043
  @ipa
  Scenario: Verify Search within DA is performed correctly
    * I am logged in
    * I open "WKUS_TAL_15227" document
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "tax"
    * Text of "Search Bar > Title" should be "{$DAtitle}"
    * Text of "Results Toolbar > Current Search Query" should be "“tax”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax"

  @CU-32548 @CU-32638 @CU-33045
  @ipa
  Scenario: Verify user is able to open document from Search within DA results
    * I am logged in
    * I open "lfl0109013e2c8457bf53" document
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "tax"
    * I remember text of "#1 of Documents > Document Title" as "title"
    * I click "#1 of Documents"
    * "Document Frame > Title" should be visible
    * Text of "Search Bar > Title" should be "{$DAtitle}"
    * I remember text of "Document Frame > Title" as "docTitle"
    * "{$title}" text should contain "{$docTitle}" text ignoring whitespaces ignoring case

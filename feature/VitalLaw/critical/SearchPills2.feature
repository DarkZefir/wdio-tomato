@critical_path
@mvl
Feature: Search Pills 2

  @CU-32283
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
    * I type "CU-32283" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I wait 3 seconds
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * I click "Saved Searches Popup > #CU-32283 in Items > Name"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I click "Header > History Dropdown > #SAVED SEARCH: CU-32283 in Items Title"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Hit Count" should be "{$count}"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "agreements"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "rule"
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "2"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "State"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Count of "Search Bar > PreSearch Filters > Filter Name" should be equal to "1"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Treatises"

  @CU-32286
  Scenario: Verify that post-search filters can be applied to results of SWSR
    * I am logged in
    * I perform search of "tax"
    * I perform search of "Columbia"
    * I click "#1 of Filter Groups > More Less Label"
    * I click "#1 of Filter Groups > #Pension & Employee Benefits in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#2 of Filter Groups > More Less Label"
    * I click "#2 of Filter Groups > #Agency Materials in Filter Items"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "2"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Pension & Employee Benefits"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Agency Materials"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> Columbia"

  @CU-32287
  Scenario: Verify that applied filters are not reset when user goes back to the previous search using Back button
    * I am logged in
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > Treatises                    |
      | SELECT FILTERS > Document Type > Explanations and Annotations |
    * "#3 of Filter Groups > #1 of Filter Items" should be visible
    * I click "#3 of Filter Groups > #Federal in Filter Items"
    * I perform search of "reporter"
    * I wait until "Loading Indicator" is gone
    * I click browser back button
    * "Results Toolbar > Current Search Query" should be visible
    * "Search Bar > #1 of PreSearch Filters > Filter Name" should be visible
    * Text of "Results Toolbar > Current Search Query" should be "“tax”"
    * Text of "Search Bar > #1 of PostSearch Filters > Filter Name" should be "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Treatises"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * I perform search of "standard deduction"
    * "Loading Indicator" should be visible
    * "Search Bar > #1 of PreSearch Filters > Filter Name" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait until text of "Results Toolbar > Current Search Query" is "“standard deduction”"
    * Text of "Results Toolbar > Current Search Query" should be "“standard deduction”"
    * Text of "Search Bar > #1 of PostSearch Filters > Filter Name" should be "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Treatises"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"

  @CU-32289
  @local
  Scenario: Verify that applied filters are reset when user goes back to the initial search using Search link
    * I am logged in
    * I perform search of "tax rates"
    * "#1 of Filter Groups > #1 of Filter Items" should be visible
    * I click "#1 of Filter Groups > #1 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * "#4 of Filter Groups > #1 of Filter Items" should be visible
    * I click "#4 of Filter Groups > #1 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * I perform search of "commission"
    * I perform search of "industry consolidation"
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > PostSearch Filters > Filter Name" should not be visible
    * Text of "Results Toolbar > Current Search Query" should be "“tax rates”"

  @CU-32527
  @local
  Scenario Outline: Verify that applied terms are displayed on Search Information Overlay of SWSR if thesaurus is turn off
    * I am logged in
    * I disable thesaurus
    * I perform search of "<search1>"
    * I perform search of "<search2>"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should be "<search1>, <search2>"
    Examples:
      | search1            | search2 |
      | proof of agreement | auto    |
      | tax                | MCO     |

  @CU-32537
  Scenario: Verify that invalid search term remains in search field
    * I am logged in
    * I am on "All Content" PA
    * I type "law)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "law)"
    * Placeholder text for "Search Bar > Search Input" should be ""
    * "Syntax Error Text" should be visible
    * Text of "Syntax Error Text" should be "Your search query has a syntax error. Please consult the Help page on search syntax"
    * "Total Results Text" should be visible
    * Text of "Total Results Text" should be "0 results" ignoring whitespaces
    * "Query Container" should be visible
    * Text of "Query Container" should be "“law)”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup > Applied Terms" should be "None"

  @CU-32546
  Scenario Outline: Search help from Header
    * I am logged in
    * I open base url with "<url>"
    * "Search Bar > Help Icon" should be visible
    * I click "Search Bar > Help Icon"
    * I wait until "Loading Indicator" is gone
    * I wait 5 seconds
    * I switch to last tab
    * I wait until page title is "Using Search Operators and Boolean Connectors in Your Search – VitalLaw™ Help"
    * I should see "Using Search Operators and Boolean Connectors in Your Search" text on page
    * I switch to first tab
    Examples:
      | url                                                        | page    |
      | #/home/AllContent                                          | Home    |
      | run-search?filter=courts-ats-filter!ATS_STATE&query=merger | Results |
      | #/read/Tax/stb012186d9227d7f1000b3d3005056885db602         | Read    |




@critical_path
@mvl
Feature: Search Pills 1

  @CU-32547
  Scenario Outline: Search help from Advanced Search
    * I am logged in
    * I open base url with "<url>"
    * "<waitFor>" should be visible
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I remember number of browser tabs
    * I click "Advanced Search Popup > Help Icon"
    * I switch to new tab
    * I wait until page title is "Using Search Operators and Boolean Connectors in Your Search – VitalLaw™ Help"
    * I should see "Using Search Operators and Boolean Connectors in Your Search" text on page
    * I switch to first tab
    Examples:
      | url                                                        | waitFor                      |
      | #/home/AllContent                                          | Search Bar > Advanced Search |
      | run-search?filter=courts-ats-filter!ATS_STATE&query=merger | #1 of Documents              |
      | #/read/Tax/fin0109013e2c839106da                           | Document Frame > Title       |

  @CU-32550
  @local
  Scenario: Verify that invalid search within term remains in search field
    * I am logged in
    * I perform search of "tax rates"
    * I wait until "Loading Indicator" is gone
    * I type "law)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax rates"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "law)"
    * Placeholder text for "Search Bar > Search Input" should be ""
    * "Syntax Error Text" should be visible
    * Text of "Syntax Error Text" should be "Your search query has a syntax error. Please consult the Help page on search syntax"
    * "Results Toolbar > Search Results Box Second Row > Total Results Text" should be visible
    * Text of "Results Toolbar > Search Results Box Second Row > Total Results Text" should be "0 results "
    * "Results Toolbar > Search Results Box Second Row > Query Container" should be visible
    * Text of "Results Toolbar > Search Results Box Second Row > Query Container" should be "“law)”"
    * "Within Results Info Text" should be visible
    * Text of "Within Results Info Text" should be "You searched within"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup > Applied Terms" should be "None"

  @CU-32551
  Scenario: Verify that user is able to retype whole search term after invalid term search
    * I am logged in
    * I type "healthcare)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "healthcare)"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "healthcare" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "healthcare"
    * Text of "Results Toolbar > Current Search Query" should be "“healthcare”"

  @CU-32552
  @local
  Scenario: Verify that user is able to retype whole search term after invalid term search within
    * I am logged in
    * I perform search of "tax rates"
    * I type "healthcare)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax rates"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "healthcare)"
    * I click "Search Bar > #2 of Search Pills > Edit"
    * I clear "Search Bar > #2 of Search Pills > Input"
    * I type "healthcare" in "Search Bar > #2 of Search Pills > Input"
    * I click "Search Bar > #2 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #2 of Search Pills > Text" should be "healthcare"
    * Text of "Results Toolbar > Current Search Query" should be "“healthcare”"

  @CU-31552
  Scenario Outline: Syntax error notice
    * I am logged in
    * I disable thesaurus
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Problem Encountered Popup" should not be visible
    * "Syntax Error Text" should be visible
    * Text of "Syntax Error Text" should be "Your search query has a syntax error. Please consult the Help page on search syntax"
    Examples:
      | searchTerm                |
      | "(tax                     |
      | Title: world w/30 airways |
      | Author: Mark w/20 credit  |
      | Doctype: Cases w/100 law  |
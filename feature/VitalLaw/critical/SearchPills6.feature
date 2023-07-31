@critical_path
@mvl
Feature: Search Pills 6

  @CU-32269
  @local
  Scenario Outline: Verify that Double Quotes search operator can be applied to SWSR
    * I am logged in
    * I perform search of "court"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "court"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "court >> <search>"
    Examples:
      | search                                        |
      | "intervening rights"                          |
      | "Passive activity losses and credits limited" |

  @CU-32270
  @local
  Scenario Outline: Verify that Search Operators can be applied to SWSR
    * I am logged in
    * I perform search of "tax"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * Text of "Results Toolbar > Current Search Query" should be "“<search>”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> <search>"
    Examples:
      | search                      |
      | Author: "Steven Mark Levy"  |
      | Doctype: Cases              |
      | Title: (SEC v. W. J. Howey) |
      | State: California           |
      | St: Illinois                |

  @CU-32097
  @local
  Scenario: Verify that last search term is displayed in Advanced search
    * I am logged in
    * I perform search of "Title: (world W/77 Charts)"
    * I perform search of "VAT reference"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * Value in "Advanced Search Popup > Search Input" should be "VAT reference"

  @CU-32100
  @local
  Scenario: Verify that user can edit second pill which brings 0 results
    * I am logged in
    * I perform search of ""Natural Gas-Panhandle""
    * I type "tax mdjf" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Count of "Documents" should be equal to "0"
    * I click "Search Bar > #2 of Search Pills > Edit"
    * I clear "Search Bar > #2 of Search Pills > Input"
    * I type "tax law" in "Search Bar > #2 of Search Pills > Input"
    * I click "Search Bar > #2 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Previous Search Query" should be "“"Natural Gas-Panhandle"”"
    * Text of "Results Toolbar > Current Search Query" should be "“tax law”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be ""Natural Gas-Panhandle" >> tax law"

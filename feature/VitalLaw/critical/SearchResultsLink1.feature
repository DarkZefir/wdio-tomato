@critical_path
@mvl
Feature: Search Results Link 1

  @CU-32767
  Scenario: Verify that user is able to return to previous SRL by click on correspondent 'Search Results' link after search was done within a Tax Topic opened from State Tax Topics List
    * I am logged in
    * I open base url with "#/topics/browse/st/TaxStateAndLocal"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - STATE"
    * I wait until "Loading Indicator" is gone
    * I click "Tax State Topics List > #14 of Box Titles"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "property"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "factor"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * I click "#3 of Documents"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * "{$search2}" number should be equal to "{$search3}"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "factor"
    * I click "Search Bar > Search Results"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * "{$search1}" number should be equal to "{$search4}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"

  @CU-32768
  Scenario Outline: Verify that user is able to return to previous SRL by click on correspondent 'Search Results' link after search was done within a Tax Topic opened from International Tax Topics List /Quick Reference by Country List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * I click "Tax International Topics List Country > #7 of Topic Links"
    * I wait until "Loading Indicator" is gone
    * I wait 3 seconds
    * I perform search of "property"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "factor"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * I click "#3 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * "{$search2}" number should be equal to "{$search3}"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "factor"
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * "{$search1}" number should be equal to "{$search4}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"

    Examples:
      | PA                           | URL                                                       | List Title                     |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES | TAX ESSENTIALS - INTERNATIONAL |
      | KLUWER INTERNATIONAL TAX LAW | #/topics/browse/kitl/kluwertaxlaw/VN                      | QUICK REFERENCE BY COUNTRY     |

  @CU-32769
  Scenario: Verify that user is returned to previous SRL after click on correspondent 'Search Results' Link' on Tax Topic's Read view opened from SRL
    * I am logged in
    * I perform search of "property" with the following presearch filters:
      | SELECT FILTERS > Document Type > Topic Pages |
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Topic Pages"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "payment"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * I click "#3 of Documents"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * "{$search2}" number should be equal to "{$search3}"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "payment"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * "{$search1}" number should be equal to "{$search4}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "property"

  @CU-32772
  Scenario: Verify that link from 'Search Results' drop down navigates user to correct SRL after user edits one of search pills
    * I am logged in
    * I perform search of "case"
    * I perform search of "law"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "tax"
    * I perform search of "idaho"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #2 of Search Pills > Edit"
    * "Search Bar > #2 of Search Pills > Input" should be visible
    * I clear "Search Bar > #2 of Search Pills > Input"
    * I type "state" in "Search Bar > #2 of Search Pills > Input"
    * I click "Search Bar > #2 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "4"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "state"
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * Text of "Search Bar > Search Results Dropdown > #1 of Items" should be "Search results from keyword "case""
    * Text of "Search Bar > Search Results Dropdown > #2 of Items" should be "Search within results from keyword "state""
    * Text of "Search Bar > Search Results Dropdown > #3 of Items" should be "Search within results from keyword "tax""
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should not be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "case"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "state"

  @CU-32774
  Scenario: Verify that link from 'Search Results' drop down navigates user to correct SRL after user deletes one of search pills
    * I am logged in
    * I perform search of "insurance"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "base"
    * I perform search of "law"
    * I perform search of "case"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "4"
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "3"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should not be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "base"

  @CU-32844
  @local
  Scenario: Verify that 'Search Results' link is displayed for TLP doc reached by click on 'Previous search result' button in Read view of non TLP doc
    * I am logged in
    * I perform search of "irc0109013e2c83d8fbd4 or tes019439bc647c761000ad8cd8d385ad169402"
    * I click "#2 of Documents"
    * "Document Frame > Document Content" should be visible
    * I click "Toolbar > Previous Results Button"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible

  @CU-32873
  @local
  Scenario: Verify that 'Search Results' link is displayed on regular doc's Read view reached by click on 'Next search result' button in TLP doc's Read view
    * I am logged in
    * I perform search of "irc0109013e2c83d8fbd4 or tes019439bc647c761000ad8cd8d385ad169402"
    * I click "#1 of Documents"
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Toolbar > Next Results Button"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible

  @CU-32890
  @local
  Scenario Outline: Verify that 'Search Results' link is displayed on TLP doc reached by click on 'Next search result'/'Previous search result' button on other TLP doc's read view
    * I am logged in
    * I perform search of "tppc015762b9687c6b1000880b90b11c2ac4f102e or tes019439bc647c761000ad8cd8d385ad169402"
    * I click "#<Number> of Documents"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * I click "Toolbar > <Button>"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    Examples:
      | Number | Button                  |
      | 1      | Next Results Button     |
      | 2      | Previous Results Button |

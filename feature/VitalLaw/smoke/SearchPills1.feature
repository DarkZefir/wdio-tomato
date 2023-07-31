@smoke
@mvl
@search_pills
Feature: Search Pills 1

  @CU-32542
  Scenario: Search Within DA - Searching with Pre-search Filters
    * I am logged in
    * I open "feefc6827d8610008d07005056886db702" document
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > News and Blogs |
      | SELECT FILTERS > Jurisdiction > Federal         |
    * "Search Bar >#1 of PreSearch Filters " should be visible
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "News and Blogs"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text of "Search Bar > Title" should be "{$DAtitle}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Document Type: News and Blogs"
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Jurisdiction: Federal"

  @CU-32543
  @ipa
  Scenario: Search Within DA - Searching with Post-search Filters
    * I am logged in
    * I open "09013e2c82c6f65b" document
    * I wait until "Loading Indicator" is gone
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "income"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * "#1 of Filter Groups > #1 of Filter Items" should be visible
    * I click "#2 of Filter Groups > #Explanations and Annotations in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#3 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "hitCount2"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Text of "Search Bar > Title" should be "{$DAtitle}"
    * "{$hitCount2}" number should be less than "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > PostSearch Selections Group" should contain "Document Type: Explanations and Annotations"
    * Text of "Search Information Popup > PostSearch Selections Group" should contain "Jurisdiction: Federal"

  @CU-32544
  @ipa
  Scenario: Search Within DA - UI Verifications
    * I am logged in
    * I open "5092438c7bdb1000a750001e0bcd152602" document
    * I click "Contents Tab > #1 of Expanded Parent Node > Path Header > Collapse Button"
    * I remember text of "Contents Tab > Collapsed Parent Node > Header" as "parentNodes1"
    * I remember text of "DA Title" as "DAtitle"
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * Text of "Advanced Search Popup > Search Title" should contain "{$DAtitle}" ignoring case ignoring whitespaces
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Apply Thesaurus" should be selected
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > Title"
    * I click "Advanced Search Popup > #SELECT CONTENT in Presearch Filters > Title"
    * Count of "Advanced Search Popup > #1 of Presearch Filters > Presearch Filter Titles" should be more than "0"
    * Count of "Advanced Search Popup > #2 of Presearch Filters > Presearch Filter Titles" should be more than "0"
    * I remember text of "Advanced Search Popup > #2 of Presearch Filters > Presearch Filter Titles" as "selectContent"
    * "$selectContent" collection should be equal to "$parentNodes1" collection ignoring case
    * "Advanced Search Popup > X Close Button" should be enabled
    * "Advanced Search Popup > Cancel Button" should be enabled
    * "Advanced Search Popup > Clear All" should not be enabled
    * "Advanced Search Popup > Search Button" should not be enabled
    * I click "Advanced Search Popup > Cancel Button"
    * "Advanced Search Popup" should not be visible

  @CU-32545
  Scenario: Search Within DA - Searching with Pre- and Post-search Filters
    * I am logged in
    * I open "09013e2c82c6f65b" document
    * I remember text of "DA Title" as "DAtitle"
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
    * I click "#3 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Search Bar > Title" as "searchTitle"
    * "{$DAtitle}" text should contain "{$searchTitle}" text
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Text of "Results Toolbar > Current Search Query" should be "“tax”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > PreSearch Selections Group" should contain "Document Type: Explanations and Annotations"
    * Text of "Search Information Popup > PostSearch Selections Group" should contain "Jurisdiction: Federal"

  @CU-32549
  @ipa
  Scenario: Search Within DA - Filters UI verification
    * I am logged in
    * I open "09013e2c87b6597e" document
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > Title"
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > #Document Type in Presearch Filter Titles"
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > #Document Type in Filter Items > #Treatises in Filter Item Level0 Unchecked Labels"
    * I click "Advanced Search Popup > #SELECT CONTENT in Presearch Filters > Title"
    * I click "Advanced Search Popup > #SELECT CONTENT in Presearch Filters > #About the Authors in Presearch Filter Titles"
    * I click "Advanced Search Popup > #SELECT CONTENT in Presearch Filters > #Table of Contents in Presearch Filter Titles"
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "3"
    * Text of "Advanced Search Popup > Selected Filters Box" should contain "Treatises"
    * Text of "Advanced Search Popup > Selected Filters Box" should contain "About the Authors"
    * Text of "Advanced Search Popup > Selected Filters Box" should contain "Table of Contents"
    * I click "Advanced Search Popup > #SELECT CONTENT in Presearch Filters > #About the Authors in Presearch Filter Titles"
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "2"
    * Text of "Advanced Search Popup > Selected Filters Box" should contain "Treatises"
    * Text of "Advanced Search Popup > Selected Filters Box" should contain "Table of Contents"
    * I click "Advanced Search Popup > Clear All"
    * "Advanced Search Popup > Selected Filters Box" should not be visible

  @CU-32099
  @ipa
  Scenario: Verify that user can retype search query after he gets 0 results
    * I am logged in
    * I open base url with "#/home/Antitrust"
    * "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links" should be visible
    * I type "efawf" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "No Results Text" should be visible
    * "No Results Text" should be visible
    * Text of "No Results Text" should be "There are no results for your query."
    * I click "Search Bar > #1 of Search Pills > Edit"
    * I clear "Search Bar > #1 of Search Pills > Input"
    * I type "RICO not Puerto" in "Search Bar > #1 of Search Pills > Input"
    * I send sequence of keys "Enter" to element "Search Bar > #1 of Search Pills > Input"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Current Search Query" should be visible
    * Text of "Results Toolbar > Current Search Query" should be "“RICO not Puerto”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "RICO not Puerto"

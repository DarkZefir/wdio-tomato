@critical_path
@mvl
Feature: Saved Searches

  @CU-29702
  Scenario: Verify that user can delete Saved Search from 'Save This Search' overlay
    * I am logged in
    * I perform search of "tax"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29702" in "Save This Search Popup > Input"
    * I remember text of "Save This Search Popup > Input" as "Searchtitle"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * I wait until "Loading Indicator" is gone
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * I click "Saved Searches Popup > #1 of Items > Checkbox"
    * I click "Saved Searches Popup > Delete"
    * I click "Confirmation Popup > Confirm Button"
    * "Saved Searches Popup > #1 of Items" should not be visible
    * Text of "Saved Searches Popup" should contain "You currently have no saved searches."

  @CU-29703
  Scenario: Verify that user can save search
    * I am logged in
    * I perform search of "tax"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29703" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * Count of "Saved Searches Popup > Items" should be equal to "1"
    * Text of "Saved Searches Popup > #1 of Items" should contain "CU-29703" ignoring whitespaces

  @CU-29695
  Scenario: Verify saving search performed with pre-search and post-search filters
    * I am logged in
    * I perform search of "merger" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Jurisdiction > Federal                       |
    * I click "#1 of Filter Groups > More Less Label"
    * I click "#1 of Filter Groups > #Tax - International in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29695" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I remember text of "Results Toolbar > Hit Count" as "resultsCount"
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * I click "Saved Searches Popup > #CU-29695 in Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Results Toolbar > Hit Count" should be "{$resultsCount}"
    * Text of "Results Toolbar > Saved Search Name" should be "CU-29695"
    * "Results Toolbar > Save Search Button" should not be enabled
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should contain "Tax - International"

  @CU-29726
  Scenario: Verify user is able to open Saved Search info overlay for a saved search from SRL
    * I am logged in
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Jurisdiction > Federal                       |
    * I click "#1 of Filter Groups > More Less Label"
    * I click "#1 of Filter Groups > #Antitrust & Competition in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29726" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * "Search Information Popup > Saved Search Name" should be visible
    * Text of "Search Information Popup > Saved Search Name" should be "CU-29726"
    * Text of "Search Information Popup > Search Queries" should be "tax"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup > Applied Terms" should contain "tax"
    * Text of "Search Information Popup > Practice Area" should contain "All Content"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Filtered By"
    * Text of "Search Information Popup" should contain "Document Type: Explanations and Annotations"
    * Text of "Search Information Popup" should contain "Jurisdiction: Federal"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "Post-Search Selections"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "Practice Areas: Antitrust & Competition"
    * Text of "Search Information Popup > Title" should be "SAVED SEARCH INFORMATION"
    * "Search Information Popup > X Close Button" should be visible
    * "Search Information Popup > X Close Button" should be enabled
    * "Search Information Popup > Close Button" should be visible
    * "Search Information Popup > Close Button" should be enabled
    * "Search Information Popup > Edit Button" should be visible
    * "Search Information Popup > Edit Button" should be enabled
    * I click "Search Information Popup > Close Button"
    * "Search Information Popup" should not be visible

  @CU-29741
  Scenario: Verify the user is able to remove pre- and post-search filters on rerunning a saved search
    * I am logged in
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Jurisdiction > Federal                       |
    * I click "#1 of Filter Groups > More Less Label"
    * I click "#1 of Filter Groups > #Antitrust & Competition in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29741" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * I click "Saved Searches Popup > #1 of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > #1 of PreSearch Filters > Clear Filter"
    * I click "Search Bar > #1 of PostSearch Filters > Clear Filter"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount2"
    * "{$hitCount2}" number should be more than "{$hitCount1}"
    * Text of "Results Toolbar" should contain "tax"
    * "Results Toolbar > Save Search Button" should be visible
    * "Results Toolbar > Save Search Button" should be enabled


  @CU-36322
  Scenario: Verify that post-search filter with sevral PAs apply after Saved Search rerun
    * I am logged in
    * I perform search of "law"
    * "#1 of Filter Groups" should be visible
    * I click "#1 of Filter Groups > More Less Label"
    * I remember number of "#1 of Filter Groups > Filter Items" as "paFilter"
    * I remember random integer below "{$paFilter}" and above "2" as "firstPA"
    * I click "#1 of Filter Groups > #{$firstPA} of Filter Items Checkboxes"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I click "#1 of Filter Groups > #{$subtract($firstPA, 1)} of Filter Items Checkboxes"
    * I remember text of "#1 of Filter Groups > #1 of Selected Items Label" as "pa1"
    * I remember text of "#1 of Filter Groups > #2 of Selected Items Label" as "pa2"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-36322" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * I click "Saved Searches Popup > #1 of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * I remember text of "Search Bar > #1 of PostSearch Filters" as "f1"
    * I remember text of "Search Bar > #2 of PostSearch Filters" as "f2"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount2"
    * "{$hitCount2}" number should be equal to "{$hitCount1}"
    * "{$f1}" text should contain "{$pa1}" text
    * "{$f2}" text should contain "{$pa2}" text
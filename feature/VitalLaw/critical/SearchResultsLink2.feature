@critical_path
@mvl
Feature: Search Results Link 2

  @CU-32755
  Scenario: Verify that when user is able to navigate to original Search Results List by click on 'Search Results' link after navigation through document's contents using 'Previous document' button in Read view
    * I am logged in
    * I perform search of "bank"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#2 of Documents"
    * "Toolbar > Previous Document Button" should be visible
    * I click "Toolbar > Previous Document Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"

  @CU-32760
  Scenario: Verify that user is returned to correct Search Results List by click on 'Search Results' link from doc's Read view after performing a Search within a document opened form dashboard
    * I am logged in
    * I open "irc0109013e2c83d8fbe0" document
    * I wait until "Loading Indicator" is gone
    * I perform search of "quality"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "quality"

  @CU-32761
  Scenario: Verify that user is returned to correct Search Results List after click on 'Search Results' link in doc's Read view opened after performing a Search within a doc opened from SRL
    * I am logged in
    * I perform search of "legal"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I clear "Search Bar > Search Input"
    * I perform search of "practice"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "practice"

  @CU-32762
  Scenario: Verify that user is returned to previous SRL by click on a link to Search within results in 'Seacrh Results' drop down after performance of Search within SRL gained while search within a document from dashboard
    * I am logged in
    * I open "irc0109013e2c83d8fbe0" document
    * I wait until "Loading Indicator" is gone
    * I perform search of "quality"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I clear "Search Bar > Search Input"
    * I perform search of "guarantee"
    * "Results Toolbar > Hit Count" should be visible
    * I clear "Search Bar > Search Input"
    * I perform search of "case"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "guarantee"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "case"

  @CU-32763
  Scenario: Verify that user is returned to previous SRL by click on a link to Search within results in 'Search Results' drop down after performance of Search within SRL gained while search within a document from SRL
    * I am logged in
    * I perform search of "legal"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I clear "Search Bar > Search Input"
    * I type "practice" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I clear "Search Bar > Search Input"
    * I perform search of "state"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#3 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "practice"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "state"

  @CU-32764
  Scenario Outline: Verify that user is able to navigate to correct SRL by click on 'Search Results' on TLP doc opened from SRL after performning a Search within Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * I perform search of "<Search Term>"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#3 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "$search1"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Search Term>"

    Examples:
      | PA                           | URL                                                       | List Title                     | Search Term |
      | TAX - FEDERAL                | #/topics/browse/fed/TaxFederal                            | TAX ESSENTIALS - FEDERAL       | method      |
      | TAX - STATE & LOCAL          | #/topics/browse/st/TaxStateAndLocal                       | TAX ESSENTIALS - STATE         | factor      |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES | TAX ESSENTIALS - INTERNATIONAL | base        |
      | KLUWER INTERNATIONAL TAX LAW | #/topics/browse/kitl/kluwertaxlaw/VN                      | QUICK REFERENCE BY COUNTRY     | capital     |
      | BANKRUPTCY                   | #/topics/browse/bke/Bankruptcy                            | BANKRUPTCY ESSENTIALS          | bank        |

  @CU-32765
  Scenario: Verify that user is able to return to previous SRL by click on correspondent 'Seacrh Results' link after search was done within a Tax Topic opened from Federal Tax Topics List
    * I am logged in
    * I open base url with "#/topics/browse/fed/TaxFederal"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"
    * "Tax Federal Topics List" should be visible
    * I click "Tax Federal Topics List > #3 of Top Level Node"
    * I perform search of "merger"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I perform search of "law"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * I click "#3 of Documents"
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results Dropdown" should be visible
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    * I click "Search Bar > Search Results Dropdown > #2 of Items"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search3"
    * "{$search2}" number should be equal to "{$search3}"
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "merger"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "law"
    * I click "Search Bar > Search Results"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search4"
    * "{$search1}" number should be equal to "{$search4}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "merger"

  @CU-37272
  Scenario: Verify that 'Search Results' link is not displayed in TLP document's Read view opened in New tab from Search Results List
    * I am logged in
    * I perform search of "*"
    * I wait until "Loading Indicator" is gone
    * I remember index of "Filter Groups > Label" exactly matching "TAX ESSENTIALS" as "topics"
    * I remember number of "#{$topics} of Filter Groups > Filter Items" as "topicsNum"
    * I remember random integer below "{$topicsNum}" as "topicToClick"
    * I click "#{$topics} of Filter Groups > #{$topicToClick} of Filter Items"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * "Results Toolbar > Open In New Tab Checkbox" should be selected
    * I click "#1 of Documents"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * "Search Bar > Search Results" should not be visible


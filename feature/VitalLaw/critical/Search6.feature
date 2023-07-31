@critical_path
@mvl
Feature: Search 6

  @CU-29719
  @local
  Scenario: Verify UI of Search results header
    * I am logged in
    * I perform search of "audit partnership"
    * "Results Toolbar > Hit Count" should be visible
    * "Results Toolbar > Save Search Button" should be visible
    * "Results Toolbar > Current Search Query" should be visible
    * "Results Toolbar > Search Information Icon" should be visible
    * "Results Toolbar > Select All Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Toolbar Buttons" should be visible
    * "Sorting Menu" should be visible
    * Text of "Sorting Menu Button" should be "RELEVANCE"

  @CU-32744
  @local
  Scenario Outline: Verify that search terms is highlighted correctly when search with proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * "Search Bar > Search Input" should be visible
    * I perform search of "<term1> <operator> <term2>"
    * I wait until "Loading Indicator" is gone
    * Count of "Documents" should be more than "0"
    * Each element of "Highlighted Phrases" should match "<term1>" ignoring case

    Examples:
      | term1 | operator | term2  |
      | rico  | not      | puerto |


  @CU-33814
  Scenario Outline: Verify that user is able to apply 'Treatise Title' filter
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * "#1 of Filter Groups" should be visible
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * I click "#{$treatiseTitle} of Filter Groups > #1 of Filter Items"
    * I click "#{$treatiseTitle} of Filter Groups > #2 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Post Search Filters > Filter Name" should be equal to "2"
    * I remember text of "Search Bar > #1 of Post Search Filters > Filter Name" as "pill1"
    * I remember text of "Search Bar > #2 of Post Search Filters > Filter Name" as "pill2"
    * Text of "#{$treatiseTitle} of Filter Groups > #1 of Filter Items" should contain "{$pill1}" ignoring case ignoring whitespaces ignoring punctuation marks
    * Text of "#{$treatiseTitle} of Filter Groups > #2 of Filter Items" should contain "{$pill2}" ignoring case ignoring whitespaces ignoring punctuation marks
    Examples:
      | PA                |
      | #/home/Antitrust  |
      | #/home/Securities |

  @CU-33863
  Scenario Outline: Verify that user is able to cancel applying 'Treatise Title' filter
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * "#1 of Filter Groups" should be visible
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * I click "#{$treatiseTitle} of Filter Groups > #1 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Post Search Filters" should be visible
    * I click "#{$treatiseTitle} of Filter Groups > #2 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Post Search Filters" should be equal to "2"
    * I click "Search Bar > #1 of Post Search Filters > Clear Filter"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Post Search Filters" should be equal to "1"
    * I click "#{$treatiseTitle} of Filter Groups > #1 of Filter Items"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Post Search Filters" should not be visible
    Examples:
      | PA                 |
      | #/home/IP          |
      | #/home/PracticeLaw |

  @CU-33865
  Scenario Outline: Verify that applying of 'Treatise Title' filter is reflected in 'Search information' overlay
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * "#1 of Filter Groups" should be visible
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * I click "#{$treatiseTitle} of Filter Groups > #1 of Filter Items"
    * "#1 of Filter Groups" should be visible
    * I click "#{$treatiseTitle} of Filter Groups > #2 of Filter Items"
    * I remember text of "#{$treatiseTitle} of Filter Groups > #1 of Filter Items" as "title1"
    * I remember text of "#{$treatiseTitle} of Filter Groups > #2 of Filter Items" as "title2"
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Post Search Selections Group" should contain "Post-Search Selections"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "Treatise Title:"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "{$title1}"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "{$title2}"
    Examples:
      | PA                |
      | #/home/Bankruptcy |

@smoke
@mvl @vlcc @px
@search
Feature: Search

  @CU-29693 @CU-32430 @CU-32999
  Scenario: Verify that pre-search filter reduces amount of results
    * I am logged in
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I type "report" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > #1 of Presearch Filters > Title"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Presearch Filter Titles"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Filter Items > #1 of Filter Item Level0 > Input"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsWithFilter"
    * I click "Search Bar > #1 of PreSearch Filters > Clear Filter"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsNoFilter"
    * "{$hitsWithFilter}" number should be less than "{$hitsNoFilter}"

  @CU-29694 @CU-32434 @CU-33008
  @aura-health
  @local
  Scenario: Verify that post-search filter reduces amount of results
    * I am logged in
    * I perform search of "Analysis"

    * I remember text of "Results Toolbar > Hit Count" as "hitsNoFilter"
    * I click "#DOCUMENT TYPE in Filter Groups > #News and Blogs in Filter Items"

    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsWithFilter"
    * "{$hitsWithFilter}" number should be less than "{$hitsNoFilter}"

  @CU-29706 @CU-32444 @CU-33005
  Scenario: Verify that search with thesaurus on has more than 1 term
    * I am logged in
    * I enable thesaurus
    * I perform search of "wage"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should not be "wage"
    * Text of "Search Information Popup > Applied Terms" should contain "wage"

  @CU-29704 @CU-32445 @CU-33006
  Scenario: Verify that only 1 term applied * Thesaurus turned off
    * I am logged in
    * "Search Bar > Search Input" should be visible
    * I disable thesaurus
    * I perform search of "act"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should be "act"

  @CU-29086 @CU-32427 @CU-32989
  Scenario: Verify that Search works correctly from Home Page
    * I am logged in
    * I perform search of "procedures"
    * Count of "Search Result Items" should be equal to "25"
    * Count of "Search Result Items > Link" should be equal to "25"

  @CU-29112 @CU-32435 @CU-33000
  Scenario: Verify that more results are loaded after scrolling search results
    * I am logged in
    * I perform search of "evidence of habit"
    * Count of "Search Result Items" should be equal to "25"
    * I scroll to the bottom
    * Count of "Search Result Items" should be equal to "50"
    * I scroll to the bottom
    * I wait until "Loading Indicator" is gone

  @CU-31476 @CU-32350 @CU-33063
  @local
  Scenario: Verify options in Sorting Menu on results page
    * I am logged in
    * I perform search of "audit partnership"
    * "Sorting Menu" should be visible
    * Text of "Sorting Menu Button" should be "RELEVANCE"
    * I click "Sorting Menu Button"
    * "#1 of Sorting Menu Items" should be visible
    * I should see the following lines in "Sorting Menu Items":
      | Relevance          |
      | Most Recent on Top |
      | Oldest on Top      |
      | Document Type      |

  @CU-36315 @CU-37659
  Scenario: Verify that user can select two PAs from post-search filters
    * I am logged in
    * I perform search of "law"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups" should be visible
    * I click "#1 of Filter Groups > More Less Label"
    * I remember number of "#1 of Filter Groups > Filter Items" as "paFilter"
    * I remember random integer below "{$paFilter}" and above "1" as "firstPA"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "#1 of Filter Groups > #{$firstPA} of Filter Items Checkboxes"
    * I remember text of "#1 of Filter Groups > #1 of Selected Items Label" as "pa1"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount2"
    * "{$hitCount2}" number should be less than "{$hitCount1}"
    # Subtract "1" from "{$firstPA}" and click on this number of Filter Items Checkboxes
    * I remember text of "#1 of Filter Groups > #{$subtract($firstPA, 1)} of Filter Items Checkboxes" as "pa2"
    * I click "#1 of Filter Groups > #{$subtract($firstPA, 1)} of Filter Items Checkboxes"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount3"
    * "{$hitCount2}" number should be less than "{$hitCount3}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "{$pa1}"
    * Text of "Search Information Popup" should contain "{$pa2}"

  @CU-37652 @CU-37660 @CU-37663
  Scenario Outline: Verify that selected post-search filter names are displayed in Search Bar
    * I am logged in
    * I perform search of "<term>"
    * "#1 of Filter Groups" should be visible
    * I click "#<Filter Group1> in Filter Groups > #<Filter1> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Post Search Filters > Filter Name" should be "<Filter1>"
    * Count of "Search Bar > Post Search Filters" should be equal to "1"
    * I click "#<Filter Group2> in Filter Groups > #<Filter2> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Post Search Filters > Filter Name" should be "<Filter2>"
    * Text of "Search Bar > #2 of Post Search Filters > Filter Name" should be "<Filter1>"
    * Count of "Search Bar > Post Search Filters" should be equal to "2"
    * I click "#<Filter Group3> in Filter Groups > #<Filter3> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Post Search Filters" should be equal to "3"
    * Text of "Search Bar > #1 of Post Search Filters > Filter Name" should be "<Filter3>"
    * Text of "Search Bar > #2 of Post Search Filters > Filter Name" should be "<Filter2>"
    * Text of "Search Bar > #3 of Post Search Filters > Filter Name" should be "<Filter1>"
    * "Search Bar > #1 of Post Search Filters > Clear Filter" should be visible
    * "Search Bar > #2 of Post Search Filters > Clear Filter" should be visible
    * "Search Bar > #3 of Post Search Filters > Clear Filter" should be visible
    Examples:
      | term            | Filter Group1 | Filter1        | Filter Group2 | Filter2 | Filter Group3 | Filter3 |
      | monetary relief | DOCUMENT TYPE | News and Blogs | JURISDICTION  | State   | JURISDICTION  | Federal |

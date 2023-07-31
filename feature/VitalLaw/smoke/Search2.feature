@smoke
@mvl
@ipa
@search
Feature: Search 2

  @CU-29673
  Scenario Outline: Pre-search filters popup UI verification from Content Box Link
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links" should be visible
    * I remember text of "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links" as "linkTitle"
    * I move mouse over "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links"
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Quick Select Icon" should be clickable
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > Quick Select Icon"

    * Text of "Advanced Search Popup > Search Title" should be "<Practice Area>"
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * "Advanced Search Popup > Selected Filters Box > #1 of Items" should be visible
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "1"
    # And Text of "Advanced Search Popup > Selected Filters Box > #1 of Items > Title" should be "{$linkTitle}" ignoring case //TODO
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible
    * Text of "Advanced Search Popup > #2 of Presearch Filters > #1 of Selected Filter Elements" should be "{$linkTitle}" ignoring case

    * I click "Advanced Search Popup > Cancel Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Practice Area           |
      | ANTITRUST & COMPETITION |
      | TAX - ALL               |

  @CU-29675
  Scenario Outline: Pre-search filters popup UI verification from Content Box See All
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > See All" should be visible
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > See All"

    * "See All Popup" should be visible
    * I remember text of "See All Popup > #1 of Links" as "linkTitle"
    * I move mouse over "See All Popup > #1 of Links"
    * I click "See All Popup > #1 of Search Icons"

    * "Advanced Search Popup" should be visible
    * Text of "Advanced Search Popup > Search Title" should be "<Practice Area>"
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "1"
    # And Text of "Advanced Search Popup > Selected Filters Box > #1 of Items > Title" should be "{$linkTitle}" ignoring case
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible
    * Text of "Advanced Search Popup > #2 of Presearch Filters > #1 of Selected Filter Elements" should be "{$linkTitle}" ignoring case

    * I click "Advanced Search Popup > Cancel Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Practice Area           |
      | ANTITRUST & COMPETITION |
      | TAX - ALL               |

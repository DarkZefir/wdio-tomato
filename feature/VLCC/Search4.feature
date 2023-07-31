@smoke
@vlcc
@search
Feature: Search 4

  @CU-32442
  Scenario Outline: [VLCC] Pre-search filters popup UI verification from Content Box Title
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I remember text of "Content Box > #1 of Main Content Types > #1 of Content Types > Title" as "title"
    * I move mouse over "Content Box > #1 of Main Content Types > #1 of Content Types > Title"
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > Quick Select Header Icon"
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
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Title" should be visible
    * Text of "Advanced Search Popup > Selected Filters Box > #1 of Items Title" should be "{$title}" ignoring case
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible
    * Text of "Advanced Search Popup > #2 of Presearch Filters > #1 of Selected Filter Items Titles" should be "{$title}" ignoring case
    * I click "Advanced Search Popup > Cancel Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Practice Area         |
      | BANKING               |
      | CORPORATE LAW         |
      | INTELLECTUAL PROPERTY |

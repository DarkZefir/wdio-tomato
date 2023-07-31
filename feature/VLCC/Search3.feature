@smoke
@vlcc
@search
Feature: Search 3

  @CU-32446
  Scenario Outline: [VLCC] Pre-search filters popup UI verification All Content and PAs
    * I am logged in
    * I am on "<Practice Area>" PA
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I remember text of "Advanced Search Popup > Search Title" as "searchTitle"
    * "<Practice Area>" text should contain "{$searchTitle}" text ignoring case
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * I click "Advanced Search Popup > X Close Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Practice Area            |
      | All Content              |
      | Banking                  |
      | Distribution & Franchise |
      | Life Sciences            |
      | Litigation               |

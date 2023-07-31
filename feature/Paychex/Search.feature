@px
@search
Feature: Search

  @CU-32991
  @local
  Scenario: [PX] Verify that Post Search filters have 3 items for each facet
    * I am logged in
    * I perform search of "benefits"
    * I remember index of "Filter Groups > Label" exactly matching "DOCUMENT TYPE" as "doctype"
    * I remember index of "Filter Groups > Label" exactly matching "COURT" as "court"
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"
    * I remember index of "Filter Groups > Label" exactly matching "STATE TAX TYPE" as "taxtype"

    * Count of "#{$taxtype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$taxtype} of Filter Groups > More Label" should be visible

    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

    * Count of "#{$court} of Filter Groups > Filter Items" should be less than "3"
    * "#{$court} of Filter Groups > More Label" should not be visible

    * Count of "#{$jurisdiction} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$jurisdiction} of Filter Groups > More Label" should not be visible

    * I click "#{$taxtype} of Filter Groups > More Label"
    * Count of "#{$taxtype} of Filter Groups > Filter Items" should be more than "3"
    * "#{$taxtype} of Filter Groups > Less Label" should be visible
    * I click "#{$doctype} of Filter Groups > More Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be more than "3"
    * "#{$doctype} of Filter Groups > Less Label" should be visible

    * I click "#{$taxtype} of Filter Groups > Less Label"
    * Count of "#{$taxtype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$taxtype} of Filter Groups > More Label" should be visible
    * I click "#{$doctype} of Filter Groups > Less Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

  @CU-33003
  Scenario: [PX] Search panel UI verification - field, button, advanced search link, help icon
    * I am logged in
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within Resources"
    * "Search Bar > Help Icon" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Advanced Search" should be visible

  @CU-33009
  Scenario: [PX] Pre-search filters popup UI verification from Home Page
    * I am logged in
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
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

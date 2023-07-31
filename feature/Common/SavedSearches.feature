@smoke
@mvl @vlcc @px
@saved_searches
Feature: Saved Searches

  @CU-29684 @CU-32348 @CU-33105
  Scenario: Verify that "Save this search" button is displayed on SRL
    * I am logged in
    * I perform search of "merger"
    * "Results Toolbar > Save Search Button" should be visible
    * "Results Toolbar > Save Search Button" should be enabled

  @CU-29688 @CU-32349 @CU-33106
  Scenario: Verify UI elements on "Save This Search" Overlay (User doesn't have any Saved Searches)
    * I am logged in
    * I perform search of "merger"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * Text of "Save This Search Popup > Title" should be "SAVE THIS SEARCH"
    * "Save This Search Popup > Input" should be visible
    * Text of "Save This Search Popup" should contain "Name"
    * "Save This Search Popup > Save And Close" should not be enabled
    * Text of "Save This Search Popup" should contain "SAVE THIS SEARCH"
    * "Save This Search Popup > X Close Button" should be visible
    * "Save This Search Popup > Cancel" should be visible
    * "Save This Search Popup > Save And Close" should be visible
    * I click "Save This Search Popup > Cancel"
    * "Save This Search Popup" should not be visible
@smoke
@px
@saved_searches
Feature: Saved Searches

  @CU-33239
  Scenario: [PX] Verify that user is able to save search
    * I am logged in
    * I perform search of "payroll"
    * "Results Toolbar > Save Search Button" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I click "Save This Search Popup > Title"
    * I type "CU-33239" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * "Search Information Popup > Saved Search Name" should be visible
    * Text of "Search Information Popup > Saved Search Name" should be "CU-33239"

  @CU-33254
  Scenario: [PX] Verify user is able to run search from Saved Searches overlay
    * I am logged in
    * I perform search of "payroll"
    * "Results Toolbar > Save Search Button" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I click "Save This Search Popup > Title"
    * I type "CU-33254" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * Text of "Saved Searches Popup > Title" should be "SAVED SEARCHES"
    * "Saved Searches Popup > #1 of Items" should be visible
    * Text of "Saved Searches Popup > #1 of Items" should contain "CU-33254"
    * I click "Saved Searches Popup > #1 of Items"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "payroll"
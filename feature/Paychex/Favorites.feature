@px
@favorites
@smoke
Feature: Favorites

  @CU-33245
  Scenario: [PX] Verify UI elements on "Favorites' overlay (user has no favorites)
    * I am logged in
    * I click "Header > Saved Items Dropdown"
    * I wait until "Header > Saved Items Dropdown > #3 of Items" is visible
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * Text of "Favorites Popup > Title" should be "FAVORITES"
    * "Favorites Popup > No Results Message" should be visible
    * "Favorites Popup > Toolbar Buttons" should not be visible
    * "Favorites Popup > Close Button" should be visible
    * "Favorites Popup > Close Button" should be enabled
    * "Favorites Popup > X Close Button" should be visible
    * "Favorites Popup > X Close Button" should be enabled
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible

  @CU-33246
  Scenario Outline: [PX] Verify user is able to add doc to Favorites
    * I am logged in
    * I add "<docId>" document to favorites
    * "Header > Saved Items Dropdown" should be visible
    * I click "Header > Saved Items Dropdown"
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should contain "<title>"

    Examples:
      | docId            | title                                                        |
      | 09013e2c875842a0 | HR Compliance Library, ¶10,100, Types of adoption assistance |

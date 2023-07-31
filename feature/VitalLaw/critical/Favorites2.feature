@critical_path
@mvl
Feature: Favorites

  @CU-29099
  Scenario Outline: Verify that user can add Documents to 'Favorite' with 'ADD to' overlay accessed from All content SRL (both AI & PCING)
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "#1 of Documents > Checkbox"
    * I remember text of "#1 of Documents > Document Title" as "docTitle"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text in collection of "Favorites Popup > Item Names" should contain "{$docTitle}"

    Examples:
      | type    | searchTerm                                  |
      | regular | db4b88287e09100088f0000d3a8abb4e01          |
      | L&R USC | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | L&R CFR | us-regs-774e37c52c8c85c4349107644151c55a-v1 |
      | L&R SS  | fl-law-5432f650ebc558bacd0f717ee77bcfed-v1  |
      | L&R SR  | or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 |

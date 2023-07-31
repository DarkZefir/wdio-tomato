@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegsFavorites1

  @CU-42189
  Scenario Outline: Verify that user can add Laws&Regs documents to 'Favorites' using Add to button from SRL
    * I am logged in
    * I perform search of "<doc>" on Laws & Regulations
    * I click "#1 of Documents > Checkbox"
    * I remember text of "#1 of Documents > Document Title" as "title pattern"
    * I click "Toolbar Buttons > Add To Button"
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns >#Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text of "Favorites Popup >#1 of Item Names" should contain "{$title pattern}"

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 |

  @CU-42190
  Scenario Outline: Verify that user can open Laws&Regs document from Favorites overlay
    * I am logged in
    * I add "<doc>" document to favorites
    * I click "Header > Saved Items Dropdown"
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * "Favorites Popup" should be visible
    * I click "Favorites Popup > #1 of Item Names"
    * "Favorites Popup" should not be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * "#1 of Metadata Pairs" should be visible
    * Value of "dcterms:identifier" metadata parameter should be equal to "<doc>" value

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 |

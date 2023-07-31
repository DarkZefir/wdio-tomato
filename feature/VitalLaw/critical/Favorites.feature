@critical_path
@mvl
Feature: Favorites

  @CU-29068
  Scenario: Verify that user can add document to Favorites from Read view (star icon)
    * I am logged in
    * I open "09013e2c824fb72a" document
    * "Document Frame > Document Content" should be visible
    * I remember "title" attribute of "Favorite Button" as "tooltip1"
    * I remember text of "Document Frame > Title" as "docTitle1"
    * "{$tooltip1}" text should contain "Mark as Favorite" text
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I click "Header >Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should contain "{$docTitle1}"
    * I click "Favorites Popup > X Close Button"
    * "Favorites Popup" should not be visible

  @CU-29071
  Scenario: Verify that user can add document to Favorites from Read view (Add to icon)
    * I am logged in
    * I open "law0202f5fc247ce71000a2c590b11c18c90202" document
    * "Document Frame > Document Content" should be visible
    * I remember text of "Document Frame > Title" as "docTitle"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should be visible
    * "Add To Popup > Save And Close" should not be enabled
    * Text of "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should contain "{$docTitle}"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * "Add To Popup > Save And Close" should be clickable
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * "Favorite Button Checked" should be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * I remember text of "Favorites Popup > #1 of Item Names" as "popUpTitle1"
    * "{$popUpTitle1}" text should contain "{$docTitle}" text

  @CU-29077
  Scenario: Verify that user can remove document from Favorites using Favorites icon ( Star icon)
    * I am logged in
    * I add "09013e2c824fb72a" document to favorites
    * I click browser refresh button
    * "Search Bar > Search Input" should be visible
    * I open "09013e2c824fb72a" document
    * I click "Favorite Button Checked"
    * "Favorite Button Checked" should not be visible
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * "Favorites Box" should be visible
    * "Favorites Box > No Results" should be visible

  @CU-29090
  Scenario: Verify UI elements on "Add to" overlay on Read view
    * I am logged in
    * I open "law0202f5fc247ce71000a2c590b11c18c90202" document
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * Text in collection of "Add To Popup > #1 of Dropdowns > Items" should contain "Favorites"
    * Text in collection of "Add To Popup > #1 of Dropdowns > Items" should contain "Folder"
    * Count of "Add To Popup > Content Tree > All Content Nodes In Tree Nodes" should be more than "0"
    * "Add To Popup > Save And Close" should not be enabled
    * "Add To Popup > Cancel" should be enabled
    * "Add To Popup > X Close Button" should be enabled
    * I click "Add To Popup > Cancel"
    * "Add To Popup" should not be visible

  @CU-29092
  @local
  Scenario: Verify UI elements on "Add to" overlay on SRL
    * I am logged in
    * I perform search of "international franchising"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * Text of "Add To Popup > #1 of Dropdowns > #1 of Items" should be "Favorites"
    * Text of "Add To Popup > #1 of Dropdowns > #2 of Items" should be "Folder"
    * "Add To Popup > Save And Close" should not be enabled
    * "Add To Popup > Cancel" should be enabled
    * "Add To Popup > X Close Button" should be enabled
    * "Add To Popup > Content Tree" should not be visible
    * I click "Add To Popup > Cancel"
    * "Add To Popup" should not be visible

  @CU-29404
  Scenario: Verify that user can Open document from Favorites overlay
    * I am logged in
    * I add "601adc347b6c1000a73300237de5959c01" document to favorites
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I click "Favorites Popup > #1 of Item Names"
    * "Favorites Popup" should not be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "601adc347b6c1000a73300237de5959c01" text ignoring case

  @CU-29451
  Scenario: Verify that user can delete document from favorites using "Favorites" overlay
    * I am logged in
    * I open "09013e2c824fb72a" document
    * "Document Frame > Document Content" should be visible
    * I click "Favorite Button"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Delete Button"
    * I click "Favorites Popup > Confirm Button"
    * I wait until "Loading Indicator" is gone
    * Count of "Favorites Popup > Items" should be equal to "0"
    * I click "Favorites Popup > Close Button"
    * I open "09013e2c824fb72a" document
    * "Favorite Button Checked" should not be visible

  @CU-34290
  Scenario Outline: Verify Topic pages can be added to Favorites
    * I am logged in
    * I open "<Doc>" topics document
    * I wait until "Loading Indicator" is gone
    * I remember text of "Tax Topic Page > Topic Title" as "title1"
    * I click "Tax Topic Page > Toolbar Buttons > Add To Button"
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
    * I remember text of "Favorites Popup > #1 of Item Names" as "popUpTitle1"
    * "{$popUpTitle1}" text should contain "{$title1}" text ignoring case

    Examples:
      | Doc                                      |
      | tppc0121df0e607c691000a60490b11c18cbab0c |
      | 829326aa7c921000ba1290b11c2ac4f104       |
      | tes01c327ee367d681000a7d6005056881d2303  |

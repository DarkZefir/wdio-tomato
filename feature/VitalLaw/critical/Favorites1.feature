@critical_path
@mvl
Feature: Favorites 1

  @CU-29106
  Scenario: Verify UI elements on "Favorites' overlay
    * I am logged in
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #3 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > No Results Message" should contain "You currently have no favorites"
    * Text of "Favorites Popup > Title" should be "FAVORITES"
    * "Favorites Popup > Toolbar Buttons" should not be visible
    * "Favorites Popup > Close Button" should be visible
    * "Favorites Popup > Close Button" should be enabled
    * "Favorites Popup > X Close Button" should be visible
    * "Favorites Popup > X Close Button" should be enabled
    * "Favorites Popup > Delete Button" should not be visible
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible

  @CU-29109
  Scenario: Verify that user can add complete DA into the 'Favorites' from Read Template
    * I am logged in
    * I open "601adc347b6c1000a73300237de5959c01" document
    * I remember text of "DA Title" as "docTitle"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * I click "Add To Popup > Content Tree > #1 of Level 0 Content Tree Nodes Checkboxes"
    * I remember text of "Add To Popup > Content Tree > #1 of Level 0 Content Tree Nodes Titles" as "daTitle"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should contain "{$docTitle}" ignoring case
    * Text of "Favorites Popup > #1 of Item Names" should contain "{$daTitle}" ignoring case ignoring whitespaces

  @CU-29217
  Scenario: Verify that user can add a Document into the 'Favorites' using 'Select Content' area on 'ADD' overlay from Read view
    * I am logged in
    * I open "jwa0109013e2c83b7c033" document
    * I remember text of "Document Frame > Title" as "docTitle"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * I click "Add To Popup > Content Tree > #2 of Level 2 Content Tree Nodes Checkboxes"
    * I click "Add To Popup > Content Tree > #4 of Level 3 Content Tree Nodes Checkboxes"
    * I remember text of "Add To Popup > Content Tree > #2 of Level 2 Content Tree Nodes Checkboxes" as "docTitle1"
    * I remember text of "Add To Popup > Content Tree > #4 of Level 3 Content Tree Nodes Checkboxes" as "docTitle2"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header >Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * "Favorites Popup > #1 of Item Names" should be visible
    * I remember text of "Favorites Popup > #1 of Item Names" as "popUpTitle1"
    * I remember text of "Favorites Popup > #2 of Item Names" as "popUpTitle2"
    * "{$popUpTitle1}" text should contain "{$docTitle1}" text
    * "{$popUpTitle2}" text should contain "{$docTitle2}" text

  @CU-29569
  @local
  Scenario: Verify the display of Add to Favorites overlay opened from On Platform Smart Charts template
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "Employee and Officer Compensation"
    * I click "Smart Charts Title Box"
    * "Smart Charts Title Box" should not be visible
    * "Utility Bar > Favorites Button" should be visible
    * I remember text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" as "leafTitle"
    * I click "Utility Bar > Favorites Button"
    * "Smart Charts Favorites Popup" should be visible
    * Text of "Smart Charts Favorites Popup > Title" should be "FAVORITE THIS SMART CHART"
    * "Smart Charts Favorites Popup > X Close Button" should be visible
    * "Smart Charts Favorites Popup > Name Of Favorites Label" should be visible
    * "Smart Charts Favorites Popup > Cancel Button" should be visible
    * "Smart Charts Favorites Popup > Save And Close Button" should be visible
    * Value in "Smart Charts Favorites Popup > Text Input" should be "Smart Chart: {$leafTitle}"
    * I click "Smart Charts Favorites Popup > X Close Button"
    * "Smart Charts Favorites Popup" should not be visible
    * I click "Utility Bar > Favorites Button"
    * "Smart Charts Favorites Popup" should be visible
    * I type "1" in "Smart Charts Favorites Popup > Text Input"
    * I click "Smart Charts Favorites Popup > Cancel Button"
    * "Confirmation Popup" should not be visible
    * "Smart Charts Favorites Popup" should not be visible

  @CU-29671
  @local
  Scenario: Verify that user could add On Platform Smart Charts to "Favorites" overlay
    * I am logged in
    * I perform search of "Employee and Officer Compensation"
    * I click "Smart Charts Title Box"
    * "Smart Charts Title Box" should not be visible
    * I remember text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" as "leafTitle"
    * "Utility Bar > Favorites Button" should be visible
    * I click "Utility Bar > Favorites Button"
    * "Smart Charts Favorites Popup" should be visible
    * I click "Smart Charts Favorites Popup > Save And Close Button"
    * "Smart Charts Favorites Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #3 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I remember text of "Favorites Popup > #1 of Item Names" as "popUpTitle1"
    * "{$popUpTitle1}" text should contain "{$leafTitle}" text
    * "{$popUpTitle1}" text should contain "Smart Chart:" text

  @CU-29672
  @local
  Scenario: Verify that user could open On Platform Smart Charts to Favorites from "Favorites" overlay
    * I am logged in
    * I perform search of "Employee and Officer Compensation"
    * I click "Smart Charts Title Box"
    * "Smart Charts Title Box" should not be visible
    * I click "Utility Bar > Favorites Button"
    * "Smart Charts Favorites Popup" should be visible
    * I click "Smart Charts Favorites Popup > Save And Close Button"
    * "Smart Charts Favorites Popup" should not be visible
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #3 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I remember text of "Favorites Popup > #1 of Item Names" as "popUpTitle"
    * I click "Favorites Popup > #1 of Item Names"
    * "Favorites Popup" should not be visible
    * I remember text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" as "leafTitle"
    * "{$popUpTitle}" text should contain "{$leafTitle}" text

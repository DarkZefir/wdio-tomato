@critical_path
@mvl
Feature: Contents Panel

  @CU-29535
  Scenario: Verify magnifying glass icon appears on hovering over each element of TOC widget
    * I am logged in
    # Open 'fin0109013e2c839106da' doc
    * I open "fin0109013e2c839106da" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Verify that Magnifying Glass is dislayed on hover over the parent node in TOC
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header"
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Magnifying Glass" should be visible
    # Verify that Magnifying Glass is displayed on hover over the First child node in TOC
    * I move mouse over "Contents Tab > Root Title"
    * I move mouse over "Contents Tab > #1 of Expanded First Child Node > Path Header"
    * "Contents Tab > #1 of Expanded First Child Node > Path Header > Magnifying Glass" should be visible
    # Verify that Magnifying Glass is displayed on hover over the selected node in TOC
    * I move mouse over "Contents Tab > Root Title"
    * I move mouse over "Contents Tab > Selected Link"
    * "Contents Tab > Selected Link > Magnifying Glass" should be visible
    # Verify that Magnifying Glass is displayed on hover over the first collapsed node in TOC
    * I move mouse over "Contents Tab > Root Title"
    * I move mouse over "Contents Tab > #1 of Collapsed First Child Node > Header"
    * "Contents Tab > #1 of Collapsed First Child Node > Header > Magnifying Glass" should be visible
    # Verify that Magnifying Glass is displayed on hover over the first collapsed parent node in TOC
    * I move mouse over "Contents Tab > Root Title"
    * I move mouse over "Contents Tab > #1 of Collapsed Parent Node > Header"
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Magnifying Glass" should be visible

  @CU-31767
  Scenario: Verify that expansion of a node is not persistent in 'Contents' panel once the node is collapsed
    * I am logged in
    # Open 'ftn0109013e2c8432f6a4' doc
    * I open "ftn0109013e2c8432f6a4" document
    * "Contents Tab > Selected Link" should be visible
    # Verify that the title of the first expanded parent node contains 'Individuals'
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "Individuals" ignoring case ignoring whitespaces
    # Verify that the title of the first expanded child node contains 'Taxation of Individuals in General'
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "Taxation of Individuals in General" ignoring case ignoring whitespaces
    # Verify that the title of the second child node contains '§1,005 Individuals Subject to Tax'
    * Text of "Contents Tab > #1 of Expanded Second Child Node > Path Header > Label" should contain "§1,005 Individuals Subject to Tax" ignoring case ignoring whitespaces
    # Click on the first expanded parent node (Individuals)
    * I click "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    # Verify that 'Individuals' node is no longer expanded
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible
    # Click on 'Individuals' node
    * I click "Contents Tab > #Individuals in Collapsed Parent Node > Path Header > Label"
    # Verify that 'Taxation of Individuals in General' node is visible
    * "Contents Tab > #1 of Collapsed First Child Node > Path Header > Label" should be visible
    # Verify that '§1,005 Individuals Subject to Tax' node is not visible
    * "Contents Tab > #1 of Collapsed Second Child Node" should not be visible
    # Click on 'Taxation of Individuals in General' node
    * I click "Contents Tab > #Taxation of Individuals in General in Collapsed First Child Node > Path Header > Label"
    # Verify that the second child node contains '§1,005 Individuals Subject to Tax'
    * Text of "Contents Tab > #1 of Collapsed Second Child Node > Path Header > Label" should contain "§1,005 Individuals Subject to Tax" ignoring case ignoring whitespaces
    # Verify that '§1,005.05, In General' node is not visible
    * "Contents Tab > Selected Link" should not be visible

  @CU-31776
  Scenario: Verify that path to the document displayed in Read view is highlighted in 'Contents' panel
    * I am logged in
    # Open '45bfc5a47d2c10008999d8d385ad169403' doc
    * I open "45bfc5a47d2c10008999d8d385ad169403" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Verify that the selected node is highlighted with blue (#3385ac)
    * Background color of "Contents Tab > Selected Link" should be "#3385ac"
    # Verify that the first expanded parent node is highlighted with grey (#d6d5d5)
    * Background color of "Contents Tab > #1 of Expanded Parent Node > Path Header" should be "#d6d5d5"
    # Verify that the first child node of expanded parent node is highlighted with light grey (#f1f0f0)
    * Background color of "Contents Tab > #1 of Expanded First Child Node > Path Header > Collapse Button" should be "#f1f0f0"
    # Click on the first expanded parent node in TOC
    * I click "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    # Verify that the title of the third collapsed parent node is 'Part II. Preliminary Agreements' and it's highlighted with grey '#d6d5d5'
    * Text of "Contents Tab > #3 of Collapsed Parent Node > Path Header > Label" should contain "Part II. Preliminary Agreements" ignoring case ignoring whitespaces
    * Background color of "Contents Tab > #3 of Collapsed Parent Node > Path Header" should be "#d6d5d5"
    # Verify that previously the first expanded parent node is now collapsed
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible
    # Click on 'Part II. Preliminary Agreements' node
    * I click "Contents Tab > #Part II. Preliminary Agreements in Collapsed Parent Node > Path Header > Label"
    # Verify that the fifth child node contains 'Chapter 7A Materials Transfer Agreement'
    * Text of "Contents Tab > #5 of Collapsed First Child Node > Path Header > Label" should contain "Chapter 7A Materials Transfer Agreement" ignoring case ignoring whitespaces
    # Verify that the fifth child node is highlighted with light grey (#f1f0f0)
    * Background color of "Contents Tab > #5 of Collapsed First Child Node > Expand Button" should be "#f1f0f0"
    # Click on the fifth child node
    * I click "Contents Tab > #5 of Collapsed First Child Node > Path Header > Label"
    # Verify that selected node is visible and highlighted with blue (#3385ac)
    * "Contents Tab > Selected Link" should be visible
    * Background color of "Contents Tab > Selected Link" should be "#3385ac"

  @CU-31875
  Scenario: Verify that when a publication is opened from 'Titles' overlay 'Contents' panel is collapsed in contents tree
    * I am logged in
    * "Header > Titles Button" should be visible
    # Click on Titles in Header
    * I click "Header > Titles Button"
    * "Titles Popup > Search Input" should be visible
    # Perform search for 'Medical Devices: Laws and Regulations'
    * I type "Medical Devices: Laws and Regulations" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    # Click on 'Medical Devices: Laws and Regulations' link
    * I click "Titles Popup > #Medical Devices: Laws and Regulations in Publications Links"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    # Verify that the highlighted with grey node is collapsed
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible

  @CU-33726
  Scenario: Verify that when a publication is opened from 'Favorites' overlay 'Contents' panel is expanded in contents tree
    * I am logged in
    # Add '09013e2c84b4414c' doc to favorites
    * I add "09013e2c84b4414c" document to favorites
    # Click on Favorites in Saved Items in Header
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Favorites in Items"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    # Click on the first item in Favorites overlay
    * I click "Favorites Popup > #1 of Item Names"
    * "Favorites Popup" should not be visible
    * "Document Frame > Title" should be visible
    # Verify that selected node is visible in TOC
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that docID is equal to '09013e2c84b4414c'
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "09013e2c84b4414c" text ignoring case

  @CU-33727
  Scenario: Verify that when a publication is opened from 'History' overlay 'Contents' panel is expanded in contents tree
    * I am logged in
    # Open '09013e2c84b4414c' doc
    * I open "09013e2c84b4414c" document
    * "Contents Tab > Selected Link" should be visible
    # Click on History in Header
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    # Click on 'See All History' button
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    # Click on the first item in History overlay
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * "Document Frame > Title" should be visible
    # Verify that selected node is visible in TOC
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that docID is equal to '09013e2c84b4414c'
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "09013e2c84b4414c" text ignoring case

  @CU-33728
  Scenario: Verify that when a publication is opened from 'Folders' overlay 'Contents' panel is expanded in contents tree
    * I am logged in
    # Add '09013e2c84b4414c' doc to 'CU-33728' folder
    * I add "09013e2c84b4414c" document to "CU-33728" folder
    # Click on Folders in Header
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Click on the first item in Folders drop-down
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    # Click on the first item in Folders overlay
    * I click "Folder Popup > #1 of Items"
    * "History Popup" should not be visible
    * "Document Frame > Title" should be visible
    # Verify that selected node is visible in TOC
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that docID is equal to '09013e2c84b4414c'
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "09013e2c84b4414c" text ignoring case

  @CU-33729
  Scenario: Verify that after page refresh 'Contents' panel is expanded in contents tree
    * I am logged in
    # Open '09013e2c825fedb6' doc
    * I open "09013e2c825fedb6" document
    * "Contents Tab > Selected Link" should be visible
    # Verify that selected node is visible in TOC
    * "Contents Tab > Selected Link" should be visible
    # Click on browser refresh button
    * I click browser refresh button
    * "Document Frame > Title" should be visible
    # Verify that selected node is visible in TOC
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

  @CU-33730
  Scenario Outline: Verify 'Contents' panel is expanded in contents tree after click on 'Next Document' button
    * I am logged in
    # Open the doc from examples
    * I open "<docId>" document
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text1"
    # Click on 'Next Document' button
    * I click "Toolbar > Next Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text2"
    * I wait until "Loading Indicator" is gone
    # Verify that the titles of the selected nodes thet were memorized do not match
    * "{$text1}" text should not contain "{$text2}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | docId            |
      | 09013e2c844d88ed |


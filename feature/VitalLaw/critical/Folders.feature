@critical_path
@mvl
@folders
Feature: Folders

  @CU-32578
  @logout
  Scenario Outline: Verify UI of Empty folders Overlay - user has no folders
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * I add "<doc2>" document to "<Folder1>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > See All Button" should be visible
    * I click "Header > Folders Dropdown > See All Button"
    * "Folder Popup" should be visible
    * I click "Folder Popup > Delete Folder Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Folder Popup" should be visible
    * "Folder Popup > Folders Dropdown > #1 of Links" should not be visible
    * "Folder Popup > No Folders Info" should be visible
    * Text of "Folder Popup > No Folders Info" should be "You currently have no folders"
    * "Folder Popup > Folders Dropdown" should be visible
    * Text of "Folder Popup > Folders Dropdown" should be "SELECT FOLDER" ignoring case ignoring whitespaces
    * "Folder Popup > Edit Folder Link" should not be visible
    * "Folder Popup > Create New Folder Button" should be visible
    * "Folder Popup > Action Button" should not be enabled
    * Text of "Folder Popup > Action Button" should not be "Delete Folder" ignoring case
    * "Folder Popup > Toolbar Buttons" should be visible
    * "Folder Popup > Sort Dropdown" should be visible
    * "Folder Popup > Remove From Folder Button" should be visible
    * "Folder Popup > Remove From Folder Button" should not be enabled
    * "Folder Popup > Close Button" should be visible
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible

    Examples:
      | Folder1         | doc1                                     | doc2                               |
      | Tax Federal doc | sec01405c0ca87cc31000bd6a90b11c18cbab056 | e498c8bc7d571000bfad00505688693903 |

  @CU-32602
  @logout
  Scenario Outline: Verify that user is able to delete folder from Edit overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * I add "<doc2>" document to "<Folder2>" folder
    * I add "<doc3>" document to "<Folder2>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "2"
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    * Count of "Folder Popup > Items" should be equal to "1"
    * I click "Folder Popup > Edit Folder Link"
    * "Folder Info Popup" should be visible
    * I click "Folder Info Popup > Delete Folder Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Folder Info Popup" should not be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder2>" ignoring case ignoring whitespaces
    * Count of "Folder Popup > Items" should be equal to "2"
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "1"

    Examples:
      | Folder1      | doc1                                     | doc2                               | doc3                               | Folder2       |
      | First Folder | sec01405c0ca87cc31000bd6a90b11c18cbab056 | e498c8bc7d571000bfad00505688693903 | 774adbf07cc71000833a90b11c18c90201 | Second Folder |

  @CU-32603
  @logout
  Scenario Outline: Verify user is able to edit Folder name and add description
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    * I click "Folder Popup > Edit Folder Link"
    * "Folder Info Popup" should be visible
    * I send sequence of keys "New name" to element "Folder Info Popup > Name Input"
    * I send sequence of keys "<New Description>" to element "Folder Info Popup > Description Textarea"
    * "Folder Info Popup > Save And Close" should be clickable
    * I click "Folder Info Popup > Save And Close"
    * I wait 3 seconds
    * "Folder Info Popup" should not be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<New Name>" ignoring case ignoring whitespaces
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "1"
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<New Name>" ignoring case ignoring whitespaces

    Examples:
      | Folder1      | doc1                                     | New Name             | New Description |
      | First Folder | sec01405c0ca87cc31000bd6a90b11c18cbab056 | First FolderNew name | New Description |

  @CU-32604
  @logout
  Scenario Outline: Verify user is able to remove all documents from Folder
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * I add "<doc2>" document to "<Folder1>" folder
    * I add "<doc3>" document to "<Folder1>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    * Count of "Folder Popup > Items" should be equal to "3"
    * I click "Folder Popup > Select All Checkbox"
    * I click "Folder Popup > Remove From Folder Button"
    * "Confirmation Popup" should be visible
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * Count of "Folder Popup > Items" should be equal to "0"
    * "Folder Popup > Empty Folder Info" should be visible
    * Text of "Folder Popup > Empty Folder Info" should be "Empty folder." ignoring case ignoring whitespaces
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "1"
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>" ignoring case
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "Empty"

    Examples:
      | Folder1      | doc1                                     | doc2                               | doc3                               |
      | First Folder | sec01405c0ca87cc31000bd6a90b11c18cbab056 | e498c8bc7d571000bfad00505688693903 | 774adbf07cc71000833a90b11c18c90201 |

  @CU-32605
  @logout
  Scenario Outline: Verify User is able to create new folder from Folders Overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    * I click "Folder Popup > Create New Folder Button"
    * "New Folder Popup" should be visible
    * "New Folder Popup > Name Input" should be visible
    * "New Folder Popup > Description Textarea" should be visible
    * I send sequence of keys "<Name>" to element "New Folder Popup > Name Input"
    * I send sequence of keys "<Description>" to element "New Folder Popup > Description Textarea"
    * I click "New Folder Popup > Save And Close"
    * "New Folder Popup" should not be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<Name>" ignoring case ignoring whitespaces
    * "Folder Popup > Empty Folder Info" should be visible
    * Text of "Folder Popup > Empty Folder Info" should be "Empty folder." ignoring case ignoring whitespaces
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "2"
    * Text of "Header > Folders Dropdown > #2 of Items" should be "<Name>" ignoring case
    * Text of "Header > Folders Dropdown > #2 of Items Count" should be "Empty"

    Examples:
      | Folder1      | doc1                               | Name          | Description  |
      | First Folder | e498c8bc7d571000bfad00505688693903 | Second Folder | Just created |

  @CU-32616
  @logout
  Scenario Outline: Verify User is able to add doc to another folder in Folders Overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * I add "<doc2>" document to "<Folder2>" folder
    * "Header > Folders Dropdown" should be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup" should be visible
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    * Count of "Folder Popup > Items" should be equal to "1"
    * I remember text of "Folder Popup > #1 of Items > Document Title" as "title"
    * "Folder Popup > Folders Dropdown" should be clickable
    * I click "Folder Popup > Folders Dropdown"
    * "Folder Popup > Folders Dropdown > #1 of Links" should be visible
    * I remember index of "Folder Popup > Folders Dropdown > Links" matching "<Folder2>" as "index"
    * I click "Folder Popup > Folders Dropdown > #{$index} of Links"
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder2>" ignoring case ignoring whitespaces

    * I click "Folder Popup > #1 of Items > Checkbox"
    * I click "Folder Popup > Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    * "Add To Popup > #2 of Dropdowns" should be visible
    * I click "Add To Popup > #2 of Dropdowns"
    * I click "Add To Popup > #2 of Dropdowns > #<Folder1> in Items"
    * Text of "Add To Popup > #2 of Dropdowns" should be "<Folder1>" ignoring case
    * "Add To Popup > Save And Close" should be clickable
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I wait 5 seconds

    * I click "Folder Popup > Folders Dropdown"
    * "Folder Popup > Folders Dropdown > #1 of Links" should be visible
    * I remember index of "Folder Popup > Folders Dropdown > Links" matching "<Folder1>" as "index"
    * I click "Folder Popup > Folders Dropdown > #{$index} of Links"
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    * Count of "Folder Popup > Items" should be equal to "2"
    * Text of "Folder Popup > #2 of Items > Document Title" should be "{$title}"
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>"
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces
    Examples:
      | Folder1      | Folder2       | doc1                                     | doc2                               |
      | First Folder | Second Folder | sec01405c0ca87cc31000bd6a90b11c18cbab056 | e498c8bc7d571000bfad00505688693903 |

  @CU-32663
  @logout
  Scenario Outline: Verify user is able to create new folder from favorites overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<DocID>" document to favorites
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should be "<Title>"
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    * "Add To Popup > #2 of Dropdowns" should be visible
    * I wait until text of "Add To Popup > #2 of Dropdowns" is "CREATE NEW FOLDER"
    * "Add To Popup > Folder Name" should be visible
    * "Add To Popup > Folder Description" should be visible
    * I send sequence of keys "CU-32663" to element "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be clickable
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "CU-32663"

    Examples:
      | DocID                 | Title                                                                                                                                      |
      | hea0209013e2c8488cfe0 | Employment Practices: EEO Issuances, Equal Employment Opportunity Commission, Harassment Investigations in Light of Harris, (Mar. 8, 1994) |

  @CU-32670
  @logout
  Scenario Outline: Verify user is able to add document to folder from favorites overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I add "<DocID1>" document to favorites
    * I add "<DocID2>" document to "<Folder1>" folder
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should be "<Title>"
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    * "Add To Popup > #2 of Dropdowns" should be visible
    * I click "Add To Popup > #2 of Dropdowns"
    * I click "Add To Popup > #2 of Dropdowns > #<Folder1> in Items"
    * Text of "Add To Popup > #2 of Dropdowns" should be "<Folder1>" ignoring case
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>"
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items"

    Examples:
      | DocID1                | Title                                                                                 | DocID2                             | Folder1     |
      | sec0109013e2c842e6d89 | Federal Securities Law Reporter, 1933 Securities Act Sec. 1, [15 USC 77a] SHORT TITLE | 27b40d3a7d821000a39a005056881d2301 | Test Folder |

  @CU-32671
  @local
  @logout
  Scenario Outline: Verify user is NOT able to add OPSC to folder from favorites overlay
    * I am logged in as "folderstest@wk.com" with "password" password
    * I am on "<Practice Area>" PA
    * I add "<DocID1>" document to "<Folder1>" folder
    * I perform search of "*"
    * "Smart Charts Title Box" should be visible
    * I click "Smart Charts Title Box"
    * I wait until "Loading Indicator" is gone
    * "Smart Charts Title Box" should not be visible
    * I click "Utility Bar > Favorites Button"
    * "Smart Charts Favorites Popup" should be visible
    * I click "Smart Charts Favorites Popup > Save And Close Button"
    * "Smart Charts Favorites Popup" should not be visible
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Add To Button"
    * "Action Not Performed Popup" should be visible
    * Text of "Action Not Performed Popup > #1 of Items" should be "- 1 saved smart chart"
    * I click "Action Not Performed Popup > X Close Button"
    * "Action Not Performed Popup" should not be visible
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>"
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "1 Item"

    Examples:
      | Practice Area | DocID1                | Folder1     |
      | ALL CONTENT   | sec0109013e2c842e6d89 | Test Folder |

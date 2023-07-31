@smoke
@mvl
@folders
Feature: Folders

  @CU-32497
  @logout
  Scenario Outline: Verify User is able to create 1st folder from read view
    * I am logged in as "folderstest@wk.com" with "password" password
    # Open <docID> doc
    * I open "<docID>" document
    * "Document Frame > Document Content" should be visible
    # Remember text of doc's title as "docTitle"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click "Add To" button in doc's Toolbar
    * I click "Toolbar Buttons > Add To Button"
    # Verify that "Add To" popup is displayed
    * "Add To Popup" should be visible
    * "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should be visible
    # Verify that text of title of selected item in Content Tree is "{$docTitle}
    * Text of "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should contain "{$docTitle}"
    # Verify that "- SELECT -" text is displayed in dropdown of "Add to" section
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folders" in the displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    # Verify that text within dropdown in "Add to" section is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Verify that 2nd dropdown appeared in "Add to" section
    * "Add To Popup > #2 of Dropdowns" should be visible
    # Verify that text displayed within 2nd dropdown of "Add to" section is "CREATE NEW FOLDER"
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    # Verify that "Folder Name" input field is displayed
    * "Add To Popup > Folder Name" should be visible
    # Verify that "Folder Description" input field is displayed
    * "Add To Popup > Folder Description" should be visible
    # Input "CU-32497" text into "Folder Name" input field
    * I type "CU-32497" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close" button
    * I click "Add To Popup > Save And Close"
    # Verify that "Add To" popup is no longer visible
    * "Add To Popup" should not be visible
    # Click "Folder" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that "Folders" dropdown has 1 item with "CU-32497" text
    * "Header >Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "CU-32497"
    # Verify that "See All" button is displayed within "Folders" dropdown
    * "Header > Folders Dropdown > See All Button" should be visible

    Examples:
      | docID                                   |
      | cnf01f9a03abc7c42100085cd90b11c18c90201 |

  @CU-32498
  @logout
  @local
  Scenario Outline: Verify User is able to create 1st folder from Search Results
    * I am logged in as "folderstest@wk.com" with "password" password
    # Search for <Search Term>
    * I perform search of "<Search Term>"
    # Select checkbox next to any doc from 1st to 3rd
    * I remember random integer below "3" as "index"
    * I click "#{$index} of Documents > Checkbox"
    # Select checkbox next to 4th doc in results list
    * I click "#4 of Documents > Checkbox"
    # Click "Add To" button in Toolbar
    * I click "Toolbar Buttons > Add To Button"
    # Verify that "Add To" popup is displayed
    * "Add To Popup" should be visible
    # Verify that "- SELECT -" text is displayed in dropdown of "Add to" section
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folders" in the displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    # Verify that text within dropdown in "Add to" section is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Verify that 2nd dropdown appeared in "Add to" section
    * "Add To Popup > #2 of Dropdowns" should be visible
    # Verify that text displayed within 2nd dropdown of "Add to" section is "CREATE NEW FOLDER"
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    # Verify that "Folder Name" input field is displayed
    * "Add To Popup > Folder Name" should be visible
    # Verify that "Folder Description" input field is displayed
    * "Add To Popup > Folder Description" should be visible
    # Input "CU-32498" text into "Folder Name" input field
    * I type "CU-32498" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close" button
    * I click "Add To Popup > Save And Close"
    # Verify that "Add To" popup is no longer visible
    * "Add To Popup" should not be visible
    # Click "Folder" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that "Folders" dropdown has 1 item with "CU-32498" text
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "CU-32498"
    # Verify that "2 Items" text is displayed next to folder name
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces
    # Verify that "See All" button is displayed within "Folders" dropdown
    * "Header > Folders Dropdown > See All Button" should be visible

    Examples:
      | Search Term                 |
      | System Network Architecture |

  @CU-32572
  @logout
  Scenario: Verify UI of folders dropdown - user has 1 folder
    * I am logged in as "folderstest@wk.com" with "password" password
    # Create a folder "newCU" and add "09013e2c80126a93" document to it
    * I add "09013e2c80126a93" document to "newCU" folder
    # Add "sdd016bf625dc7d87100080c0005056885db601" document to "newCU" folder
    * I add "sdd016bf625dc7d87100080c0005056885db601" document to "newCU" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that "newCU" is the 1st item in "Folders" dropdown
    * Text of "Header > Folders Dropdown > #1 of Items" should be "newCU" ignoring whitespaces
    # Verify that "2 items" text is displayed next to "newCU" folder name
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces
    # Verify that "See All" button is displayed within "Folders" dropdown
    * "Header > Folders Dropdown > See All Button" should be visible

  @CU-32576
  @logout
  Scenario Outline: Verify UI of folders Overlay - user has 2 folders
    * I am logged in as "folderstest@wk.com" with "password" password
    # Create folder with <Folder1> name and add <doc1> from examples there
    * I add "<doc1>" document to "<Folder1>" folder
    # Create folder with <Folder2> name and add <doc2> from examples there
    * I add "<doc2>" document to "<Folder2>" folder
    # Add <doc3> from examples to <Folder2>
    * I add "<doc3>" document to "<Folder2>" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Click "See All" button in "Folders" dropdown
    * I click "Header > Folders Dropdown > See All Button"
    * "Folder Popup" should be visible
    # Verify that "Folders" popup is visible
    * "Folder Popup > Folders Dropdown" should be visible
    # Verify that "<Folder2>" text is displayed within dropdown
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder2>" ignoring case ignoring whitespaces
    # Verify that the following elements are displayed in "Folders" popup
    * "Folder Popup > Edit Folder Link" should be visible
    * "Folder Popup > Create New Folder Button" should be visible
    * "Folder Popup > Delete Folder Button" should be visible
    * Text of "Folder Popup > Delete Folder Button" should be "Delete Folder" ignoring case
    * "Folder Popup > Toolbar Buttons" should be visible
    * "Folder Popup > Sort Dropdown" should be visible
    * "Folder Popup > Remove From Folder Button" should be visible
    * "Folder Popup > Remove From Folder Button" should not be enabled
    * "Folder Popup > Close Button" should be visible
    # Verify that number of items displayed within "Folders" popup is 2
    * Count of "Folder Popup > Items" should be equal to "2"
    # Click dropdown in "Folders" popup
    * I click "Folder Popup > Folders Dropdown"
    # Verify that number of items within displayed dropdown is 2
    * Count of "Folder Popup > Folders Dropdown > Links" should be equal to "2"
    # Click 2nd link in displayed dropdown
    * I click "Folder Popup > Folders Dropdown > #2 of Links"
    # Verify that text displayed within dropdown in "Folders" popup is <Folder1>
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    # Verify that number of items displayed in "Folders" popup is 1
    * Count of "Folder Popup > Items" should be equal to "1"

    Examples:
      | Folder1         | doc1             | Folder2         | doc2                               | doc3                  |
      | Tax Federal doc | 09013e2c80126a93 | Heakthcare docs | e498c8bc7d571000bfad00505688693903 | mkl0609013e2c86314fe1 |

  @CU-32577
  @logout
  Scenario Outline: Verify UI of folders Overlay - user has 1 folder
    * I am logged in as "folderstest@wk.com" with "password" password
    # Create folder woth <Folder1> title and add <doc1> to it
    * I add "<doc1>" document to "<Folder1>" folder
    # Add <doc1> to <Folder1>
    * I add "<doc2>" document to "<Folder1>" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Click "See All" button in "Folders" dropdown
    * I click "Header > Folders Dropdown > See All Button"
    * "Folder Popup" should be visible
    # Verify that "Folders" popup is displayed
    * "Folder Popup > Folders Dropdown" should be visible
    # Verify that text displayed in dropdown within "Folders" popup is <Folder1>
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    # Verify that the following elements are displayed within "Folders" popup:
    * "Folder Popup > Edit Folder Link" should be visible
    * "Folder Popup > Create New Folder Button" should be visible
    * "Folder Popup > Delete Folder Button" should be visible
    * Text of "Folder Popup > Delete Folder Button" should be "Delete Folder" ignoring case
    * "Folder Popup > Toolbar Buttons" should be visible
    * "Folder Popup > Sort Dropdown" should be visible
    * "Folder Popup > Remove From Folder Button" should be visible
    * "Folder Popup > Remove From Folder Button" should not be enabled
    * "Folder Popup > Close Button" should be visible
    # Verify that the list of documents added in the folder has 2 items
    * Count of "Folder Popup > Items" should be equal to "2"
    # Click dropdown within "Folders" popup
    * I click "Folder Popup > Folders Dropdown"
    # Verify that displayed dropdown has 1 item
    * Count of "Folder Popup > Folders Dropdown > Links" should be equal to "1"

    Examples:
      | Folder1         | doc1             | doc2                               |
      | Tax Federal doc | 09013e2c80126a93 | e498c8bc7d571000bfad00505688693903 |

  @CU-32579
  @logout
  Scenario Outline: Verify User is able to create new folder from read view (user already has 1 folder)
    * I am logged in as "folderstest@wk.com" with "password" password
    # Create <Folder1> and add <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    * "Search Bar > Search Input" should be visible
    # Open <doc2> document
    * I open "<doc2>" document
    * "Document Frame > Document Content" should be visible
    # Remember title of the opened document as "docTitle"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click "Add To" button in doc's Toolbar
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should be visible
    # Verify that selected item in Contents Tree displayed within "Add To" popup has "{$docTitle}" title
    * Text of "Add To Popup > Content Tree > #1 of Selected Content Tree Nodes" should contain "{$docTitle}"
    # Verify that "- SELECT -" text is displayed within dropdown in "Add to" section
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folder" item within displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    # Verify that text within dropdown in "Add to" section is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Verify that 2nd dropdown is appeared in "Add to" section
    * "Add To Popup > #2 of Dropdowns" should be visible
    # Click 2nd dropdown within "Add to" section
    * I click "Add To Popup > #2 of Dropdowns"
    # Click "Create New Folder" item in displayed dropdown
    * I click "Add To Popup > #2 of Dropdowns > #Create New Folder in Items"
    # Verify that "CREATE NEW FOLDER" text is displayed within closed 2nd dropdown
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    # Verify that "Folder Name" input field is displayed
    * "Add To Popup > Folder Name" should be visible
    # Verify that "Folder Description" input field is displayed
    * "Add To Popup > Folder Description" should be visible
    # Input <Folder2> text into "Folder Name" input field
    * I type "<Folder2>" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close" button
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Verify that text of 1st item displayed in "Folders" dropdown is <Folder2>
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder2>"

    Examples:
      | doc1                               | doc2                               | Folder1    | Folder2    |
      | 6987bd8c7c431000b30c90b11c18cbab01 | 521f81d47d7910008ccf005056881d2302 | Old Folder | New folder |

  @CU-32580
  @local
  @logout
  Scenario Outline: Verify User is able to create new folder from Search Results (user already has 1 folder)
    * I am logged in as "folderstest@wk.com" with "password" password
    # Create folder with name <Folder1> and add <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    * I perform search of "<Search Term>"
    # Select checkbox next to any doc from 1 to 3 in results list
    * I remember random integer below "3" as "index"
    * I click "#{$index} of Documents > Checkbox"
    # Click "Add To" button
    * I click "Toolbar Buttons > Add To Button"
    # Verify that "Add To" popup is displayed
    * "Add To Popup" should be visible
    # Verify that text displayed within dropdown in "Add to" section is "- SELECT -"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown displayed within "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folder" item within displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    # Verify that text displayed within 1st dropdown of "Add to" section is "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Click 2nd dropdown
    * I click "Add To Popup > #2 of Dropdowns"
    # Click "Create New Folder" item within displayed dropdown
    * I click "Add To Popup > #2 of Dropdowns > #Create New Folder in Items"
    # Verify that text displayed within 2nd dropdown of "Add to" section is changed to "CREATE NEW FOLDER"
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    # Verify that "Folder Name" input field is displayed
    * "Add To Popup > Folder Name" should be visible
    # Verify that "Folder Description" input field is displayed
    * "Add To Popup > Folder Description" should be visible
    # Input <Folder2> text from examples into "Folder Name" input field
    * I type "<Folder2>" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close" button
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Verify that 1st item in "Folders" dropdown has <Folder2> text
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder2>"
    # Verify that "1 Item" text is displayed next 1st item in "Folders" dropdown
    * Text of "Header > Folders Dropdown > #1 of Items Count" should not be "Empty"
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "1 Item" ignoring whitespaces

    Examples:
      | doc1                              | Search Term     | Folder1    | Folder2    |
      | 90EAF6DD17ADE1C5444C6E3D0C4D19180 | Security future | Old Folder | New folder |

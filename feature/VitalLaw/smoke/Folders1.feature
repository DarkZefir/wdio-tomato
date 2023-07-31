@smoke
@mvl
@folders
Feature: Folders 1

  @CU-32581
  @logout
  Scenario Outline: Verify user can add document to existing folder from read view
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create a folder with <Folder1> name and add <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    * I click browser refresh button
    * "Search Bar > Search Input" should be visible
    # Open <doc2> doc/topic
    * I open base url with "<doc2>"
    * "Toolbar Buttons > Add To Button" should be visible
    * I wait until "Loading Indicator" is gone
    # Click "Add To" button
    * I click "<Alias> > Add To Button"
    * "Add To Popup" should be visible
    # Verify that text displayed within dropdown of "Add to" section is "- SELECT -"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folder" item within displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns >#Folder in Items"
    # Verify that text in First dropdown within "Add To" popup is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Click Second dropdown in "Add to" section
    * I click "Add To Popup > #2 of Dropdowns"
    # Click item with <Folder1> text in the displayed dropdown
    * I click "Add To Popup > #2 of Dropdowns >#<Folder1> in Items"
    # Verify that text displayed within Second dropdown in "Add to" section is <Folder1>
    * Text of "Add To Popup > #2 of Dropdowns" should be "<Folder1>" ignoring case
    # Verify that "Folder Name" input field is not displayed
    * "Add To Popup > Folder Name" should not be visible
    # Verify that "Folder Description" input field is not displayed
    * "Add To Popup > Folder Description" should not be visible
    * "Add To Popup > Save And Close" should be clickable
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close" button
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that "Folders" dropdown is displayed
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Verify that 2st item in "Folders" dropdown has <Folder1> text
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>"
    # Verify that "2 Items" text is displayed next to First item title in "Folders" dropdown
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces

    Examples:
      | doc1                               | doc2                                                          | Folder1    | Page   | Alias           |
      | 7efbebe47ba210008a11002264f3fce808 | #/read/tld01854cd03e7cbb100086e3d8d385ad169401                | Old Folder | Read   | Toolbar Buttons |
      | 7efbebe47ba210008a11002264f3fce808 | #/topics/TaxFederal/tppc01af1220907cb110009d0290b11c18cbab02d | Old Folder | Topics | Toolbar Buttons |

  @CU-32587
  @local
  @logout
  Scenario Outline: Verify user can add document to existing folder from search results
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create <Folder1> and add <doc1> into it
    * I add "pay0109013e2c843fa581" document to "Old Folder" folder
    # Search for <Search Term>
    * I perform search of "<searchTerm>"
    * "#1 of Documents > Link" should be visible
    # Select checkbox next to doc
    * I click "#1 of Documents > Checkbox"
    * I remember text of "#1 of Documents > Document Title" as "docTitle"
    # Click "Add To" button in Toolbar
    * I click "Toolbar Buttons > Add To Button"
    # Verify that "Add To" popup is displayed
    * "Add To Popup" should be visible
    # Verify that text displayed within dropdown in "Add to" section is "- SELECT -"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folder" item in displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns >#Folder in Items"
    # Verify that text displayed within First dropdown in "Add to" section is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Verify that 2nd dropdown in "Add to" section appeared
    * "Add To Popup > #2 of Dropdowns" should be visible
    # Click Second dropdown in "Add to" section
    * I click "Add To Popup > #2 of Dropdowns"
    # Click item with <Folder1> title in displayed dropdown
    * I click "Add To Popup > #2 of Dropdowns > #Old Folder in Items"
    # Verify that text displayed within Second dropdown is changed to <Folder1>
    * Text of "Add To Popup > #2 of Dropdowns" should be "Old Folder" ignoring case
    # Verify that "Folder Name" input field is not displayed
    * "Add To Popup > Folder Name" should not be visible
    # Verify that "Folder Description" input field is not displayed
    * "Add To Popup > Folder Description" should not be visible
    * "Add To Popup > Save And Close" should be clickable
    * "Add To Popup > Save And Close" should be enabled
    # Click "Save & Close"
    * I click "Add To Popup > Save And Close"
    # Verify that "Add To" popup is not displayed
    * "Add To Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that test of First dropdown displayed in "Folders" dropdown is "Old Folder"
    * Text of "Header > Folders Dropdown > #1 of Items" should be "Old Folder"
    # Verify that "2 Items" text is displayed next to First item's title in "Folders" dropdown
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces
    * I click "Header > Folders Dropdown > #1 of Items"
    * "Folder Popup > #1 of Items" should be visible
    * Text of "Folder Popup > #1 of Items" should contain "{$docTitle}"

    Examples:
      | type    | searchTerm                                  |
      | regular | db4b88287e09100088f0000d3a8abb4e01          |
      | L&R USC | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | L&R CFR | us-regs-774e37c52c8c85c4349107644151c55a-v1 |
      | L&R SS  | fl-law-5432f650ebc558bacd0f717ee77bcfed-v1  |
      | L&R SR  | or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 |

  @CU-32588
  @local
  @logout
  Scenario Outline: Verify user can add multiple documents to existing folder from search results
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create folder with <Folder1> name from examples and add <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    # Search for <Search Term>
    * I perform search of "<Search Term>"
    # Select checkbox next to any doc from 1 to 3 in results list
    * I remember random integer below "3" as "index"
    * I click "#{$index} of Documents > Checkbox"
    # Select checkbpx of 4th doc in  results list
    * I click "#4 of Documents > Checkbox"
    # Click "Add To" button
    * I click "Toolbar Buttons > Add To Button"
    # Verify that "Add To" popup is displayed
    * "Add To Popup" should be visible
    # Verify that text of dropdown displayed within "Add to" section is "- SELECT -"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    # Click dropdown displayed in "Add to" section
    * I click "Add To Popup > #1 of Dropdowns"
    # Click "Folder" item in displayed dropdown
    * I click "Add To Popup > #1 of Dropdowns >#Folder in Items"
    # Verify that text in First dropdown in "Add to" section is changed to "FOLDER"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    # Click Second dropdown
    * I click "Add To Popup > #2 of Dropdowns"
    # Click item with <Folder1> text in displayed dropdown
    * I click "Add To Popup > #2 of Dropdowns >#<Folder1> in Items"
    # Verify that <Folder1> text is displayed within Second dropdown
    * Text of "Add To Popup > #2 of Dropdowns" should be "<Folder1>" ignoring case
    # Verify that "Folder Name" input field is not displayed
    * "Add To Popup > Folder Name" should not be visible
    # Verify that "Folder Description" input field is not displayed
    * "Add To Popup > Folder Description" should not be visible
    # Click "Save & Close"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header> Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Verify that First item displayed in "Folders" dropdown has <Folder1> text
    * Text of "Header > Folders Dropdown > #1 of Items" should be "<Folder1>"
    # Verify that "3 Items" text is displayed next to First item's title in "Folders" dropdown
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "3 Items" ignoring whitespaces

    Examples:
      | doc1             | Search Term     | Folder1    |
      | 09013e2c82c6f65b | Contract clause | Old Folder |

  @CU-32600
  @logout
  Scenario Outline: Verify that user is able to delete 1 document from folder
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create folder with <Folder1> title and add <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    # Add <doc2> into folder <Folder1>
    * I add "<doc2>" document to "<Folder1>" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Click First item in "Folders" dropdown
    * I click "Header > Folders Dropdown > #1 of Items"
    # Verify that "Folders" popup is displayed
    * "Folder Popup > Folders Dropdown" should be visible
    # Verify that number of items in the currently opened folder is 2
    * Count of "Folder Popup > Items" should be equal to "2"
    # Verify that text of Second item's title is <Title1>
    * Text of "Folder Popup > #2 of Items > Document Title" should be "<Title1>" ignoring case ignoring whitespaces
    # Verify that text of First item's title is <Title2>
    * Text of "Folder Popup > #1 of Items > Document Title" should be "<Title2>" ignoring case ignoring whitespaces
    # Select checkbox next to First item in the list
    * I click "Folder Popup > #1 of Items > Checkbox"
    # Click "Remove From Folder" button
    * I click "Folder Popup > Remove From Folder Button"
    # Click "Confirm" button
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    # Verify that number of items in the folder is now 1
    * Count of "Folder Popup > Items" should be equal to "1"
    # Verify that text of left item's title is <Title1>
    * Text of "Folder Popup > #1 of Items > Document Title" should be "<Title1>" ignoring case ignoring whitespaces

    Examples:
      | doc1                  | doc2                  | Folder1    | Title1                                                                                                   | Title2                                                                                                                                                                                                   |
      | hfl0109013e2c8448c059 | bsa0109013e2c825634d7 | Old Folder | Enacted Law: Employment Practices: Federal Laws, Sec. 3. [29 U.S.C. 206(d)], Equal pay amendment of FLSA | Agency Publication: NASAA Statements of Policy, REGISTRATION OF ASSET-BACKED SECURITIES Adopted October 25, 1995, Amended May 7, 2007; May 6, 2012, North American Securities Administrators Association |

  @CU-32601
  @logout
  Scenario Outline: Verify that user is able to delete folder
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create <Folder1> folder and add <doc1> docinto it
    * I add "<doc1>" document to "<Folder1>" folder
    # Create <Folder2> folder and add <doc2> doc into it
    * I add "<doc2>" document to "<Folder2>" folder
    # Add <doc3> to folder <Folder2>
    * I add "<doc3>" document to "<Folder2>" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    # Verify that there are 2 items in "Folders" dropdown
    * Count of "Header > Folders Dropdown > Items" should be equal to "2"
    # Click First item in "Folders" dropdown
    * I click "Header > Folders Dropdown > #1 of Items"
    # Verify that text in dropdown within "Folders" popup is <Folder1>
    * Text of "Folder Popup > Folders Dropdown > Label" should be "<Folder1>" ignoring case
    # Verify that number of doc items displayed in "Folders" popup is 1
    * Count of "Folder Popup > Items" should be equal to "1"
    # Click "Delete Folder" button
    * I click "Folder Popup > Delete Folder Button"
    # Click "Confirm" button in "Confirmation" popup
    * I click "Confirmation Popup > Confirm Button"
    # Verify that "Confirmation" overlay is not visible
    * "Confirmation Popup" should not be visible
    # Verify that text displayed in dropwdonw within "Folders" is changed to <Folder2>
    * Text of "Folder Popup > Folders Dropdown > Label" should be "<Folder2>" ignoring case
    # Verify that doc items displayed in "Folders" popup is 2
    * Count of "Folder Popup > Items" should be equal to "2"
    # Click "Close" button
    * I click "Folder Popup > Close Button"
    * "Folder Popup" should not be visible
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Verify that only 1 item is displaued in "Folders" dropdown
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Count of "Header > Folders Dropdown > Items" should be equal to "1"

    Examples:
      | Folder1      | doc1             | doc2                               | doc3                               | Folder2       |
      | First Folder | 09013e2c80126a93 | e498c8bc7d571000bfad00505688693903 | 774adbf07cc71000833a90b11c18c90201 | Second Folder |

  @CU-32673
  @logout
  Scenario Outline: Verify that user is able to open document from folder
    * I am logged in as "folderstest1@wk.com" with "password" password
    # Create folder with title <Folder1> and ad  <doc1> into it
    * I add "<doc1>" document to "<Folder1>" folder
    # Click "Folders" item in Header
    * I click "Header > Folders Dropdown"
    # Click First item in "Folders" dropdown
    * I click "Header > Folders Dropdown > #1 of Items"
    # Verify that "Folders" popup is displayed
    * "Folder Popup" should be visible
    # Click First doc item in "Folders" popup
    * I click "Folder Popup > #1 of Items"
    # Verify that doc with title <Title> is opened in Read view
    * Text of "Document Frame > Title" should be "<Title>"

    Examples:
      | Folder1      | doc1             | Title                                  |
      | First Folder | 09013e2c8258b4c8 | Washington,Sec. 7.[TRANSFER OF POWERS] |

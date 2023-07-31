@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegsFolders

  @CU-42196
  @logout
  Scenario Outline: Verify that user is able to add Laws&Regs document to Folder from Read View
    * I am logged in
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents" should be visible
    * I remember text of "#1 of Documents > Document Title" as "title pattern"
    * I open "<doc>" document
    * "Document Frame > Title" should be visible
    * "Document Frame > Document Content" should be visible
    * I click "Toolbar Buttons > Add To Button"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns >#Folder in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    * I click "Add To Popup > #2 of Dropdowns"
    * I click "Add To Popup > #2 of Dropdowns > #1 of Items"
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    * "Add To Popup > Folder Name" should be visible
    * "Add To Popup > Folder Description" should be visible
    * I type "New Folder" in "Add To Popup > Folder Name"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "New Folder"
    * I click "Header > Folders Dropdown > #1 of Items"
    * Text of "Folder Popup > #1 of Items > Document Title" should contain "{$title pattern}"

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | wy-regs-ce7427d473840fadcd650add71d6b17b-v1 |

  @CU-42197
  @logout
  Scenario Outline: Verify that user is able to add Laws&Regs document to Folder from SRL
    * I am logged in
    * I perform search of "<doc>" on Laws & Regulations
    * I click "#1 of Documents > Checkbox"
    * I remember text of "#1 of Documents > Document Title" as "title pattern"
    * I click "Toolbar Buttons > Add To Button"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns >#Folder in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FOLDER"
    * I click "Add To Popup > #2 of Dropdowns"
    * I click "Add To Popup > #2 of Dropdowns > #1 of Items"
    * Text of "Add To Popup > #2 of Dropdowns" should be "CREATE NEW FOLDER"
    * "Add To Popup > Folder Name" should be visible
    * "Add To Popup > Folder Description" should be visible
    * I type "SRL Folder" in "Add To Popup > Folder Name"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * Text of "Header > Folders Dropdown > #1 of Items" should be "SRL Folder"
    * I click "Header > Folders Dropdown > #1 of Items"
    * Text of "Folder Popup > #1 of Items > Document Title" should contain "{$title pattern}"

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | wy-regs-ce7427d473840fadcd650add71d6b17b-v1 |

  @CU-42198
  @logout
  Scenario Outline: Verify that user is able to open Laws&Regs document from Folder
    * I am logged in
    * I add "<doc>" document to "<Folder1>" folder
    * I click "Header > Folders Dropdown"
    * I click "Header > Folders Dropdown > #1 of Items"
    * I click "Folder Popup > #1 of Items"
    * Text of "Document Frame > Title" should be "<title>"

    Examples:
      | Folder1    | doc                                         | title                                                                              |
      | 1st Folder | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | § 1. Words denoting number, gender, and so forth                                   |
      | 1st Folder | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | § 2.1. Purpose                                                                     |
      | 1st Folder | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | § 403. Payment of abandoned property                                               |
      | 1st Folder | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | § 38.350. Claims relating to residential property within common-interest community |

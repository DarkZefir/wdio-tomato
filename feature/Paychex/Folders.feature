@px
@folders
@smoke
Feature: Folders

  @CU-33242
  @logout
  Scenario: [PX] Verify UI of folders dropdown - user has 1 folder
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I add "09013e2c875861e9" document to "CU-33242" folder
    * I add "09013e2c875842b0" document to "CU-33242" folder
    * I click "Header > Folders Dropdown"
    * Text of "Header > Folders Dropdown > #1 of Items" should be "CU-33242" ignoring whitespaces
    * Text of "Header > Folders Dropdown > #1 of Items Count" should be "2 Items" ignoring whitespaces
    * "Header > Folders Dropdown > See All Button" should be visible

  @CU-33243
  @logout
  Scenario Outline: [PX] Verify UI of folders Overlay - user has 1 folder
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I add "<doc1>" document to "<Folder1>" folder
    * I add "<doc2>" document to "<Folder1>" folder
    * I click "Header > Folders Dropdown"
    * I click "Header > Folders Dropdown > See All Button"
    * Text of "Folder Popup > Folders Dropdown" should be "<Folder1>" ignoring case ignoring whitespaces
    * "Folder Popup > Edit Folder Link" should be visible
    * "Folder Popup > Create New Folder Button" should be visible
    * "Folder Popup > Delete Folder Button" should be visible
    * Text of "Folder Popup > Delete Folder Button" should be "Delete Folder" ignoring case
    * "Folder Popup > Toolbar Buttons" should be visible
    * "Folder Popup > Sort Dropdown" should be visible
    * "Folder Popup > Remove From Folder Button" should be visible
    * "Folder Popup > Remove From Folder Button" should not be enabled
    * "Folder Popup > Close Button" should be visible
    * Count of "Folder Popup > Items" should be equal to "2"
    * I click "Folder Popup > Folders Dropdown"
    * Count of "Folder Popup > Folders Dropdown > Links" should be equal to "1"

    Examples:
      | Folder1  | doc1             | doc2             |
      | CU-32543 | 09013e2c843fbd3d | 09013e2c843fbd3e |

@smoke
@mvl @px
@folders
Feature: Folders

  @CU-32496 @CU-33241
  @logout
  Scenario: Verify UI of folders dropdown - user has no folders
    * I am logged in as "folderstest@wk.com" with "password" password
    # Click "Folders" item in "Header"
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > No Folders Notice" should be visible
    # Verify that "You currently have no Folders." notice is displayed under "Folders" item in Header
    * Text of "Header > Folders Dropdown > No Folders Notice" should be "You currently have no Folders." ignoring whitespaces

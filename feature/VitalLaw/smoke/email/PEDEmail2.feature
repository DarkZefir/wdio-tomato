@pedEmail @notParallel
@mvl
@smoke
Feature: Print Email Download

  @CU-41324
  @logout
  Scenario Outline: Email is received when click Quick Email icon from Laws&Regs Read View
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    #Open provided document on Laws&Regs
    * I open "<doc>" document
    * "Document Frame > Document Content > Title" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    #Click Quick Email button in the toolbar
    * I click "Toolbar Buttons > Quick Email Button"
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "history Favorites has sent you research materials" text
    * Receiver of email should contain "vitallaw.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Email has attached file
    * Attached file has "pdf" format

    Examples:
      | doc                                         | type |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | USC  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | CFR  |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | SS   |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | SR   |

  @CU-42200
  @logout
  Scenario Outline: Email is received when click Email button from SRL (comingled)
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    #Perform search of any document with available for email size
    * I perform search of "47bf47e07c4a1000b3c190b11c2ac4f103 or 3d948fbe7c4a1000b00090b11c2ac4f107 or qsc0109013e2c84490e26 or irc0109013e2c83d8fbd4 or db4b88287e09100088f0000d3a8abb4e01"
    * "#1 of Documents" should be visible
    #Select all displayed documents via checkboxes
    * I click "#1 of Documents > Checkbox"
    * I click "#2 of Documents > Checkbox"
    * I click "#3 of Documents > Checkbox"
    * I click "#4 of Documents > Checkbox"
    * I click "#5 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    #Click Email Button in the toolbar
    * "Email Popup" should be visible
    * I wait 1 seconds
    #Open include attachment dropdown
    * I click "Email Popup > Include Dropdown"
    * "Email Popup > Include Dropdown > #1 of Items" should be visible
    #Select appropriate attachment type
    * I click "Email Popup > Include Dropdown > #<attachment> in Items"
    #Open format dropdown
    * I click "Email Popup > Format Dropdown"
    #Select appropriate format type
    * I click "Email Popup > Format Dropdown > #<formatToClick> in Items"
    #Clear subject field and input meaningful text (attachment, format, title)
    * I clear "Email Popup > Email Subject"
    * I type "SRL <attachment> <format> <title>" in "Email Popup > Email Subject"
    #Click email button
    * I click "Email Popup > Email Button"
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "SRL <attachment> <format> <title>" text
    * Receiver of email should contain "vitallaw.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Email has attached file
    * Attached file has "<format>" format

    Examples:
      | attachment         | format | formatToClick | title     |
      | Complete documents | pdf    | PDF           | comingled |
      # |  Complete documents |  rtf   | Word® compatible |comingled| temporary disabled
      | List only          | pdf    | PDF           | comingled |
      # |  List only          |  rtf   | Word® compatible |comingled| temporary disabled

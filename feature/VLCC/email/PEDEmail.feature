@pedEmail @notParallel
@vlcc
@smoke
Feature: Print Email Download

  @deleteEmails
  Scenario: Delete all emails from communication email
    * Delete all emails

  @CU-40915
  @logout
  Scenario Outline: Email is delivered when click Send button on Email popup from Read View (<format>)
    * I am logged in as "emailTestVlcc@wk.com" with "password" password without cleanup
    # Open any document
    * I open "6a7976007db41000ac84000d3a8daaf402" document
    * "DA Title" should be visible
    #Click Email icon in the toolbar
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * I type "VLCC Regular Email| Hello! MESSAGE: AN ANALYSIS OF ANTITRUST PRINCIPLES AND THEIR APPLICATION" in "Email Popup > Email Message"
    #Select document format
    * I click "Email Popup > Format Dropdown"
    * I click "Email Popup > Format Dropdown > #<textToClick> in Items"
    * "Email Popup > Email Button" should be clickable
    #Click Email button
    * I click "Email Popup > Email Button"
    #Verify that email was received
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "emailTest Vlcc has sent you research materials" text
    * Receiver of email should contain "vitallaw1.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Content of email should contain "Hello!" text
    * Email has attached file
    * Attached file has "<format>" format

    Examples:
      | format | textToClick      |
      | pdf    | PDF              |
      | rtf    | Word® compatible |

  @CU-40916
  @logout
  Scenario: Email is delivered when click on Quick Email Button from Read page
    * I am logged in as "emailTestVlcc@wk.com" with "password" password without cleanup
    #Open any document
    * I open "6a7976007db41000ac84000d3a8daaf402" document
    * "DA Title" should be visible
    #Click Quick Email button in the toolbar
    * I click "Toolbar Buttons > Quick Email Button"
    * I wait until email is delivered
    #Verify that email is received and has appropriate subject, attachment and attachment format
    * Subject of email should be equal to "emailTest Vlcc has sent you research materials" text
    * Email has attached file
    * Attached file has "pdf" format

  @CU-40917
  @logout
  Scenario Outline: Email is received when click Email button from SRL (<attachment> <format>)
    * I am logged in as "emailTestVlcc@wk.com" with "password" password without cleanup
    #Perform search of any document with available for email size
    * I perform search of "<doc>"
    * "#1 of Documents" should be visible
    #Select the only displayed document via checkbox
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    #Click Email Button in the toolbar
    * "Email Popup" should be visible
    * I wait 1 seconds
    * "Email Popup > Include Dropdown" should be clickable
    #Open include attachment dropdown
    * I click "Email Popup > Include Dropdown"
    * "Email Popup > Include Dropdown > #1 of Items" should be visible
    #Select appropriate attachment type
    * I click "Email Popup > Include Dropdown > #<attachment> in Items"
    * "Email Popup > Format Dropdown" should be clickable
    #Open format dropdown
    * I click "Email Popup > Format Dropdown"
    #Select appropriate format type
    * I click "Email Popup > Format Dropdown > #<formatToClick> in Items"
    #Clear subject field and input meaningful text (attachment, format, title)
    * I clear "Email Popup > Email Subject"
    * I type "VLCC SRL <attachment> <format> <title>" in "Email Popup > Email Subject"
    #Click email button
    * I click "Email Popup > Email Button"
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "VLCC SRL <attachment> <format> <title>" text
    * Receiver of email should contain "vitallaw1.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Email has attached file
    * Attached file has "<format>" format

    Examples:
      | attachment         | format | formatToClick | doc                                | title                                                                                                              |
      | Complete documents | pdf    | PDF           | 6a7976007db41000ac84000d3a8daaf402 | Antitrust Law: An Analysis of Antitrust Principles and Their Application - Areeda and Hovenkamp, Printable Version |
      # |  Complete documents |  rtf   | Word® compatible | 6a7976007db41000ac84000d3a8daaf402 | Antitrust Law: An Analysis of Antitrust Principles and Their Application - Areeda and Hovenkamp, Printable Version | temporary disabled
      | List only          | pdf    | PDF           | 6a7976007db41000ac84000d3a8daaf402 | Antitrust Law: An Analysis of Antitrust Principles and Their Application - Areeda and Hovenkamp, Printable Version |
      # |  List only          |  rtf   | Word® compatible | 6a7976007db41000ac84000d3a8daaf402 | Antitrust Law: An Analysis of Antitrust Principles and Their Application - Areeda and Hovenkamp, Printable Version | temporary disabled

  @CU-41322
  @logout
  Scenario Outline: Email is received from Laws&Regs Read view
    * I am logged in as "emailTestVlcc@wk.com" with "password" password without cleanup
    #Open provided document on Laws&Regs
    * I open "<doc>" document
    * "Document Frame > Document Content > Title" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    #Click Email button in the toolbar
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * I clear "Email Popup > Email Subject"
    * I type "Read View Laws&Regs <type>" in "Email Popup > Email Subject"
    #Click email button
    * I click "Email Popup > Email Button"
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "Read View Laws&Regs <type>" text
    * Receiver of email should contain "vitallaw1.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Email has attached file
    * Attached file has "pdf" format

    Examples:
      | doc                                         | term     | type |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | meaning  | USC  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | section  | CFR  |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | property | SS   |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | business | SR   |

  @CU-41323
  @logout
  Scenario Outline: Email is received from Laws&Regs SRL
    * I am logged in as "emailTestVlcc@wk.com" with "password" password without cleanup
    #Perform amy search on Laws&Regs
    * I perform search of "<term>" on Laws & Regulations
    * "#1 of Documents" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * I clear "Email Popup > Email Subject"
    * I type "SRL Laws&Regs" in "Email Popup > Email Subject"
    #Click email button
    * I click "Email Popup > Email Button"
    * I wait until email is delivered
    #Verify that email has appropriate subject, message and attachment
    * Subject of email should be equal to "SRL Laws&Regs" text
    * Receiver of email should contain "vitallaw1.qa@gmail.com" text
    * Sender of email should contain "noreply@wolterskluwer.com" text
    * Email has attached file
    * Attached file has "pdf" format

    Examples:
      | term      |
      | camembert |

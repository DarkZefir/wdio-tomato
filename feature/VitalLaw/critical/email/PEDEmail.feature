@pedEmail @notParallel
@mvl
@critical_path
Feature: Print Email Download

  @CU-40918
  @logout
  Scenario: Spooler is delivered for Quick Email from Read page
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    #Open any document that triggers spooler
    * I open "a486d3e67b941000a18f00237dd05a0201" document
    * "DA Title" should be visible
    #Click Quick Email button in the toolbar
    * I click "Toolbar Buttons > Quick Email Button"
    * I wait until "Loading Indicator" is gone
    #Confirm Spooler
    * "Spooler Confirmation Popup" should be visible
    * I click "Spooler Confirmation Popup > OK Button"
    * I wait until email is delivered
    #Verify that email is received and has appropriate subject
    * Subject of email should contain "Available for download" text

  @CU-40919
  @logout
  Scenario Outline: Spooler is delivered for Print/Email/Download from Read page
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    #Open any document that triggers spooler
    * I open "a486d3e67b941000a18f00237dd05a0201" document
    * "DA Title" should be visible
    #Click Quick Email button in the toolbar
    * I click "Toolbar Buttons > <toolbarButton>"
    * I wait until "Loading Indicator" is gone
    * "<popup>" should be visible
    * "<popup> > Content Tree" should be visible
    * "<popup> > <sendButton>" should be clickable
    * I click "<popup> > <sendButton>"
    #Confirm Spooler
    * "Spooler Confirmation Popup" should be visible
    * I click "Spooler Confirmation Popup > OK Button"
    * I wait until email is delivered
    #Verify that email is received and has appropriate subject
    * Subject of email should contain "Available for download" text

    Examples:
      | toolbarButton   | popup          | sendButton      |
      | Email Button    | Email Popup    | Email Button    |
      | Print Button    | Print Popup    | Print Button    |
      | Download Button | Download Popup | Download Button |

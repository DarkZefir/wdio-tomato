@critical_path
@mvl
Feature: PED 6

  @CU-32679
  Scenario: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in Utility bar of 'Folders' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to "CU-32679" folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown >#CU-32679 in Items"
    * "Folder Popup" should be visible
    * I click "Folder Popup > #1 of Items > Checkbox"
    * I click "Folder Popup > Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * Text of "Print Popup > Title" should be "PRINT"
    * "Print Popup > Include Label" should be visible
    * Text of "Print Popup > Include Label" should be "Include"
    * "Print Popup > Include Dropdown" should be visible
    * Text of "Print Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    * "Print Popup > Options Label" should be visible
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Checkbox" should be selected
    * "Print Popup > Include Notes And Highlights Label" should be visible
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > X Close Button" should be visible
    * "Print Popup > X Close Button" should be enabled
    * "Print Popup > Cancel Button" should be visible
    * Text of "Print Popup > Cancel Button" should be "CANCEL"
    * "Print Popup > Cancel Button" should be enabled
    * "Print Popup > Print Button" should be visible
    * Text of "Print Popup > Print Button" should be "PRINT"
    * "Print Popup > Print Button" should be enabled
    * I click "Print Popup > X Close Button"
    * "Print Popup" should not be visible

  @CU-32680
  Scenario: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in Utility bar of 'Folders' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to "CU-32680" folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-32680 in Items"
    * "Folder Popup" should be visible
    * I click "Folder Popup > #1 of Items > Checkbox"
    * I click "Folder Popup > Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * "Email Popup > Email Subject Label" should be visible
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Include Attachment Label" should be visible
    * Text of "Email Popup > Include Attachment Label" should be "Include Attachment"
    * "Email Popup > Include Dropdown" should be visible
    * Text of "Email Popup > Include Dropdown > Label" should be "COMPLETE DOCUMENTS"
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should be visible
    * Text of "Email Popup > Options Label" should be "Options"
    * "Email Popup > Include Notes And Highlights Label" should be visible
    * Text of "Email Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Email Popup > Include Notes And Highlights Checkbox" should be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should be selected
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > Cancel Button"
    * "Email Popup" should not be visible

  @CU-32681
  Scenario: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar of 'Folders' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to "CU-32681" folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-32681 in Items"
    * "Folder Popup" should be visible
    * I click "Folder Popup > #1 of Items > Checkbox"
    * I click "Folder Popup > Toolbar Buttons > Download Button"
    * "Download Popup" should be visible
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * "Download Popup > Include Label" should be visible
    * Text of "Download Popup > Include Label" should be "Include"
    * "Download Popup > Include Dropdown" should be visible
    * Text of "Download Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    * "Download Popup > Format Label" should be visible
    * Text of "Download Popup > Format Label" should be "Format"
    * "Download Popup > Format Dropdown" should be visible
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    * "Download Popup > Options Label" should be visible
    * Text of "Download Popup > Options Label" should be "Options"
    * "Download Popup > Include Notes And Highlights Checkbox" should be visible
    * "Download Popup > Include Notes And Highlights Checkbox" should be selected
    * "Download Popup > Include Notes And Highlights Label" should be visible
    * Text of "Download Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Download Popup > X Close Button" should be visible
    * "Download Popup > X Close Button" should be enabled
    * "Download Popup > Cancel Button" should be visible
    * Text of "Download Popup > Cancel Button" should be "CANCEL"
    * "Download Popup > Cancel Button" should be enabled
    * "Download Popup > Download Button" should be visible
    * Text of "Download Popup > Download Button" should be "DOWNLOAD"
    * "Download Popup > Download Button" should be enabled
    * I click "Download Popup > X Close Button"
    * "Download Popup" should not be visible

  @CU-42096
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from L&R read view for print/email/download
    * I am logged in
    # Open L&R document
    * I open "<docId>" document
    * "Show Metadata" should be visible
    # Click Print/Email/Download button
    * I click "Toolbar Buttons > <button> Button"
    * "<button> Popup > Loading Indicator" should not be visible
    # Select all nodes/first node
    * I click "<button> Popup > Content Tree > #1 of <click>"
    * I wait 3 seconds
    # Click Print/Email/Download button
    * I click "<button> Popup > <button> Button"
    * "Notice Popup" should be visible
    # Title of notice pop up should be "NOTICE"
    * Text of "Notice Popup > Notice Title" should be "NOTICE"
    # Notice popup should have text: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Notice Popup > Notice Message" should contain "You have selected"
    * Text of "Notice Popup > Notice Message" should contain "<docCount> documents. Please select no more than 100 documents."
    * "Notice Popup > Close Button" should be clickable
    # Close notice popup
    * I click "Notice Popup > Close Button"
    # There should be message in red: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "<button> Popup > #1 of Error Messages" should contain "You have selected"
    * Text of "<button> Popup > #1 of Error Messages" should contain "<docCount> documents. Please select no more than 100 documents."
    Examples:
      | button   | docId                                       | docCount       | click                                      |
      | Print    | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 | more than 1000 | All Content Nodes In Tree Nodes Checkboxes |
      | Print    | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 |                | Level 1 Content Tree Nodes Checkboxes      |
      | Email    | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 | more than 1000 | All Content Nodes In Tree Nodes Checkboxes |
      | Email    | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 |                | Level 1 Content Tree Nodes Checkboxes      |
      | Download | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 | more than 1000 | All Content Nodes In Tree Nodes Checkboxes |
      | Download | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 |                | Level 1 Content Tree Nodes Checkboxes      |
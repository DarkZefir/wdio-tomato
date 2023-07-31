@critical_path
@mvl
Feature: PED 7

  @CU-32630
  Scenario: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in Utility bar of 'Favorites' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to favorites
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Print Button"
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

  @CU-32632
  Scenario: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in Utility bar of 'Favorites' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to favorites
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Email Button"
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
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-32633
  Scenario: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar of 'Favorites' overlay
    * I am logged in
    * I add "fed01313ba5c87b681000bfff001b78be8c78049" document to favorites
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Toolbar Buttons > Download Button"
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

  @CU-32182
  @local
  Scenario: Verify that spooler is initiated for a single document when user clicks on 'Quick Print' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Quick Print Button" should be clickable
    * I click "Toolbar Buttons > Quick Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "The content you have selected is too large to print immediately. You will be notified via email when the output is available for print."
    * "Notice Popup > OK Button" should be visible
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > OK Button" should be enabled
    * "Notice Popup > Cancel Button" should be visible
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > Cancel Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
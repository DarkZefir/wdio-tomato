@smoke
@mvl
@ped
Feature: Print Email Download

  @CU-32056
  Scenario: Verify UI of 'Print' overlay opened by click on 'Print' icon in Utility bar on Search Results List
    * I am logged in
    * I perform search of "quality assurance"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * Text of "Print Popup > Title" should be "PRINT"
    * "Print Popup > Include Label" should be visible
    * Text of "Print Popup > Include Label" should be "Include"
    * Text of "Print Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Label" should be visible
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > X Close Button" should be visible
    * Text of "Print Popup > Cancel Button" should be "CANCEL"
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Cancel Button" should be enabled
    * Text of "Print Popup > Print Button" should be "PRINT"
    * I click "Print Popup > X Close Button"
    * "Print Popup" should not be visible

  @CU-32061
  Scenario: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in Utility bar on Search Results List
    * I am logged in
    * I perform search of "taxation"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * Text of "Email Popup > Include Attachment Label" should be "Include Attachment"
    * Text of "Email Popup > Include Dropdown > Label" should be "COMPLETE DOCUMENTS"
    * Text of "Email Popup > Format Label" should be "Format"
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * Text of "Email Popup > Options Label" should be "Options"
    * "Email Popup > Include Notes And Highlights Label" should be visible
    * Text of "Email Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Email Popup > Include Notes And Highlights Checkbox" should be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should be enabled
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Cancel Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-32069
  Scenario: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar on Search Results List
    * I am logged in
    * I perform search of "Verification Organizations"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Download Button"
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * Text of "Download Popup > Include Label" should be "Include"
    * Text of "Download Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    * Text of "Download Popup > Format Label" should be "Format"
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    * Text of "Download Popup > Options Label" should be "Options"
    * "Download Popup > Include Notes And Highlights Checkbox" should be visible
    * "Download Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Download Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Download Popup > X Close Button" should be enabled
    * Text of "Download Popup > Cancel Button" should be "CANCEL"
    * "Download Popup > Cancel Button" should be enabled
    * Text of "Download Popup > Download Button" should be "DOWNLOAD"
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be enabled
    * I click "Download Popup > X Close Button"
    * "Download Popup" should not be visible

  @CU-31978
  Scenario: Verify that on click on 'Quick Email' icon in Utility bar for document opened from Search result List 'Email has been sent.' overlay is displayed
    * I am logged in
    * I open "024172747d941000b357005056881d2303" document
    * I click "Toolbar Buttons > Quick Email Button"
    * Text of "Blank Info Popup" should be "Email has been sent."
    * I click "Blank Info Popup > X Close Button"
    * "Blank Info Popup" should not be visible

  @CU-32104
  Scenario: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "db4b88287e09100088f0000d3a8abb4e01"
    * I click "#1 of Documents"
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I click "Toolbar Buttons > Print Button"
    * Text of "Print Popup > Title" should be "PRINT"
    * Text of "Print Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > Include Search Term Highlights Checkbox" should be visible
    * "Print Popup > Include Search Term Highlights Checkbox" should not be selected
    * Text of "Print Popup > Include Search Term Highlights Label" should be "Include search term highlights"
    * "Print Popup > Content Tree" should be visible
    * "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * "Print Popup > X Close Button" should be visible
    * "Print Popup > X Close Button" should be enabled
    * Text of "Print Popup > Cancel Button" should be "CANCEL"
    * "Print Popup > Cancel Button" should be enabled
    * Text of "Print Popup > Print Button" should be "PRINT"
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Print Button" should be visible
    * "Print Popup > Print Button" should be enabled
    * I click "Print Popup > X Close Button"
    * "Print Popup" should not be visible

  @CU-32180
  Scenario: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "db4b88287e09100088f0000d3a8abb4e01"
    * I click "#1 of Documents"
    * "DA Title" should be visible
    * "Document Loading Indicator" should not be visible
    * I remember text of "DA Title" as "DATitle"
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup > Title" should be visible
    * Text of "Email Popup > Title" should be "EMAIL"
    * Text of "Email Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * Text of "Email Popup > Format Label" should be "Format"
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * Text of "Email Popup > Options Label" should be "Options"
    * Text of "Email Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Email Popup > Include Notes And Highlights Checkbox" should be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should be selected
    * "Email Popup > Include Search Term Highlights Checkbox" should be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should not be selected
    * Text of "Email Popup > Include Search Term Highlights Label" should be "Include search term highlights"
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Email Button" should be enabled
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Cancel Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-32181
  Scenario: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "db4b88287e09100088f0000d3a8abb4e01"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * "Toolbar Buttons > Download Button" should be visible
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup" should be visible
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * Text of "Download Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Download Popup > Format Label" should be "Format"
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    * Text of "Download Popup > Options Label" should be "Options"
    * "Download Popup > Include Notes And Highlights Checkbox" should be visible
    * "Download Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Download Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Download Popup > Include Search Term Highlights Checkbox" should be visible
    * "Download Popup > Include Search Term Highlights Checkbox" should not be selected
    * Text of "Download Popup > Include Search Term Highlights Label" should be "Include search term highlights"
    * "Download Popup > X Close Button" should be visible
    * "Download Popup > X Close Button" should be enabled
    * Text of "Download Popup > Cancel Button" should be "CANCEL"
    * "Download Popup > Cancel Button" should be enabled
    * Text of "Download Popup > Download Button" should be "DOWNLOAD"
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be enabled
    * I click "Download Popup > X Close Button"
    * "Download Popup" should not be visible

  @CU-32268
  Scenario: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in Utility bar on document's Read view opened from dashboard
    * I am logged in
    * I open "11BB17F48BF57A12B1CAA691B568D4A40" document
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I click "Toolbar Buttons > Print Button"
    * Text of "Print Popup > Title" should be "PRINT"
    * Text of "Print Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > Content Tree" should be visible
    * "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * "Print Popup > X Close Button" should be visible
    * "Print Popup > X Close Button" should be enabled
    * Text of "Print Popup > Cancel Button" should be "CANCEL"
    * "Print Popup > Cancel Button" should be enabled
    * Text of "Print Popup > Print Button" should be "PRINT"
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Print Button" should be enabled
    * I click "Print Popup > X Close Button"
    * "Print Popup" should not be visible

  @CU-32273
  Scenario: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in Utility bar on document's Read view opened from dashboard
    * I am logged in
    * I open "11BB17F48BF57A12B1CAA691B568D4A40" document
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I click "Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * Text of "Email Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * Text of "Email Popup > Format Label" should be "Format"
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * Text of "Email Popup > Options Label" should be "Options"
    * Text of "Email Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Email Popup > Include Notes And Highlights Checkbox" should be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should be selected
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should be enabled
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Cancel Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-32274
  Scenario: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar on document's Read view opened from dashboard
    * I am logged in
    * I open "11BB17F48BF57A12B1CAA691B568D4A40" document
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I click "Toolbar Buttons > Download Button"
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * Text of "Download Popup > Document Title" should be "{$DATitle}" ignoring case
    * Text of "Download Popup > Format Label" should be "Format"
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    * Text of "Download Popup > Options Label" should be "Options"
    * "Download Popup > Include Notes And Highlights Checkbox" should be visible
    * "Download Popup > Include Notes And Highlights Checkbox" should be selected
    * Text of "Download Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Download Popup > X Close Button" should be visible
    * "Download Popup > X Close Button" should be enabled
    * Text of "Download Popup > Cancel Button" should be "CANCEL"
    * "Download Popup > Cancel Button" should be enabled
    * Text of "Download Popup > Download Button" should be "DOWNLOAD"
    * "Download Popup > LoadingIndicator" should not be visible
    * "Download Popup > Download Button" should be enabled
    * I click "Download Popup > X Close Button"
    * "Download Popup" should not be visible

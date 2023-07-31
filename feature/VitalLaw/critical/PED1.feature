@critical_path
@mvl
Feature: Print Email Download 1

  @CU-32371
  Scenario Outline: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in TOC hover over menu for document opened from dashboard
    * I am logged in
    * I open "09013e2c82922a91" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Print" using JS
    * "Print Popup" should be visible
    * "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait 2 seconds
    * Text of "Print Popup > Title" should be "PRINT"
    * "Print Popup > Document Title" should be visible
    * Text of "Print Popup > Document Title" should be "{$DATitle}" ignoring case
    * "Print Popup > Options Label" should be visible
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Checkbox" should be selected
    * "Print Popup > Include Notes And Highlights Label" should be visible
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > Content Tree" should be visible
    * "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
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

    Examples:
      | element                                                         |
      | Contents Tab > Selected Link > Link                             |
      | Contents Tab > #1 of Expanded Parent Node > Path Header > Label |

  @CU-32373
  Scenario Outline: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in TOC hover over menu for document opened from dashboard
    * I am logged in
    * I open "09013e2c82922a91" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Email" using JS
    * "Email Popup" should be visible
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Document Title" should be visible
    * Text of "Email Popup > Document Title" should be "{$DATitle}" ignoring case
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
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
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
    Examples:
      | element                                                         |
      | Contents Tab > Selected Link > Link                             |
      | Contents Tab > #1 of Expanded Parent Node > Path Header > Label |

  @CU-32374
  Scenario Outline: Verify that 'Download' overlay opened after user clicks on 'Download' icon in TOC hover over menu for document opened from dashboard
    * I am logged in
    * I open "09013e2c82922a91" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Download" using JS
    * "Download Popup" should be visible
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * "Download Popup > Document Title" should be visible
    * Text of "Download Popup > Document Title" should be "{$DATitle}" ignoring case
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
    * "Download Popup > Download Button" should be clickable
    * "Download Popup > Download Button" should be visible
    * Text of "Download Popup > Download Button" should be "DOWNLOAD"
    * "Download Popup > Download Button" should be enabled
    * I click "Download Popup > X Close Button"
    * "Download Popup" should not be visible

    Examples:
      | element                                                         |
      | Contents Tab > Selected Link > Link                             |
      | Contents Tab > #1 of Expanded Parent Node > Path Header > Label |

  @CU-32377
  Scenario: Verify that spooler is initiated after user clicks on 'Quick Print' icon in TOC hover over menu when publication is opened form dashboard
    * I am logged in
    * I open "mkl0509013e2c84b1b9df" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Quick Print" using JS
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

  @CU-32378
  Scenario: Verify that spooler is initiated after user clicks on 'Quick Email' icon in TOC hover over menu when publication is opened form dashboard
    * I am logged in
    * I open "mkl0509013e2c84b1b9df" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Quick Email" using JS
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to email immediately. Recipient will be notified via email when the output is available for download. Any subject or message text entered here will not be included."
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

  @CU-32382
  Scenario: Verify that spooler is initiated after user clicks on 'Print' icon in TOC hover over menu when publication is opened form dashboard
    * I am logged in
    * I open "mkl0509013e2c84b1b9df" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Print" using JS
    * "Print Popup" should be visible
    * "Print Popup > Loading Indicator" should not be visible
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "The content you have selected is too large to print immediately. You will be notified via email when the output is available for print."
    * "Notice Popup > Cancel Button" should be visible
    * "Notice Popup > Cancel Button" should be enabled
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > OK Button" should be visible
    * "Notice Popup > OK Button" should be enabled
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Cancel Button"
    * "Notice Popup" should not be visible
    * Text of "Print Popup > #1 of Error Messages" should be "Your selection is too large to print immediately. You will be notified via email when output is available."
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Print Popup" should not be visible

  @CU-32383
  Scenario: Verify that spooler is initiated after user clicks on 'Email' icon in TOC hover over menu when publication is opened form dashboard
    * I am logged in
    * I open "mkl0509013e2c84b1b9df" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * I click "Contents Tab > Menu Container > Email" using JS
    * "Email Popup" should be visible
    * "Email Popup > Loading Indicator" should not be visible
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to email immediately. Recipient will be notified via email when the output is available for download. Any subject or message text entered here will not be included."
    * "Notice Popup > Cancel Button" should be visible
    * "Notice Popup > Cancel Button" should be enabled
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > OK Button" should be visible
    * "Notice Popup > OK Button" should be enabled
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Cancel Button"
    * "Notice Popup" should not be visible
    * Text of "Email Popup > #1 of Error Messages" should be "Your selection is too large to email immediately. Recipient will be notified via email when output is available. Any subject or message text entered here will not be included."
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Email Popup" should not be visible

  @CU-40312
  Scenario Outline: Verify UI of 'Email' overlay opened after click on 'Email' icon in SRL for Laws&Regulations
    * I am logged in
    * I perform search of "<term>" on Laws & Regulations
    * "Toolbar Buttons > Email Button" should be visible
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * "Email Popup > Loading Indicator" should not be visible
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
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
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

    Examples:
      | term                 |
      | Law Revision Council |
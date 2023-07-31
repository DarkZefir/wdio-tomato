@critical_path
@mvl
Feature: PED 5

  @CU-32384
  Scenario: Verify that spooler is initiated after user clicks on 'Download' icon in TOC hover over menu when publication is opened form dashboard
    * I am logged in
    * I open "mkl0509013e2c84b1b9df" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * I click "Contents Tab > Menu Container > Download" using JS
    * "Download Popup > Loading Indicator" should not be visible
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "The content you have selected is too large to download immediately. You will be notified via email when the output is available for download."
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
    * Text of "Download Popup > #1 of Error Messages" should be "Your selection is too large to download immediately. You will be notified via email when output is available."
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Download Popup" should not be visible

  @CU-32397
  Scenario: Verify that when user tries to Quick Print too large selection trough TOC hover over menu for document opened from dashboard, corespondent overlay is displayed
    * I am logged in
    * I open "09013e2c8487183f" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Quick Print" should be visible
    * I click "Contents Tab > Menu Container > Quick Print" using JS
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to print."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible

  @CU-32398
  Scenario: Verify that when user tries to Quick Email too large selection trough TOC hover over menu for document opened from dashboard, corespondent overlay is displayed
    * I am logged in
    * I open "09013e2c8487183f" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Quick Email" should be visible
    * I click "Contents Tab > Menu Container > Quick Email" using JS
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to email."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible

  @CU-32399
  Scenario: Verify that when user tries to Print too large selection trough TOC hover over menu for document opened from dashboard, corespondent overlay is displayed
    * I am logged in
    * I open "09013e2c8487183f" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Print" using JS
    * "Print Popup > Loading Indicator" should not be visible
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to print."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Print Popup > #1 of Error Messages" should be "Your selection is too large to print."
    * I click "Print Popup > Cancel Button"
    * "Print Popup" should not be visible

  @CU-32401
  Scenario: Verify that when user tries to Email too large selection trough TOC hover over menu for document opened from dashboard, corespondent overlay is displayed
    * I am logged in
    * I open "09013e2c8487183f" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Email" using JS
    * "Email Popup > Loading Indicator" should not be visible
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to email. You may try downloading the selection."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Email Popup > #1 of Error Messages" should be "Your selection is too large to email."
    * I click "Email Popup > Cancel Button"
    * "Email Popup" should not be visible

  @CU-32423
  @local
  Scenario Outline: Verify UI of 'Print' overlay opened after user clicks on 'Print' icon in TOC hover over menu for document opened from Search Results List
    * I am logged in
    * I perform search of "09013e2c8446972e"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Print" should be visible
    * I click "Contents Tab > Menu Container > Print" using JS
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Content Tree > #1 of Selected Content Tree Nodes" should be visible
    * Text of "Print Popup > Title" should be "PRINT"
    * "Print Popup > Document Title" should be visible
    * Text of "Print Popup > Document Title" should be "{$DATitle}" ignoring case
    * "Print Popup > Options Label" should be visible
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Notes And Highlights Checkbox" should be visible
    * "Print Popup > Include Notes And Highlights Checkbox" should be selected
    * "Print Popup > Include Notes And Highlights Label" should be visible
    * Text of "Print Popup > Include Notes And Highlights Label" should be "Include notes & highlights"
    * "Print Popup > Include Search Term Highlights Checkbox" should be visible
    * "Print Popup > Include Search Term Highlights Checkbox" should not be selected
    * "Print Popup > Include Search Term Highlights Label" should be visible
    * Text of "Print Popup > Include Search Term Highlights Label" should be "Include search term highlights"
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
      | element                                                               |
      | Contents Tab > Selected Link > Link                                   |
      | Contents Tab > #1 of Expanded Second Child Node > Path Header > Label |

  @CU-40307
  Scenario Outline: Verify UI of 'Email' overlay opened after click on 'Email' icon in Read View for Laws&Regulations
    * I am logged in
    * I open "<doc>" document
    * "Document Frame > Title" should be visible
    * "Toolbar Buttons > Email Button" should be visible
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
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |
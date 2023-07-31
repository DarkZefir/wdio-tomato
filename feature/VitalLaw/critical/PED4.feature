@critical_path
@mvl
Feature: PED 4

  @CU-32424
  @local
  Scenario Outline: Verify UI of 'Email' overlay opened after user clicks on 'Email' icon in TOC hover over menu for document opened from Search Results List
    * I am logged in
    * I perform search of "09013e2c8446972e"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * I click "Contents Tab > Menu Container > Email" using JS
    * "Email Popup > Loading Indicator" should not be visible
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
    * "Email Popup > Include Search Term Highlights Checkbox" should be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should not be selected
    * "Email Popup > Include Search Term Highlights Label" should be visible
    * Text of "Email Popup > Include Search Term Highlights Label" should be "Include search term highlights"
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
      | element                                                               |
      | Contents Tab > Selected Link > Link                                   |
      | Contents Tab > #1 of Expanded Second Child Node > Path Header > Label |

  @CU-32425
  @local
  Scenario Outline: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in TOC hover over menu for document opened from Search Results List
    * I am logged in
    * I perform search of "09013e2c8446972e"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "<element>" should be visible
    * I remember text of "DA Title" as "DATitle"
    * I move mouse over "<element>"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * I click "Contents Tab > Menu Container > Download" using JS
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be clickable
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
    * "Download Popup > Include Search Term Highlights Checkbox" should be visible
    * "Download Popup > Include Search Term Highlights Checkbox" should not be selected
    * "Download Popup > Include Search Term Highlights Label" should be visible
    * Text of "Download Popup > Include Search Term Highlights Label" should be "Include search term highlights"
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
    Examples:
      | element                                                               |
      | Contents Tab > Selected Link > Link                                   |
      | Contents Tab > #1 of Expanded Second Child Node > Path Header > Label |

  @CU-32462
  @local
  Scenario: Verify that spooler is initiated for a single document opened from Search Result List when user clicks on 'Quick Print' icon in TOC hover over menu
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link > Link" should be visible
    * I move mouse over "Contents Tab > Selected Link > Link"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Quick Print" should be visible
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

  @CU-32463
  @local
  Scenario: Verify that spooler is initiated for a single document opened from Search Result List when user clicks on 'Quick Email' icon in TOC hover over menu
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link > Link" should be visible
    * I move mouse over "Contents Tab > Selected Link > Link"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Quick Email" should be visible
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

  @CU-32467
  @local
  Scenario: Verify that spooler is initiated for a single document opened from Search Result List when user tries to Print it through TOC hover over menu
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link > Link" should be visible
    * I move mouse over "Contents Tab > Selected Link > Link"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Print" should be visible
    * I click "Contents Tab > Menu Container > Print" using JS
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Print Button" should be clickable
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

  @CU-32469
  @local
  Scenario: Verify that spooler is initiated for a single document opened from Search Result List when user tries to Email it through TOC hover over menu
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link > Link" should be visible
    * I move mouse over "Contents Tab > Selected Link > Link"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * I click "Contents Tab > Menu Container > Email" using JS
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Content Tree > #1 of Selected Content Tree Nodes" should be visible
    * I wait until "Loading Indicator" is gone
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

  @CU-32474
  @local
  Scenario: Verify that spooler is initiated for a single document opened from Search Result List when user tries to Download it through TOC hover over menu
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link > Link" should be visible
    * I move mouse over "Contents Tab > Selected Link > Link"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * I click "Contents Tab > Menu Container > Download" using JS
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be clickable
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

  @CU-32402
  Scenario: Verify that when user tries to Download too large selection trough TOC hover over menu for document opened from dashboard, corespondent overlay is displayed
    * I am logged in
    * I open "09013e2c8487183f" document
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * I click "Contents Tab > Menu Container > Download" using JS
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be clickable
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to download."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Download Popup > #1 of Error Messages" should be "Your selection is too large to download."
    * I click "Download Popup > Cancel Button"
    * "Download Popup" should not be visible

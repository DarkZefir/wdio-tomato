@critical_path
@mvl
Feature: PED 3

  @CU-32183
  @local
  Scenario: Verify that spooler is initiated for a single document when user clicks on 'Quick Email ' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Document Loading Indicator" should not be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * I click "Toolbar Buttons > Quick Email Button"
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

  @CU-32198
  @local
  Scenario: Verify that spooler is initiated for a single document when user clicks on 'Print' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Print Button" should be visible
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
    * I click "Print Popup > Print Button"
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
    * I click "Notice Popup > X Close Button"
    * "Notice Popup" should not be visible
    * Text of "Print Popup > #1 of Error Messages" should be "Your selection is too large to print immediately. You will be notified via email when output is available."
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Print Popup" should not be visible

  @CU-32199
  @local
  Scenario: Verify that spooler is initiated for a single document when user clicks on 'Email' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup > Loading Indicator" should not be visible
    * I click "Email Popup > Email Button"
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
    * I click "Notice Popup > X Close Button"
    * "Notice Popup" should not be visible
    * Text of "Email Popup > #1 of Error Messages" should be "Your selection is too large to email immediately. Recipient will be notified via email when output is available. Any subject or message text entered here will not be included."
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Email Popup" should not be visible

  @CU-32200
  @local
  Scenario: Verify that spooler is initiated for a single document when user clicks on 'Download' icon in Utility bar on document's Read view opened from Search Result List
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Download Button" should be visible
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "The content you have selected is too large to download immediately. You will be notified via email when the output is available for download."
    * "Notice Popup > OK Button" should be visible
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > OK Button" should be enabled
    * "Notice Popup > Cancel Button" should be visible
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > Cancel Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > X Close Button"
    * "Notice Popup" should not be visible
    * Text of "Download Popup > #1 of Error Messages" should be "Your selection is too large to download immediately. You will be notified via email when output is available."
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * I click "Notice Popup > OK Button"
    * "Notice Popup" should not be visible
    * "Download Popup" should not be visible

  @CU-32201
  @local
  Scenario: Verify that if selection of documents made in 'Print' overlay reached from Utility bar in doc's Read view opened from SRL is too large, correspondent overlay is displayed
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Print Button" should be visible
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup > Loading Indicator" should not be visible
    * I click "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to print."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Print Popup > #1 of Error Messages" should be "Your selection is too large to print."
    * I click "Print Popup > Cancel Button"
    * "Print Popup" should not be visible

  @CU-32202
  Scenario: Verify that if selection of documents made in 'Email' overlay reached from Utility bar in doc's Read view opened from SRL is too large, correspondent overlay is displayed
    * I am logged in
    * I perform search of "09013e2c8415de83"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup > Loading Indicator" should not be visible
    * I click "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to email. You may try downloading the selection."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Email Popup > #1 of Error Messages" should be "Your selection is too large to email."
    * I click "Email Popup > Cancel Button"
    * "Email Popup" should not be visible

  @CU-32203
  Scenario: Verify that if selection of documents made in 'Download' overlay reached from Utility bar in doc's Read view opened from SRL is too large, correspondent overlay is displayed
    * I am logged in
    * I perform search of "09013e2c8415de83"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Download Button" should be visible
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * I click "Download Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "Your selection is too large to download."
    * "Notice Popup > Close Button" should be visible
    * Text of "Notice Popup > Close Button" should be "CLOSE"
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * Text of "Download Popup > #1 of Error Messages" should be "Your selection is too large to download."
    * I click "Download Popup > Cancel Button"
    * "Download Popup" should not be visible

  @CU-32275
  Scenario: Verify that spooler is initiated when user makes correspondent selection in 'Print' overlay opened from Utility bar on doc's Read view reached from dashboard
    * I am logged in
    * I open "stb012186d9227d7f1000b3d3005056885db602" document
    * "Toolbar Buttons > Print Button" should be visible
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup > Loading Indicator" should not be visible
    * I click "Print Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
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

  @CU-32285
  Scenario: Verify that spooler is initiated when user makes correspondent selection in 'Email' overlay opened from Utility bar on doc's Read view reached from dashboard
    * I am logged in
    * I open "stb012186d9227d7f1000b3d3005056885db602" document
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
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

  @CU-32294
  Scenario: Verify that spooler is initiated when user makes correspondent selection in 'Download' overlay opened from Utility bar on doc's Read view reached from dashboard
    * I am logged in
    * I open "09013e2c8255e64f" document
    * "Toolbar Buttons > Download Button" should be visible
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * I click "Download Popup > Content Tree > #1 of All Content Nodes In Tree Nodes Checkboxes"
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

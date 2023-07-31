@critical_path
@mvl
Feature: PED 8

  @CU-32623
  Scenario Outline: Verify UI of 'Print' overlay opened after click on 'Print' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I perform search of "case"
    * I click "#2 of Filter Groups > #<Filter> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * "Tax Topic Page > Toolbar Buttons > Print Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * Text of "Print Popup > Title" should be "PRINT"
    * "Print Popup > Options Label" should be visible
    * Text of "Print Popup > Options Label" should be "Options"
    * "Print Popup > Include Search Term Highlights Checkbox" should be visible
    * "Print Popup > Include Search Term Highlights Checkbox" should not be selected
    * "Print Popup > Include Search Term Highlights Label" should be visible
    * Text of "Print Popup > Include Search Term Highlights Label" should be "Include search term highlights"
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
      | Filter               |
      | Federal Topics       |
      | State Topics         |
      | International Topics |

  @CU-32624
  Scenario Outline: Verify UI of 'Email' overlay opened after click on 'Email' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I perform search of "case"
    * I click "#2 of Filter Groups > #<Filter> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * "Tax Topic Page > Toolbar Buttons > Email Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Email Button"
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
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should be visible
    * Text of "Email Popup > Options Label" should be "Options"
    * "Email Popup > Include Search Term Highlights Checkbox" should be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should not be selected
    * "Email Popup > Include Search Term Highlights Label" should be visible
    * Text of "Email Popup > Include Search Term Highlights Label" should be "Include search term highlights"
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
      | Filter               |
      | Federal Topics       |
      | State Topics         |
      | International Topics |

  @CU-32625
  Scenario Outline: Verify UI of 'Download' overlay opened after user clicks on 'Download' icon in Utility bar of TLP's Read view opened from Search results List
    * I am logged in
    * I perform search of "case"
    * I click "#2 of Filter Groups > #<Filter> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * "Tax Topic Page > Toolbar Buttons > Download Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Download Button"
    * "Download Popup" should be visible
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * "Download Popup > Format Label" should be visible
    * Text of "Download Popup > Format Label" should be "Format"
    * "Download Popup > Format Dropdown" should be visible
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    * "Download Popup > Options Label" should be visible
    * Text of "Download Popup > Options Label" should be "Options"
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
      | Filter               |
      | Federal Topics       |
      | State Topics         |
      | International Topics |

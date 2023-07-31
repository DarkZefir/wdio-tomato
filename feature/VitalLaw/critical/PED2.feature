@critical_path
@mvl
Feature: Print Email Download 2

  @CU-32613
  Scenario Outline: Verify UI of 'Print' overlay opened after click on 'Print' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I open base url with "<url>"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Toolbar Buttons > Print Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * Text of "Print Popup > Title" should be "PRINT"
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
      | url                                                               |
      | #/topics/TaxFederal/tppc01242f6da47c691000b72990b11c2ac4f106      |
      | #/topics/TaxStateAndLocal/tes01b4552fec7c6c1000942cd8d385ad169402 |
      | #/topics/TaxInternational/eb0285007cb5100082fad8d385ad16940e      |

  @CU-32615
  Scenario Outline: Verify UI of 'Email' overlay opened after click on 'Email' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I open base url with "<url>"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Toolbar Buttons > Email Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Email Button"
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
      | url                                                               |
      | #/topics/TaxFederal/tppc01864f589e7c6610009eaf90b11c18c90202      |
      | #/topics/TaxStateAndLocal/tes01c327ee367d681000a7d6005056881d2303 |
      | #/topics/TaxInternational/eb0284927cb51000a364d8d385ad169403      |

  @CU-32617
  Scenario Outline: Verify UI of 'Download' overlay opened after click on 'Download' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I open base url with "<url>"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Toolbar Buttons > Download Button" should be visible
    * I click "Tax Topic Page > Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    * "Download Popup > Format Label" should be visible
    * Text of "Download Popup > Format Label" should be "Format"
    * "Download Popup > Format Dropdown" should be visible
    * Text of "Download Popup > Format Dropdown" should be "PDF"
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
      | url                                                               |
      | #/topics/TaxFederal/tppc014a354b987c6b1000976d90b11c18c90202      |
      | #/topics/TaxStateAndLocal/tes01b48ff1d67c6c10009b15d8d385ad169404 |
      | #/topics/TaxInternational/00c0ab5c7cbf10008fe9d8d385ad169404      |



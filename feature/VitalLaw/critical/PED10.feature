@critical_path
@mvl
Feature: PED 10

  @CU-40177
  Scenario Outline: Verify UI of 'Download' overlay opened after click on 'Download' in Read View icon for Laws&Regulations
    * I am logged in
    # Open the document
    * I open "<doc>" document
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content > Title" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    # Click on Download button in the toolbar
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    # Verify that Overlay title is 'DOWNLOAD'
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    # Verify that X Close, Cancel and Print buttons are displayed and enabled
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
    # Click on X Close button
    * I click "Download Popup > X Close Button"
    # Verify that Download overlay is closed
    * "Download Popup" should not be visible

    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |

  @CU-40178
  @local
  Scenario Outline: Verify UI of 'Print' overlay opened after click on 'Print' icon in SRL for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<term>" on Laws & Regulations
    * "Toolbar Buttons > Print Button" should be visible
    # Select the first document from SRL using checkbox
    * I click "#1 of Documents > Checkbox"
    # Click on Print icon
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    # Verify that Overlay title is 'PRINT'
    * Text of "Print Popup > Title" should be "PRINT"
    # Verify that 'Include' dropdown with 'Complete documents' option is displayed
    * Text of "Print Popup > Include Label" should be "Include"
    * Text of "Print Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    # Verify that X Close, Cancel and Print buttons are displayed and enabled
    * "Print Popup > X Close Button" should be enabled
    * "Print Popup > Cancel Button" should be enabled
    * "Print Popup > Print Button" should be enabled
    # Click on 'Cancel' button
    * I click "Print Popup > Cancel Button"
    # Verify that Print overlay is closed
    * "Print Popup" should not be visible

    Examples:
      | term                 |
      | Law Revision Council |

  @CU-40179
  @local
  Scenario Outline: Verify UI of 'Download' overlay opened after click on 'Download' icon in SRL for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<term>" on Laws & Regulations
    * "Toolbar Buttons > Download Button" should be visible
    # Select the first document from SRL using checkbox
    * I click "#1 of Documents > Checkbox"
    # Click on Download icon
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup" should be visible
    # Verify that Overlay title is 'DOWNLOAD'
    * Text of "Download Popup > Title" should be "DOWNLOAD"
    # Verify that 'Include' dropdown with 'Complete documents'option and 'Format' dropdown with 'PDF'option are displayed
    * Text of "Download Popup > Include Label" should be "Include"
    * Text of "Download Popup > Include Dropdown" should be "COMPLETE DOCUMENTS"
    * Text of "Download Popup > Format Label" should be "Format"
    * Text of "Download Popup > Format Dropdown" should be "PDF"
    # Verify that X Close, Cancel and Print buttons are displayed and enabled
    * "Download Popup > X Close Button" should be enabled
    * "Download Popup > Cancel Button" should be enabled
    * "Download Popup > Download Button" should be enabled
    # Click on 'Cancel' button
    * I click "Download Popup > Cancel Button"
    # Verify that Download overlay is closed
    * "Download Popup" should not be visible

    Examples:
      | term                 |
      | Law Revision Council |

  @CU-40928
  Scenario Outline: Verify that 'Email has been sent.' overlay is displayed after user clicks on 'Quick Email' in Read View for Laws&Regulations
    * I am logged in
    * I open "<doc>" document
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content > Title" should be visible
    * "Toolbar Buttons > Quick Email Button" should be clickable
    * I click "Toolbar Buttons > Quick Email Button"
    * "Blank Info Popup" should be visible
    * Text of "Blank Info Popup" should be "Email has been sent."
    * I click "Blank Info Popup > X Close Button"
    * "Blank Info Popup" should not be visible
    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |
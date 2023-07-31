@critical_path
@mvl
Feature: PED 9

  @CU-32610
  Scenario Outline: Verify that 'Email has been sent.' overlay is displayed after user clicks on 'Quick Email' icon in Utility bar of TLP's Read view opened from Tax Topics List
    * I am logged in
    * I open base url with "<url>"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Toolbar Buttons > Quick Email Button" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Tax Topic Page > Toolbar Buttons > Quick Email Button"
    * "Blank Info Popup" should be visible
    * Text of "Blank Info Popup" should be "Email has been sent."
    * I click "Blank Info Popup > X Close Button"
    * "Blank Info Popup" should not be visible
    Examples:
      | url                                                               |
      | #/topics/TaxFederal/tppc0121df0fb47c6910008be490b11c18cbab043     |
      | #/topics/TaxStateAndLocal/tes0172c1ec507ce410008324d8d385ad169402 |
      | #/topics/TaxInternational/bb24347c7c93100095cf90b11c18cbab05      |

  @CU-40144
  Scenario Outline: Verify elements of a Toolbar in Read View on Laws&Regulations
    * I am logged in
    # Open the document
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    # Verify that Quick Print, Print, Download are displayed in the toolbar
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    # Verify that Previous/Next Document and View In New Window buttons are displayed in the toolbar
    * "Toolbar > Previous Document Button" should be visible
    * "Toolbar > Next Document Button" should be visible
    * "Toolbar > View In New Window" should be visible

    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |

  @CU-40175
  @local
  Scenario Outline: Verify elements of a Toolbar panel for a document opened from SRL on Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<term>" on Laws & Regulations
    # Open the second doc from SRL
    * I click "#2 of Documents"
    * "Document Frame > Title" should be visible
    # Verify that Quick Print, Print and Download buttons are displayed in the toolbar
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    # Verify that Previous/Next DOcument buttons are displayed in the toolbar
    * "Toolbar > Previous Document Button" should be visible
    * "Toolbar > Next Document Button" should be visible
    # Verify that View In New Window, Previous/Next Results buttons are displayed in the toolbar
    * "Toolbar > View In New Window" should be visible
    * "Toolbar > Previous Results Button" should be visible
    * "Toolbar > Next Results Button" should be visible
    # Verify that Previous/Next buttons and Highlight Search Terms Checkbox are displayed in the toolbar
    * "Toolbar > Previous Highlight Button" should be visible
    * "Toolbar > Next Highlight Button" should be visible
    * "Toolbar > Highlight Checkbox" should be visible

    Examples:
      | term                 |
      | Law Revision Council |

  @CU-40176
  Scenario Outline: Verify UI of 'Print' overlay opened after click on 'Print' icon in Read View for Laws&Regulations
    * I am logged in
    # Open the document
    * I open "<doc>" document
    * I wait until "Loading Indicator" is gone
    * "Toolbar Buttons > Print Button" should be visible
    # Click on Print button in the toolbar
    * "Document Frame > Document Content > Title" should be visible
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    # Verify that Overlay title is 'PRINT'
    * Text of "Print Popup > Title" should be "PRINT"
    # Verify that X Close, Cancel and Print buttons are displayed and enabled
    * "Print Popup > X Close Button" should be visible
    * "Print Popup > X Close Button" should be enabled
    * "Print Popup > Cancel Button" should be visible
    * Text of "Print Popup > Cancel Button" should be "CANCEL"
    * "Print Popup > Cancel Button" should be enabled
    * "Print Popup > Print Button" should be visible
    * Text of "Print Popup > Print Button" should be "PRINT"
    * "Print Popup > Print Button" should be enabled
    # Click on X Close button
    * I click "Print Popup > X Close Button"
    # Verify that Print overlay is closed
    * "Print Popup" should not be visible

    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |
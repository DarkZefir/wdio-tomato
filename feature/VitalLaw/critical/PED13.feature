@critical_path
@mvl
Feature: PED 13

  @CU-42098
  Scenario Outline: PED button is enabled again when changes was made in PED overlay after there were >100 docs selected for PED
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Open 1st document
    * I click "#1 of Documents > Checkbox"
    # Click Print/Email/Download
    * I click "Toolbar Buttons > <button> Button"
    * "<button> Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
    # Click Print/Email/Download
    * I click "<button> Popup > <button> Button"
    # Notice popup should be displayed
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Notice Title" should be "NOTICE"
    * "Notice Popup > Close Button" should be clickable
    # Close notice popup
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * "<button> Popup" should be visible
    # Print/Email/Download button should be disabled
    * "<button> Popup > <button> Button" should not be enabled
    # Select list only option in Include dropdown
    * I click "<button> Popup > Include Dropdown"
    * I click "<button> Popup > Include Dropdown > #2 of Items"
    # Print/Email/Download button should become enabled
    * "<button> Popup > <button> Button" should be enabled
    # Error message in red should disappear
    * "<button> Popup > #1 of Error Messages" should not be visible

    Examples:
      | button   | searchTerm   |
      | Print    | WKUS_TAL_412 |
      | Email    | WKUS_TAL_412 |
      | Download | WKUS_TAL_412 |

  @CU-42099
  Scenario Outline: Notice overlay can be closed by Cancel and X button when there were >100 docs selected for PED
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Open 1st document
    * I click "#1 of Documents > Checkbox"
    # Click Print/Email/Download
    * I click "Toolbar Buttons > <button> Button"
    * "<button> Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
    # Click Print/Email/Download
    * I click "<button> Popup > <button> Button"
    # Notice popup should be displayed
    * "Notice Popup" should be visible
    # Notice popup should have close and x button which are enabled
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Button" should be enabled
    # Close notice popup with Cancel button
    * I click "Notice Popup > Close Button"
    # Notice popup is closed
    * "Notice Popup" should not be visible
    # Close Print/Email/Download popup
    * I click "<button> Popup > Cancel Button"
    # Click Print/Email/Download
    * I click "Toolbar Buttons > <button> Button"
    * "<button> Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
    # Click Print/Email/Download
    * I click "<button> Popup > <button> Button"
    # Notice popup should be displayed
    * "Notice Popup" should be visible
    * "Notice Popup > Close Button" should be enabled
    * "Notice Popup > X Button" should be enabled
    # Close notice popup with X button
    * I click "Notice Popup > X Button"
    * "Notice Popup" should not be visible

    Examples:
      | button   | searchTerm   |
      | Print    | WKUS_TAL_412 |
      | Email    | WKUS_TAL_412 |
      | Download | WKUS_TAL_412 |

  @CU-42338
  Scenario Outline: Verify UI of 'Print' overlay opened after click on 'Print' icon in SRL for both PCING and AI docs
    * I am logged in
    # Perform search that contains 4 types of L&R docs and a regular doc
    * I perform search of "<term>"
    * Count of "Documents" should be equal to "5"
    * "Toolbar Buttons > Print Button" should be visible
    # Select all 5 docs from SRL using checkbox
    * I click "Results Toolbar > Select All Checkbox"
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
      | term                                                                                                                                                                                                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1 or us-regs-774e37c52c8c85c4349107644151c55a-v1 or fl-law-5432f650ebc558bacd0f717ee77bcfed-v1 or or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 or db4b88287e09100088f0000d3a8abb4e01 |

  @CU-42339
  Scenario Outline: Verify UI of 'Download' overlay opened after click on 'Download' icon in SRL for both PCING and AI docs
    * I am logged in
    # Perform search that contains 4 types of L&R docs and a regular doc
    * I perform search of "<term>"
    * Count of "Documents" should be equal to "5"
    * "Toolbar Buttons > Download Button" should be visible
    # Select all 5 docs from SRL using checkbox
    * I click "Results Toolbar > Select All Checkbox"
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
      | term                                                                                                                                                                                                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1 or us-regs-774e37c52c8c85c4349107644151c55a-v1 or fl-law-5432f650ebc558bacd0f717ee77bcfed-v1 or or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 or db4b88287e09100088f0000d3a8abb4e01 |
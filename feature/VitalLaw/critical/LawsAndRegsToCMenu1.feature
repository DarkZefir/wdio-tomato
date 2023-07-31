@critical_path
@mvl
@lawsAndRegs_ToC_menu
Feature: Laws And Regs ToC Menu

  @CU-42166
  Scenario Outline: Laws and Regs : Verify that temporary disabled ToC menu is displayed in new session
    * I am logged in
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * "Document Frame > Document Content" should be visible
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible
    # Close ToC hover menu via X close button
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    # Close appeared popup
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    # Logout and Login with the same user
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"
    * I wait until page title is "VitalLaw™ Login"
    * I am logged in without cleanup
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * "Contents Tab > #{$randomnode} of Nodes Labels" should be visible
    * I scroll to "Contents Tab > #{$randomnode} of Nodes Labels" element
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                                       |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 |

  @CU-42167
  Scenario Outline: Verify TOC hover over menu doesn't appear in next session when disabled permanently
    * I am logged in
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * "Document Frame > Document Content" should be visible
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I wait 1 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible
    # Close ToC hover menu via X close button
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Title" should be "Table of Contents Toolbar"
    # Check Never Show Toolbar Checkbox in the appeared popup and close it
    * I click "TOC Toolbar Popup > Never Show Toolbar Checkbox"
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    # Logout and login with the same user
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"
    * I wait until page title is "VitalLaw™ Login"
    * I am logged in without cleanup
    # Open any L&R document
    * I open "<docId>" document
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    # Hover over any ToC node and make sure ToC hover menu is disabled
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible

    Examples:
      | docId                                       |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 |

  @CU-42168
  Scenario Outline: Laws and Regs : Verify that ToC menu can be disabled via Site Preferences
    * I am logged in
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * "Document Frame > Document Content" should be visible
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I wait 1 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible
    # Open Site Prefernces and uncheck Show Toolbar checkbox
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    # Hover over any ToC node and make sure ToC hover menu is disabled
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible

    Examples:
      | docId                                       |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 |

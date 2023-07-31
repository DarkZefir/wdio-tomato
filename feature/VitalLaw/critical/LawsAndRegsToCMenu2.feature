@critical_path
@mvl
@lawsAndRegs_ToC_menu
Feature: Laws And Regs ToC Menu

  @CU-42169
  Scenario Outline: Verify that disabling ToC menu on Laws&Regs affects regular documents
    * I am logged in
    # Open any L&R document
    * I open "<docLaR>" document
    # Hover over any ToC node to see hover menu
    * "Document Frame > Document Content" should be visible
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Nodes" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I wait 1 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes"
    * "Contents Tab > Menu Container" should be visible
    # Close ToC hover menu via X close button
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    # Open any regular (AI) document
    * I open "<regularDoc>" document
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll to "Contents Tab > #{$randomnode} of Collapsed Parent Node" element
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node" should be visible
    # Hover over any ToC node and make sure that ToC hover menu is also disabled
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible

    Examples:
      | docLaR                                      | regularDoc                                |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  | d2a0f64c7c22100092e6d8d385ad169401        |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | sec01685277167ce510009919d8d385ad169402cb |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 | cfq024adb069e7e0c1000812c000d3a8abb4e01   |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 | 09013e2c87b6597e                          |

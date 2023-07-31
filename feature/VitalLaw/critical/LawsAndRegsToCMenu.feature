@critical_path
@mvl
@lawsAndRegs_ToC_menu
Feature: Laws And Regs ToC Menu

  @CU-42163
  Scenario Outline: Verify UI of TOC hover over menu on Laws and Regs
    * I am logged in
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * "Document Frame > Document Content" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I wait 1 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible
    # Verify UI of ToC hover over menu
    * "Contents Tab > Menu Container > Search Input" should be visible
    * Placeholder text for "Contents Tab > Menu Container > Search Input" should be "Search within this content"
    * "Contents Tab > Menu Container > Search Button" should be visible
    * "Contents Tab > Menu Container > Favorite Button" should be visible
    * "Contents Tab > Menu Container > Quick Print" should be visible
    * "Contents Tab > Menu Container > Quick Email" should be visible
    * "Contents Tab > Menu Container > Add To" should be visible
    * "Contents Tab > Menu Container > Print" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * "Contents Tab > Menu Container > Close" should be visible

    Examples:
      | docId                                       |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 |

  @CU-42164
  Scenario Outline: Verify that user can perform search within ToC menu on Laws and Regs
    * I am logged in
    # Open any L&R document
    * I open "<docId>" document
    # Hover over any ToC node and wait for ToC hover over menu
    * "Document Frame > Document Content" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Nodes" to center of the window
    * "Contents Tab > #{$randomnode} of Nodes" should be visible
    * I wait 1 seconds
    * I remember text of "Contents Tab > #{$randomnode} of Nodes Labels" as "filterPillExpected"
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * "Contents Tab > Menu Container" should be visible
    # Remember title of hovered node and perform search within ToC hover menu search field
    * I type "<term>" in "Contents Tab > Menu Container > Search Input"
    * I click "Contents Tab > Menu Container > Search Button"
    # Check that search results were filtered within hovered node
    * "#1 of Documents" should be visible
    * I remember text of "Search Within Filter Pill" as "filterPillActual"
    * "{$filterPillExpected}" text should contain "{$filterPillActual}" text ignoring case ignoring punctuation marks

    Examples:
      | docId                                       | term |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  | law  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | law  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 | law  |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 | law  |

  @CU-42165
  Scenario Outline: Laws and Regs : Verify that user can disable ToC menu via ToC and enable it
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
    # Close appeared popup
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    # Hover over any ToC node and make sure ToC hover menu is disabled
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * I wait 2 seconds
    * "Contents Tab > Menu Container" should not be visible
    # Go to Site Preferences and check Show Toolbar Checkbox
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Site Preferences in Items"
    * "Site Preferences Popup" should be visible
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I wait 1 seconds
    # Hover over any ToC node and make sure ToC hover menu is enabled
    * I move mouse over "Contents Tab > #{$randomnode} of Nodes Labels"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                                       |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1  |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-c2abbb7990be2dfb253f3a94d1571fc4-v1 |
      | in-regs-e182ddf3e29e20df0aed50dc037e1939-v1 |
@smoke
@mvl @vlcc @px
@utility_bar
Feature: Utility Bar

  @CU-31916 @CU-32421 @CU-33124
  Scenario Outline: Verify UI of TOC hover over menu
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
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
      | docId                 |
      | qsc0109013e2c84490e26 |

  @CU-33675 @CU-33676 @CU-33677
  Scenario Outline: Verify UI of TOC hover over menu popup
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "$nodes" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * Text of "TOC Toolbar Popup > Content" should contain "This Toolbar has been disabled for this session."
    * "TOC Toolbar Popup > Never Show Toolbar Checkbox" should be visible
    * "TOC Toolbar Popup > Never Show Toolbar Checkbox" should not be selected
    * "TOC Toolbar Popup > Site Preferences" should be visible
    * "TOC Toolbar Popup > Image" should be visible
    * "TOC Toolbar Popup > OK Button" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-31915 @CU-32422 @CU-33125
  @ipa
  Scenario Outline: Verify that TOC menu is displayed after user hovers over any item in 'Contents' panel's tree
    * I am logged in
    * I open "<docId>" document
    * I wait until "Loading Indicator" is gone
    * I move mouse over "Contents Tab > #1 of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded Parent Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded First Child Node > Path Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I move mouse over "Contents Tab > Selected Link"
    * "Contents Tab > Menu Container" should be visible
    * I move mouse over "Contents Tab > #1 of Expanded First Child Node > #3 of Links"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                                   |
      | qca01fe04e5167d42100097ac00505688259001 |

  @CU-33678 @CU-33679 @CU-33680
  Scenario Outline: Verify TOC hover over menu doesn't appear after being disabled for the current session
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33681 @CU-33682 @CU-33683
  @logout
  Scenario Outline: Verify TOC hover over menu doesn't appear after being disabled permanently
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 3 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > Never Show Toolbar Checkbox"
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33684 @CU-33685 @CU-33686
  @logout
  Scenario Outline: Verify TOC hover over menu appears in next session when disabled for the current session
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 3 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in without cleanup
    * I open "<docId>" document
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33687 @CU-33688 @CU-33689
  Scenario Outline: Verify TOC hover over menu doesn't appear in next session when disabled permanently
    * I am logged in
    * I open "<docId>" document
    * "Document Frame > Title" should be visible
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * Text of "TOC Toolbar Popup > Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > Never Show Toolbar Checkbox"
    * I wait 2 seconds
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in without cleanup
    * I open "<docId>" document
    * "Document Frame > Title" should be visible
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * "Site Preferences Popup > Show Toolbar Checkbox" should be visible
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33690 @CU-33691 @CU-33693
  Scenario Outline: Verify TOC hover over menu disabled for the session can be enabled in 'Site Preferences' (opened from User Menu)
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 3 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > OK Button"
    * "TOC Toolbar Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33694 @CU-33695 @CU-33696
  @logout
  Scenario Outline: Verify TOC hover over menu disabled for the session can be enabled in 'Site Preferences' (opened from TOC popup)
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 3 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > Site Preferences"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33697 @CU-33698 @CU-33699
  Scenario Outline: Verify permanently disabled TOC hover over menu can be enabled in 'Site Preferences' (opened from TOC popup)
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 3 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I click "Contents Tab > Menu Container > Close"
    * "TOC Toolbar Popup" should be visible
    * Text of "TOC Toolbar Popup > Popup Title" should be "Table of Contents Toolbar"
    * I click "TOC Toolbar Popup > Never Show Toolbar Checkbox"
    * I wait 1 seconds
    * I click "TOC Toolbar Popup > Site Preferences"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33700 @CU-33701 @CU-33702
  Scenario Outline: Verify state of TOC hover over menu can be changed in 'Site Preferences'
    * I am logged in
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

  @CU-33703 @CU-33704 @CU-33705
  Scenario Outline: Verify TOC hover over menu can be disabled permanently in 'Site Preferences'
    * I am logged in
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * "Site Preferences Popup > Show Toolbar Checkbox" should be selected
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in without cleanup
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I wait 1 seconds
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * I wait 3 seconds
    * "Contents Tab > Menu Container" should not be visible
    * I click "Header > User Menu"
    * I click "Header > User Menu >#Site Preferences in Items"
    * I click "Site Preferences Popup > Show Toolbar Checkbox"
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible

    Examples:
      | docId                 |
      | qsc0109013e2c8452f6c9 |

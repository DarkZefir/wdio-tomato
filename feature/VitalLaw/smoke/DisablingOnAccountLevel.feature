@smoke
@mvl
@disable_features_at_the_account_level
Feature: Disable Features At The Account Level

  @CU-39911
  Scenario Outline: Personal Items are not displayed in document view toolbar for user with suppressed personal features subscription
    # Open any document
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    * I open "<document>" document
    # Verify that Star icon and Add To icon are not displayed in document view toolbar
    * "Favorite Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    # Verify that Print, Email, Donwload, Quick Print, Quick Email and Copy Link buttons are displayed
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    Examples:
      | document                           |
      | 6a7976007db41000ac84000d3a8daaf402 |

  @CU-39912
  Scenario Outline: Personal features items are not displayed in document view Inline widget for user with suppressed personal features subscription
    # Open any document
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    * I open "<document>" document
    # Select any text in document body to tigger Inline Widget Menu
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #1 of Document Paragraphs"
    * I wait until "Loading Indicator" is gone
    # Verify that Add Note and Highlight items are not displayed
    * "Inline Widget" should be visible
    * Text in collection of "Inline Widget Items" should not contain "ADD NOTE"
    * Text in collection of "Inline Widget Items" should not contain "HIGHLIGHT"
    # Verify that not personal features Items (Print and Copy) are displayed
    * Text in collection of "Inline Widget Items" should contain "PRINT"
    * Text in collection of "Inline Widget Items" should contain "COPY"
    Examples:
      | document                           |
      | 91ed994a7bd51000a5c390b11c2ac4f102 |

  @CU-39913
  Scenario Outline: Personal Items are not displayed in ToC toolbar for user with suppressed personal features subscription
    # Open any document
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    * I open "<document>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    # Select random node from ToC and hover over it
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" should be visible
    * I scroll "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label" to center of the window
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    # Wait for Menu Container and verify that Star icon and Add to icon are not displayed
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Favorite Button" should not be visible
    * "Contents Tab > Menu Container > Add To" should not be visible
    # Verify that other not personal items are displayed
    * "Contents Tab > Menu Container > Search Button" should be visible
    * "Contents Tab > Menu Container > Search Input" should be visible
    * "Contents Tab > Menu Container > Quick Print" should be visible
    * "Contents Tab > Menu Container > Quick Email" should be visible
    * "Contents Tab > Menu Container > Print" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * "Contents Tab > Menu Container > Close" should be visible

    Examples:
      | document              |
      | bex0109013e2c843fec0a |

  @CU-39914
  Scenario: Personal Items are not displayed in SRL toolbar for user with suppressed personal features subscription
    # Open any PA and perform any search
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Practice Areas Box > #{$PAs} of Practice Area Links"
    * I perform search of "*"
    # Verify that Star icon and Add To icon are not displayed in document view toolbar
    * "Favorite Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    * "Results Toolbar > Save Search Button" should not be visible
    * "Results Toolbar > Share This Search Button" should not be visible
    # Verify that Print, Email, Donwload, Quick Print, Quick Email and Copy Link buttons are displayed
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible

  @CU-39915
  Scenario: Personal Items are not displayed in Global Header and All Content for user with suppressed personal features subscription
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    # Verify that Favorites, Folders and Saved Items are not displayed in header
    * "Header > Favorites Button" should not be visible
    * "Header > Folders Dropdown" should not be visible
    * "Header > Saved Items Dropdown" should not be visible
    # Verify that other elements are displayed
    * "Header > WK Logo" should be visible
    * "Header > User Menu" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > Application Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header >  History Dropdown" should be visible
    * "Header > News Dropdown" should be visible
    # Verify that All Content Favorites widget is not displayed
    * "Favorites Box" should not be visible

  @CU-39916
  Scenario: Personal Items are not displayed for Practical Content for user with suppressed personal features subscription
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    # Go to Practical Content
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    # Verify that My Practical Content Favorites box is not displayed
    * "My Practical Content Favorites Box" should not be visible
    # Perform any search
    * I perform search of "*" on practical content
    * "Share Search Button" should not be visible

  @CU-39917
  @local
  Scenario Outline: Favorites icon is not displayed for SmartCharts for user with suppressed personal features subscription
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    # Search for document in order SmartChart to be displayed in SRL and open it
    * I perform search of "<smartChart>"
    * I click "Smart Charts Title Box"
    # Verify that Star icon is not displayed
    * "#1 of Results Nodes > #1 of Section Titles > Leaf Title" should be visible
    * "Utility Bar > Favorites Button" should not be visible
    Examples:
      | smartChart                        |
      | Employee and Officer Compensation |

  @CU-39918
  Scenario Outline: Favorites/Add To icon is not displayed for Topics for user with suppressed personal features subscription
    * I am logged in as "limitedPersFeaturesQA@wk.com" with "password" password
    # Search for document in order Topic to be displayed in SRL and open it
    * I open "<document>" topics document
    * I wait until "Loading Indicator" is gone
    # Verify that Star icon and Add To icon are not displayed not displayed
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Favorite Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    # Verify that not personal features elements are displayed
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    Examples:
      | document                           |
      | 829326aa7c921000ba1290b11c2ac4f104 |

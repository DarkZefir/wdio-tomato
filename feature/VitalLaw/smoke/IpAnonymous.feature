@smoke
@mvl
@ipa_only
Feature: IP Anonymous

  @CU-37756
  Scenario Outline: Verify that customization of dashboards is not available for IP Anonymous user
    * I am logged in
    * I am on "<PA>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxNumber"
    * "Content Box > #{$boxNumber} of  Main Content Types > Header Config" should not be visible
    Examples:
      | PA         |
      | BANKRUPTCY |
      | TAX - ALL  |

  @CU-37757
  Scenario Outline: Verify that customization of content box through 'See All' overlay is not available for IP Anonymous through 'See All' overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" matching "<Box Title>" as "index"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > See All" should be visible
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > See All"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "<Box Title>" ignoring case ignoring whitespaces
    * "See All Popup" should be visible
    * "See All Popup > Close Button" should be visible
    * "See All Popup > Customize" should not be visible

    Examples:
      | Practice Area               | Box Title       |
      | BANKING & CONSUMER FINANCE  | ACTS & STATUTES |
      | PENSION & EMPLOYEE BENEFITS | JOURNALS        |

  @CU-37758
  Scenario Outline: Verify UI of TOC hover over menu popup for IP Anonymous user
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "nodes"
    * I remember random integer below "{$nodes}" as "randomnode"
    * I move mouse over "Contents Tab > #{$randomnode} of Collapsed Parent Node > Header > Label"
    * "Contents Tab > Menu Container" should be visible
    * "Contents Tab > Menu Container > Search Input" should be visible
    * Placeholder text for "Contents Tab > Menu Container > Search Input" should be "Search within this content"
    * "Contents Tab > Menu Container > Search Button" should be visible
    * "Contents Tab > Menu Container > Favorite Button" should not be visible
    * "Contents Tab > Menu Container > Quick Email" should not be visible
    * "Contents Tab > Menu Container > Add To" should not be visible
    * "Contents Tab > Menu Container > Quick Print" should be visible
    * "Contents Tab > Menu Container > Print" should be visible
    * "Contents Tab > Menu Container > Email" should be visible
    * "Contents Tab > Menu Container > Download" should be visible
    * "Contents Tab > Menu Container > Close" should be visible

    Examples:
      | docId                 |
      | pof0209013e2c8454663d |

  @CU-37763
  Scenario: Verify UI of Toolbar on Search Result List for IP Anonymous
    * I am logged in
    * I perform search of "merger"
    * "Results Toolbar > Title Bar" should be visible
    * "Results Toolbar > Save Search Button" should not be visible
    * "Results Toolbar > Share This Search Button" should be visible
    * "Results Toolbar > Toolbar Buttons" should be visible
    * "Results Toolbar > Toolbar Buttons > Add To Button" should not be visible
    * "Results Toolbar > Toolbar Buttons > Print Button" should be visible
    * "Results Toolbar > Toolbar Buttons > Email Button" should be visible
    * "Results Toolbar > Toolbar Buttons > Download Button" should be visible

  @CU-37768
  Scenario: Verify UI of Toolbar on document's Read View for IP Anonymous user
    * I am logged in
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    * "Document Frame > Document Content" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Favorite Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    * "Toolbar Buttons > Quick Email Button" should not be visible

  @CU-37769
  Scenario Outline: Verify UI of Toolbar on Tax Topics Pages for IP Anonymous user
    * I am logged in
    * I open "<id>" topics document
    * "Toolbar Buttons" should be visible
    * "Favorite Button" should not be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible

    Examples:
      | id                                       | Topic Page Type |
      | tppc018dcd37347cb21000b76190b11c18cbab01 | Federal         |
      | tes0144bf60327d731000946700505688693902  | State           |
      | f6445fba7cba1000ba67d8d385ad169405       | International   |

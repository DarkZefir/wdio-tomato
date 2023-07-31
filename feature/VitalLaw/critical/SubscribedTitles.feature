@critical_path
@mvl
Feature: Subscribed Titles

  @CU-31323
  Scenario Outline: Titles list - open document
    * I am logged in
    * I am on "<Practice Area>" PA
    * I click "Header > Titles Button"
    * "Titles Popup > #1 of Letter Markers" should be visible
    * "Titles Popup" should be visible
    * Text of "Titles Popup > View Dropdown Label" should contain "<Practice Area>" ignoring case
    * I type "Mergers, Acquisitions" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text of "Titles Popup > #1 of Publications Links" should contain "<Title>" ignoring case
    * I click "Titles Popup > #1 of Publications Links"
    * "Document Frame > Document Content" should be visible
    * Text of "DA Title" should contain "<Title>" ignoring case
    * "Titles Popup" should not be visible

    Examples:
      | Practice Area    | Title                                                           |
      | ALL CONTENT      | Mergers, Acquisitions, And Buyouts - Ginsburg, Levin, And Rocap |
      | SECURITIES - ALL | Mergers, Acquisitions, And Buyouts - Ginsburg, Levin, And Rocap |
      | Tax - ALL        | Mergers, Acquisitions, And Buyouts - Ginsburg, Levin, And Rocap |

  @CU-31336
  Scenario Outline: Subscribed Titles - letter navigation
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * "Titles Popup > #1 of Letter Markers" should be present
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount1"
    * Placeholder text for "Titles Popup > Search Input" should be "Search Within Titles"
    * "Titles Popup > Search Input" should be visible
    * "Titles Popup > Letter Navigation" should be visible
    * I click "Titles Popup > View Dropdown Button"
    * I click "Titles Popup > #<select> in View Dropdown Menu Items"
    * "Titles Popup > Letter Navigation" should be visible
    * Text of "Titles Popup > View Dropdown Label" should contain "<expected>" ignoring case
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount2"
    * I click "Titles Popup > #H in Letter Navigation Letters"
    * Text in collection of "Titles Popup > Letter Markers" should contain "H" ignoring case
    * "Titles Popup > Letter Navigation" should be visible
    * I click "Titles Popup > #E in Letter Navigation Letters"
    * I wait 1 seconds
    * Text in collection of "Titles Popup > Letter Markers" should contain "E" ignoring case
    * "Titles Popup > Letter Navigation" should be visible
    * I click "Titles Popup > Close Button"
    * "Titles Popup" should not be visible

    Examples:
      | select                 | expected               |
      | All Content            | ALL CONTENT            |
      | Payroll & Entitlements | PAYROLL & ENTITLEMENTS |

  @CU-31345
  Scenario Outline: Titles list - Search Within
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > Titles Button"
    * "Titles Popup > #1 of Letter Markers" should be present
    * "Titles Popup" should be visible
    * "Titles Popup > Letter Navigation" should be visible
    * Text of "Titles Popup > View Dropdown Button" should contain "ALL CONTENT" ignoring case
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount1"
    * I click "Titles Popup > View Dropdown Button"
    * I click "Titles Popup > #<select> in View Dropdown Menu Items"
    * "Titles Popup > Letter Navigation" should be visible
    * Text of "Titles Popup > View Dropdown Label" should contain "<expected>" ignoring case
    * I remember number of "Titles Popup > Letter Markers" as "lettersCountInPA"
    * I type "Benefits Tax Guide" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * I wait 1 seconds
    * Text of "Titles Popup > #1 of Results Highlights" should contain "Benefits" ignoring case
    * Text of "Titles Popup > #2 of Results Highlights" should contain "Tax" ignoring case
    * Text of "Titles Popup > #3 of Results Highlights" should contain "Guide" ignoring case
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount2"
    * "{$lettersCount2}" number should be less than "{$lettersCount1}"
    * "Titles Popup > Results Found" should be visible
    * I click "Titles Popup > Clear Search Input"
    * Placeholder text for "Titles Popup > Search Input" should be "Search Within Titles"
    * I type "payroll" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * I wait 1 seconds
    * Text of "Titles Popup > #1 of Results Highlights" should contain "Payroll" ignoring case
    * "Titles Popup > Results Found" should be visible
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount3"
    * "{$lettersCount2}" number should not be equal to "{$lettersCount3}"
    * I click "Titles Popup > Clear Search Results"
    * I remember number of "Titles Popup > Letter Navigation Letters" as "lettersCount4"
    * "{$lettersCountInPA}" number should not be equal to "{$lettersCount3}"
    * "Titles Popup > Results Highlights" should not be visible
    * I click "Titles Popup > Close Button"
    * "Titles Popup" should not be visible

    Examples:
      | select                 | expected               |
      | All Content            | ALL CONTENT            |
      | Payroll & Entitlements | PAYROLL & ENTITLEMENTS |
@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-39359
  Scenario Outline: Verify Docket Navigator link in "Useful Links" box on PAs
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Useful Links Box" should be visible
    * Text of "Useful Links Box > Header Title" should be "USEFUL LINKS"
    * "Useful Links Box > Header Customize" should be visible
    * Text of "Useful Links Box > #1 of Links Groups > Title" should be "DOCKET NAVIGATOR"
    * Text of "Useful Links Box > #1 of Links Groups > #1 of Links" should be "Docket Navigator"
    * I remember number of browser tabs
    * I click "Useful Links Box > #1 of Links Groups > #1 of Links"
    * I switch to new tab
    * Page URL should contain "docketnavigator"
    Examples:
      | Practice Area                        |
      | Antitrust & Competition              |
      | Intellectual Property                |
      | Securities - All                     |
      | Securities - Federal & International |

  @CU-42953
  Scenario Outline: VITALLAW AGREEMENT & CLAUSE BUILDER Agreements links can be found in Titles overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    # random item from dropdown is being selected here
    * I click "Lawgood Box > Select Dropdown > #1 of Items"
    # random link is being selected here
    * I remember number of "Lawgood Box > Links" as "linksCount"
    * I remember random integer below "{$linksCount}" as "randomItem"
    * I remember text of "Lawgood Box > #{$randomItem} of Links" as "selectedItemText"
    # search in Titles overlay
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * I type "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text in collection of "Titles Popup > Publications Links" should contain "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}"

    Examples:
      | Practice Area                             |
      | Labor & Employment Law                    |
      | Human Resources                           |
      | Intellectual Property                     |
      | Securities - Corporation Law & Governance |
      | Practice of Law                           |

  @CU-42954
  Scenario Outline: VITALLAW AGREEMENT & CLAUSE BUILDER Clauses links can be found in Titles overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    # random item from dropdown is being selected here
    * I click "Lawgood Box > Select Dropdown > #2 of Items"
    # random link is being selected here
    * I remember number of "Lawgood Box > Links" as "linksCount"
    * I remember random integer below "{$linksCount}" as "randomItem"
    * I remember text of "Lawgood Box > #{$randomItem} of Links" as "selectedItemText"
    # search in Titles overlay
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * I type "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text in collection of "Titles Popup > Publications Links" should contain "VitalLaw Agreement & Clause Builder/Lawgood: {$selectedItemText}"

    Examples:
      | Practice Area          |
      | Labor & Employment Law |

  @CU-42955
  Scenario Outline: VITALLAW AGREEMENT & CLAUSE BUILDER Clauses links can be found in SRL
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #2 of Items" should be visible
    # random item from dropdown is being selected here
    * I click "Lawgood Box > Select Dropdown > #1 of Items"
    # random link is being selected here
    * I remember number of "Lawgood Box > Links" as "linksCount"
    * I remember random integer below "{$linksCount}" as "randomItem"
    * I remember text of "Lawgood Box > #{$randomItem} of Links" as "selectedItemText"
    # search from All Content page
    * I perform search of "Lawgood: {$selectedItemText}"
    * Text of "#1 of Search Result Items > Link" should contain "Lawgood: {$selectedItemText}"

    Examples:
      | Practice Area          |
      | Labor & Employment Law |

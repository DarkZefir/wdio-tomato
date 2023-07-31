@critical_path
@mvl
Feature: Subscribed Titles 2

  @CU-32533
  Scenario Outline: Verify breadcrumbs in Titles overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Header > <Popup> Button" should be visible
    * I click "Header > <Popup> Button"
    * "<Popup> Popup > #1 of Letter Markers" should be present
    * "<Popup> Popup" should be visible
    * I scroll "<Popup> Popup > #<Link> in Publication Containers" to center of the window
    * I move mouse over "<Popup> Popup > #<Link> in Publication Containers"
    * "<Popup> Popup > #<Link> in Publication Containers > Info Button" should be visible
    * I click "<Popup> Popup > #<Link> in Publication Containers > Info Button"
    * "<Popup> Popup > Info Box > #1 of Info Container Breadcrumbs" should be visible
    * Text of "<Popup> Popup > Info Box > #1 of Info Container Breadcrumbs" should be "<Breadcrumbs>" ignoring case ignoring whitespaces

    Examples:
      | Practice Area       | Popup  | Link                                    | Breadcrumbs                                                          |
      | ALL CONTENT         | Titles | 1 FERC - 101 FERC: Appeals Table        | Energy & Environment > Energy & Natural Resources > Indexes & Tables |
      | TAX - INTERNATIONAL | Titles | 2003 OECD Model Treaty and Commentaries | Tax - International > Content > Tax Treaties                         |

  @CU-32534
  Scenario Outline: Verify PA is opened on click on breadcrumbs in Titles overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * I click "Header > <Popup> Button"
    * "<Popup> Popup > #1 of Letter Markers" should be present
    * "<Popup> Popup" should be visible
    * I move mouse over "<Popup> Popup > #<Link> in Publication Containers"
    * "<Popup> Popup > #<Link> in Publication Containers > Info Button" should be visible
    * I click "<Popup> Popup > #<Link> in Publication Containers > Info Button"
    * "<Popup> Popup > Info Box > #1 of Info Container Breadcrumbs" should be visible
    * Text of "<Popup> Popup > Info Box > #1 of Info Container Breadcrumbs" should be "<Breadcrumbs>" ignoring case ignoring whitespaces
    * I click "<Popup> Popup > Info Box > #1 of Info Container Breadcrumbs"
    * Text of "Session Navigator" should be "<PA to Open>" ignoring case ignoring whitespaces

    Examples:
      | Practice Area       | Popup  | Link                                    | Breadcrumbs                                                          | PA to Open           |
      | ALL CONTENT         | Titles | 1 FERC - 101 FERC: Appeals Table        | Energy & Environment > Energy & Natural Resources > Indexes & Tables | Energy & Environment |
      | TAX - INTERNATIONAL | Titles | 2003 OECD Model Treaty and Commentaries | Tax - International > Content > Tax Treaties                         | Tax - International  |

  @CU-32535
  @logout
  Scenario Outline: Verify list of Practice Areas in Titles overlay
    * I am logged in as "alertstesting1@wk.com " with "password" password
    * I am on "ALL CONTENT" PA
    * I remember text of "Practice Areas Box > Practice Area Links" as "collectionOfPA"
    * I click "Header > <Popup> Button"
    * "<Popup> Popup > #1 of Letter Markers" should be present
    * "<Popup> Popup" should be visible
    * I click "<Popup> Popup > View Dropdown Button"
    * "<Popup> Popup > #1 of View Dropdown Menu Items" should be visible
    * I remember text of "<Popup> Popup > View Dropdown Menu Items" as "PASfromDropdown"
    * I include "All Content" into "$collectionOfPA"
    * "$collectionOfPA" collection should be equal to "$PASfromDropdown" collection ignoring order
    Examples:
      | Popup  |
      | Titles |

  @CU-37383
  Scenario Outline: Verify “This title is only available here” message is displayed for hidden publications in ‘info’ block of ‘Subscribed Titles’ overlay
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > <Popup> Button"
    * "<Popup> Popup > #1 of Letter Markers" should be present
    * "<Popup> Popup" should be visible
    * I type "<publicationsHidden>" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * I wait 1 seconds
    * I should see the following lines in "Titles Popup > Publications Links":
      | <publicationsHidden> |
    * I move mouse over "Titles Popup > #<publicationsHidden> in Publication Containers"
    * "Titles Popup > #<publicationsHidden> in Publication Containers > Info Button" should be visible
    * I click "Titles Popup > #<publicationsHidden> in Publication Containers > Info Button"
    * "Titles Popup > Info Box > Info Container Message" should be visible
    * Text of "Titles Popup > Info Box > Info Container Message" should contain "This title is only available here"
    * Count of "Titles Popup > Info Box > Info Container Breadcrumbs" should be equal to "0"
    Examples:
      | Popup  | publicationsHidden                 |
      | Titles | Financial Privacy Legislation      |
      | Titles | Federal Advertising laws and rules |

  @CU-37384
  Scenario Outline: Verify that breadcrumbs for DAs are displayed in alpha order in 'Subscribed Titles' overlay
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > <Popup> Button"
    * "<Popup> Popup > #1 of Letter Markers" should be present
    * "<Popup> Popup" should be visible
    * I type "<publication>" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * I wait 1 seconds
    * I should see the following lines in "Titles Popup > Publications Links":
      | <publication> |
    * I move mouse over "Titles Popup > #<publication> in Publication Containers"
    * "Titles Popup > #<publication> in Publication Containers > Info Button" should be visible
    * I click "Titles Popup > #<publication> in Publication Containers > Info Button"
    * "Titles Popup > Info Box > #1 of Info Container Breadcrumbs" should be visible
    * Order of "Titles Popup > Info Box > Info Container Breadcrumbs" should be alphabetical
    Examples:
      | Popup  | publication                |
      | Titles | U.S. Tax Treaties Reporter |

@smoke
@vlcc
@dashboard_boxes
Feature: Dashboard Boxes 2

  @CU-32688
  Scenario Outline: [VLCC] Verify that no links on content group with GO button when '-Select-' item is selected
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should contain "- SELECT -" ignoring case ignoring whitespaces
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should not be visible

    Examples:
      | Practice Area            | Box Title                |
      | BANKING                  | TREATISES & EXPLANATIONS |
      | HR, EMPLOYMENT AND LABOR | LAWS & REGULATIONS       |
      | Energy                   | INDEXES & TABLES         |

  @CU-32689
  Scenario Outline: [VLCC] Verify correct document is opened from content group clicking on GO button
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #<Item> of Items" as "docTitle"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #<Item> of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Go Button" should be visible
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should contain "{$docTitle}" ignoring case
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Go Button"
    * "Document Frame > Document Content" should be visible
    * Text in collection of "Document Frame > Path Titles" should contain "{$docTitle}" ignoring case

    Examples:
      | Practice Area        | Box Title                | Item |
      | CORPORATE LAW        | TREATISES & EXPLANATIONS | 4    |
      | GOVERNMENT CONTRACTS | TREATISES & EXPLANATIONS | 2    |

  @CU-32692
  Scenario Outline: [VLCC] Verify correct document is opened from content group with GO button
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #<Item> in Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "docTitle"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    * "Document Frame > Document Content" should be visible
    * Text in collection of "Document Frame > Path Titles" should contain "{$docTitle}" ignoring case

    Examples:
      | Practice Area        | Box Title                | Item                          |
      | GOVERNMENT CONTRACTS | TREATISES & EXPLANATIONS | Government Contracts Reporter |
      | TORTS                | TREATISES & EXPLANATIONS | Products Liability Reporter   |

  @CU-38116
  Scenario Outline: [VLCC] Verify UI elements of VITALLAW AGREEMENT & CLAUSE BUILDER container
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * Text of "Lawgood Box > Title" should be "VITALLAW™ AGREEMENT & CLAUSE BUILDER"
    * Text of "Lawgood Box > Subtitle" should be "Powered by Lawgood"
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * Text of "Lawgood Box > Select Dropdown > #1 of Items" should be "Agreements" ignoring case
    * Text of "Lawgood Box > Select Dropdown > #2 of Items" should be "Clauses" ignoring case
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Service Agreements                |
      | Confidentiality Agreements        |
      | Technology Agreements             |
      | Employment Agreements             |
      | Intellectual Property Agreements  |
      | Formation/Incorporation Documents |
      | Start-Up Documents                |
      | Sale of Goods Agreements          |
      | M&A Agreements                    |
    * I click "Lawgood Box > Select Dropdown"
    * I click "Lawgood Box > Select Dropdown > #Clauses in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality                |
      | Covenants                      |
      | Dispute Resolution             |
      | Force Majeure                  |
      | Further Assurances             |
      | Indemnification                |
      | Intellectual Property          |
      | Internet                       |
      | Liability                      |
      | Limited Liability Companies    |
      | Miscellaneous                  |
      | Payment                        |
      | Privacy                        |
      | Remedies                       |
      | Representations and Warranties |
      | Subcontracting                 |
      | Term + Termination             |

    Examples:
      | Practice Area     |
      | All Content       |
      | Contracts & Forms |

  @CU-38128
  Scenario: [VLCC] Verify that VITALLAW AGREEMENT & CLAUSE BUILDER links are opened in a new tab
    * I am logged in
    * I am on "Contracts & Forms" PA
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * "Lawgood Box > Select Dropdown > #2 of Items" should be visible
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I remember number of "Lawgood Box > Links" as "links"
    * I remember random integer below "{$links}" as "randomLink"
    * I remember number of browser tabs
    * I click "Lawgood Box > #{$randomLink} of Links"
    * I switch to new tab
    * Page URL should contain "lawgood"

  @CU-38804
  Scenario: [VLCC] Verify that "Bankruptcy Essentials" box is displayed on Bankruptcy PA dashboard
    * I am logged in
    * I am on "BANKRUPTCY" PA
    * "Essentials Box" should be visible
    * Text of "Essentials Box > Title" should be "BANKRUPTCY ESSENTIALS"

  @CU-38805
  Scenario Outline: [VLCC] Verify that user is able to search by Bankruptcy Topic Pages title from Bankruptcy Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * "Topics Search Result List > Topics List Container" should be visible
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * Each element of "Topics Search Result List > Topic Links" should contain "<Search Term>" ignoring case
    * "Topics List Clear Search" should be visible
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | URL                            | List Title            | Search Term |
      | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | bank        |

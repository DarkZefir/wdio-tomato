@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-32489
  Scenario Outline: Verify See all overlay can be opened by clicking group title
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > See All" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Title"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "<Box Title>" ignoring case ignoring whitespaces

    Examples:
      | Practice Area           | Box Title                     |
      | ANTITRUST & COMPETITION | TREATISES & EXPLANATIONS      |
      | BLUE CHIP               | BLUE CHIP FINANCIAL FORECASTS |

  @CU-32490
  Scenario Outline: Verify magnifier icon appears after hovering over content group title
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Title"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Header Icon" should be visible

    Examples:
      | Practice Area   | Box Title                                                    |
      | BANKRUPTCY      | TREATISES & EXPLANATIONS                                     |
      | PRACTICE OF LAW | CONTRACT DRAFTING & OPINION LETTERS TREATISES & EXPLANATIONS |

  @CU-32491
  Scenario Outline: Verify magnifier icon appears after hovering over link on content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Icon" should be visible

    Examples:
      | Practice Area   | Box Title                                                    |
      | BANKRUPTCY      | TREATISES & EXPLANATIONS                                     |
      | PRACTICE OF LAW | CONTRACT DRAFTING & OPINION LETTERS TREATISES & EXPLANATIONS |

  @CU-32492
  Scenario Outline: Verify magnifier icon appears after hovering over title of dropdown-type content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Title"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Header Icon" should be visible

    Examples:
      | Practice Area | Box Title             |
      | HEALTHCARE    | MEDICARE AND MEDICAID |

  @CU-32493
  Scenario Outline: Verify magnifier icon appears after hovering over link on dropdown-type content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should contain "- SELECT -" ignoring case ignoring whitespaces
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Loading Indicator" should not be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Icon" should be visible

    Examples:
      | Practice Area | Box Title                       |
      | LIFE SCIENCES | FOOD DRUG COSMETIC LAW REPORTER |

  @CU-32494
  Scenario Outline: Verify magnifier icon appears after hovering over title of double dropdown-type content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Title"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Header Icon" should be visible

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32495
  Scenario Outline: Verify magnifier icon appears after hovering over link on double dropdown-type content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I move mouse over "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Quick Select Icon" should be visible

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

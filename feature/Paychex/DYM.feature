@px
@dym
@smoke
Feature: DYM

  @CU-33065
  Scenario Outline: [PX] DYM suggests 2 terms without autocorrection
    * I am logged in
    * I type "<SearchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<SearchTerm>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "Did you mean <Suggestion1> or <Suggestion2> ?"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm>" ignoring case
    * I click "Results Toolbar > Auto Correction Header >#<Suggestion2> in Suggestions"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion2>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Highlight1>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Highlight2>" ignoring case

    Examples:
      | SearchTerm     | Suggestion1    | Suggestion2    | Highlight1 | Highlight2 |
      | mani safes     | many safes     | main safes     | safe       | main       |
      | lige science   | life science   | line science   | line       | science    |
      | business grang | business grant | business grand | business   | grand      |

  @CU-39536
  Scenario Outline: [PX] Auto correction is applied for a term with 0 results
    * I am logged in
    * I type "<SearchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<Suggestion>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "0 results for <SearchTerm>"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Suggestion>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Highlight2>" ignoring case

    Examples:
      | SearchTerm | Suggestion | Highlight2  |
      | embloyee   | employee   | worker      |
      | arcansas   | arkansas   | arkansas    |
      | covit-19   | covid-19   | coronavirus |

  @CU-39572
  Scenario Outline: [PX] Auto correction is applied for a term with >0 results
    * I am logged in
    * I type "<SearchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<Suggestion>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "Search instead for <SearchTerm>"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Suggestion>" ignoring case

    Examples:
      | SearchTerm | Suggestion |
      | Govenment  | government |
      | pregancy   | pregnancy  |

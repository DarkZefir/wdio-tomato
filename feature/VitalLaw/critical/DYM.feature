@critical_path
@mvl
@DYM
Feature: DYM

  @CU-37581
  @local
  Scenario Outline: DYM suggests 2 terms without autocorrection
    * I am logged in
    * I am on "<PA>" PA
    * I perform search of "<SearchTerm>"
    * "Results Toolbar > Auto Correction Header" should be visible
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<SearchTerm>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "Did you mean <Suggestion1> or <Suggestion2> ?"
    * I click "Results Toolbar > Auto Correction Header > #<SuggestionToClick> in Suggestions"
    * I wait until "Loading Indicator" is gone
    * Placeholder text for "Search Bar > Search Input" should contain "<SuggestionToClick>"
    * Text in collection of "Highlighted Phrases" should contain "<Highlight1>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Highlight2>" ignoring case
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SuggestionToClick>" ignoring case

    Examples:
      | PA                          | SearchTerm     | Suggestion1    | Suggestion2    | SuggestionToClick | Highlight1 | Highlight2 |
      | ALL CONTENT                 | mani safes     | many safes     | main safes     | many safes        | safe       | many       |
      | SECURITIES - FEDERAL        | mani safes     | many safes     | main safes     | main safes        | safe       | main       |
      | PROPERTY & CONSTRUCTION LAW | big sistem     | big system     | big sister     | big system        | big        | system     |
      | HEALTH CARE                 | business grang | business grant | business grand | business grand    | business   | grand      |

  @CU-39542
  Scenario Outline: Auto correction is applied for a term with 0 results
    * I am logged in
    * I am on "<PA>" PA
    * I type "<SearchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * "Results Toolbar > Auto Correction Header" should be visible
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<Suggestion>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "0 results for <SearchTerm>"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Suggestion>" ignoring case
    * Text in collection of "Highlighted Phrases" should contain "<Highlight2>" ignoring case

    Examples:
      | PA                  | SearchTerm | Suggestion | Highlight2      |
      | ALL CONTENT         | embloyee   | employee   | worker          |
      | TAX - FEDERAL       | embloyee   | employee   | worker          |
      | TAX - STATE & LOCAL | privocy    | privacy    | confidentiality |
      | SECURITIES - ALL    | covit-19   | covid-19   | coronavirus     |

  @CU-37582
  Scenario Outline: DYM is not shown if auto correction is applied for a term
    * I am logged in
    * I am on "<PA>" PA
    * I type "<term>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "<correctedTerm>"
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "<correctedTerm>"
    * Text of "Results Toolbar > Auto Correction Header > Original Search Query" should contain "<term>"
    * Text of "Results Toolbar > Auto Correction Header" should not contain "Did you mean"

    Examples:
      | PA          | term    | correctedTerm |
      | ALL CONTENT | buiness | business      |

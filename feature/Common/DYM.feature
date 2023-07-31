@smoke
@ipa
@mvl @vlcc
@DYM
Feature: DYM1


  @CU-39582 @CU-39579
  Scenario Outline: DYM suggests 1 term without autocorrection
    * I am logged in
    # Perform search from a PA
    * I am on "<PA>" PA
    * I perform search of "<SearchTerm>"
    # Verify that "Auto Correction Header" is displayed under "Search" field and contains search term and "Did you mean <Suggestion> ?" text
    * "Results Toolbar > Auto Correction Header" should be visible
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<SearchTerm>”"
    * Text of "Results Toolbar > Auto Correction Header" should contain "Did you mean <Suggestion> ?"
    # Verify that one pill in "Searh Bar" with <SearchTerm> is displayed
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm>" ignoring case
    # Verify that highlighted pharses in the results contain <SearchTerm>
    * Text in collection of "Highlighted Phrases" should contain "<SearchTerm>" ignoring case
    # Click suggested <Suggestion> autocorrected term in "Auto Correction Header"
    * I click "Results Toolbar > Auto Correction Header > #<Suggestion> in Suggestions"
    # Verify that <Suggestion> term is displayed in Toolbar
    * Text of "Results Toolbar > Search Query" should contain "<Suggestion>"
    # Verify that the only pill in "Searh Bar" with <Suggestion> is displayed
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion>" ignoring case
    # Verify that highlighted pharses in the results contain <Suggestion>
    * Text in collection of "Highlighted Phrases" should contain "<Suggestion>" ignoring case

    Examples:
      | PA                     | SearchTerm | Suggestion |
      | ALL CONTENT            | Ameriga    | america    |
      | INTELLECTUAL PROPERTY  | blokchain  | blockchain |
    #   | Health Care          |   |    |
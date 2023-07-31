@smoke
@ipa
@mvl @vlcc
@DYM
Feature: DYM2

  @CU-39576 @CU-39575
  Scenario Outline: Auto correction is applied for a term with >0 results
    * I am logged in
    # Navigate to <PA> Practice Area
    * I am on "<PA>" PA
    # Perform search of <SearchTerm>
    * I type "<SearchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    # Verify that "Did you mean" section is displayed under "Search" field
    * "Results Toolbar> Auto Correction Header" should be visible
    # Verify that "Auto Corrected Search" area contains “<Suggestion>” text
    * Text of "Results Toolbar > Auto Correction Header > Auto Corrected Search" should contain "“<Suggestion>”"
    # Verify that "Auto Correction Header" contains "Search instead for <SearchTerm>" text
    * Text of "Results Toolbar > Auto Correction Header" should contain "Search instead for <SearchTerm>"
    # Verify that text of the only displayed search pill is <Suggestion>
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Suggestion>" ignoring case
    # Verify that highlighted pharses in the results contain <Suggestion> text
    * Text in collection of "Highlighted Phrases" should contain "<Suggestion>" ignoring case

    Examples:
      | PA                                       | SearchTerm | Suggestion |
      | ALL CONTENT                              | Bankrupcy  | bankruptcy |
      | EMPLOYEE BENEFITS                        | Bankrupcy  | bankruptcy |
      | GOVERNMENT CONTRACTS                     | Govenment  | government |
      | SEXUAL HARASSMENT & WORKPLACE COMPLIANCE | pregancy   | pregnancy  |
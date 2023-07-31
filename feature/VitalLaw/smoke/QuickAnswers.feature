@smoke
@mvl
@ipa
@quick_answers
Feature: Quick Answers

  @CU-32036
  @local
  Scenario Outline: Verify that Quick Answers are displayed on SRL
    * I am logged in
    * I am on "<paName>" PA
    * I perform search of "<searchTerm>"
    * "Quick Answer" should be visible
    * Each element of "Quick Answer Titles" should contain "<searchTerm>" ignoring case

    Examples:
      | paName           | searchTerm          |
      | ALL CONTENT      | stock               |
      | SECURITIES - ALL | accredited investor |
      | TAX - FEDERAL    | medical deduction   |

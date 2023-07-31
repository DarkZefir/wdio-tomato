@smoke
@vlcc
@quick_answers
Feature: Quick Answers

  @CU-32339
  Scenario Outline: [VLCC] Verify that Quick Answers are displayed on SRL
    * I am logged in
    * I am on "<paName>" PA
    * I perform search of "<searchTerm>"
    * "Quick Answer" should be visible
    * Each element of "Quick Answer Titles" should contain "<searchTerm>" ignoring case

    Examples:
      | paName        | searchTerm        |
      | ALL CONTENT   | stock             |
      | TAX           | medical deduction |
      | Life Sciences | special control   |

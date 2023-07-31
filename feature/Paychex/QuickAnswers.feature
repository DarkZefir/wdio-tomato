@smoke
@px
@quick_answers
Feature: Quick Answers

  @CU-33064
  Scenario Outline: [PX] Verify that Quick Answers are displayed on SRL
    * I am logged in
    * I perform search of "<searchTerm>"
    * "#1 of Quick Answer Titles" should be visible
    * Each element of "Quick Answer Titles" should contain "<searchTerm>" ignoring case

    Examples:
      | searchTerm |
      | stock      |
      | credit     |

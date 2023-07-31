@smoke
@px
@news
Feature: News

  @CU-33098
  Scenario: [PX] Verify that 'News' dropdown contains only 'Newsletters' item
    * I am logged in
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * Text of "Header > News Dropdown > #1 of List" should not be "Loading ..."
    * I should see the following lines in "Header > News Dropdown > List":
      | Newsletters |
    * "Header > News Dropdown > #2 of List" should not be visible

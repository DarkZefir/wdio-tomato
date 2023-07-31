@smoke
@vlcc
@dashboard
Feature: Dashboard 7

  @CU-38024
  Scenario Outline: [VLCC] Verify CSH Dashboard Layout <PA> part1
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                           |
      | Banking                      |
      | Bankruptcy                   |
      | Consumer Law                 |
      | Contracts & Forms            |
      | Corporate Governance         |
      | Corporate Law                |
      | Cybersecurity & Privacy VLCC |

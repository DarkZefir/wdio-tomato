@smoke
@vlcc
@dashboard
Feature: Dashboard 9

  @CU-38046
  Scenario Outline: [VLCC] Verify CSH Dashboard Layout <PA> part3
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                                       |
      | Products Liability & Insurance C3        |
      | Real Estate & Construction               |
      | Securities - Federal                     |
      | Securities - State                       |
      | Sexual Harassment & Workplace Compliance |
      | Tax                                      |
      | Telecommunications                       |
      | Torts                                    |
      | Trade & Advertising                      |
      | Transportation                           |

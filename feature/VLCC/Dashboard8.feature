@smoke
@vlcc
@dashboard
Feature: Dashboard 8

  @CU-38044
  Scenario Outline: [VLCC] Verify CSH Dashboard Layout <PA> part2
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                                        |
      | Distribution & Franchise                  |
      | Employee Benefits                         |
      | Energy                                    |
      | Food, Drugs & Cosmetics / Medical Devices |
      | Government Contracts                      |
      | Health Care                               |
      | HR, Labor & Employment                    |
      | Intellectual Property                     |
      | Life Sciences                             |
      | Litigation                                |
      | Mergers & Acquisitions                    |
      | Payroll                                   |

@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-34859
  Scenario Outline: Verify that "Agency Rules" box is displayed on dashboards (part1)
    * I am logged in
    * I am on "<PA>" PA
    * "Agency Rules Box" should be visible
    * Text of "Agency Rules Box > Header Title" should be "AGENCY RULES"
    * Text of "Agency Rules Box > Header Sub Title" should be "Powered by Federal Developments Knowledge Center"
    Examples:
      | PA                                       |
      | IP - WK TRADEMARK NAVIGATOR              |
      | BANKING & CONSUMER FINANCE               |
      | ANTITRUST & COMPETITION                  |
      | SECURITIES - ALL                         |
      | FAMILY LAW                               |
      | TAX - ESTATES, GIFTS & TRUSTS            |
      | SEXUAL HARASSMENT & WORKPLACE COMPLIANCE |

  @CU-34860
  Scenario Outline: Verify that "Agency Rules" box is displayed on dashboards (part2)
    * I am logged in
    * I am on "<PA>" PA
    * "Agency Rules Box" should be visible
    * "Agency Rules Box" should be visible
    * Text of "Agency Rules Box > Header Title" should be "AGENCY RULES"
    * Text of "Agency Rules Box > Header Sub Title" should be "Powered by Federal Developments Knowledge Center"
    Examples:
      | PA                                        |
      | ENERGY & ENVIRONMENT                      |
      | GOVERNMENT CONTRACTS                      |
      | HUMAN RESOURCES                           |
      | INTELLECTUAL PROPERTY                     |
      | TELECOMMUNICATIONS                        |
      | TAX - FEDERAL                             |
      | TAX - ALL                                 |
      | SECURITIES - FEDERAL & INTERNATIONAL      |
      | SECURITIES - CORPORATION LAW & GOVERNANCE |
      | PRODUCTS LIABILITY & INSURANCE            |
      | LABOR & EMPLOYMENT LAW                    |


@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-29128
  Scenario Outline: Verify that "Practice Tools" box is displayed on dashboards (part1)
    * I am logged in
    * I am on "<pa>" PA
    * "Practice Tools Box" should be visible
    * Text of "Practice Tools Box > Header" should be "PRACTICE TOOLS"
    * "Practice Tools Box > Customize" should be visible
    Examples:
      | pa                             |
      | ANTITRUST & COMPETITION        |
      | BANKING & CONSUMER FINANCE     |
      | BANKRUPTCY                     |
      | ELDER & ESTATES LAW            |
      | FAMILY LAW                     |
      | HEALTHCARE                     |
      | GOVERNMENT CONTRACTS           |
      | HEALTH REFORM KNOWLEDGE CENTER |
      | HUMAN RESOURCES                |

  @CU-29388
  Scenario Outline: Verify that "Practice Tools" box is displayed on dashboards (part2)
    * I am logged in
    * I am on "<pa>" PA
    * "Practice Tools Box" should be visible
    * Text of "Practice Tools Box > Header" should be "PRACTICE TOOLS"
    * "Practice Tools Box > Customize" should be visible
    Examples:
      | pa                                        |
      | SECURITIES - CORPORATION LAW & GOVERNANCE |
      | SECURITIES - FEDERAL & INTERNATIONAL      |
      | SECURITIES - STATE                        |
      | SEXUAL HARASSMENT & WORKPLACE COMPLIANCE  |
      | TAX - ALL                                 |
      | TAX - FEDERAL                             |
      | TAX - INTERNATIONAL                       |
      | TAX - STATE & LOCAL                       |

  @CU-29371
  Scenario Outline: Verify that "Practice Tools" box is displayed  on dashboards (part3)
    * I am logged in
    * I am on "<pa>" PA
    * "Practice Tools Box" should be visible
    * Text of "Practice Tools Box > Header" should be "PRACTICE TOOLS"
    * "Practice Tools Box > Customize" should be visible
    Examples:
      | pa                             |
      | PRODUCTS LIABILITY & INSURANCE |
      | PROPERTY & CONSTRUCTION LAW    |
      | PRACTICE OF LAW                |
      | KLUWER INTERNATIONAL TAX LAW   |
      | LABOR & EMPLOYMENT LAW         |
      | LIFE SCIENCES                  |
      | LITIGATION                     |
      | PAYROLL & ENTITLEMENTS         |
      | PENSION & EMPLOYEE BENEFITS    |
      | INTELLECTUAL PROPERTY          |
      | IP - WK TRADEMARK NAVIGATOR    |

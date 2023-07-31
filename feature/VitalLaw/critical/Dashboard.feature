@critical_path
@mvl
Feature: Dashboard

  @CU-37089
  Scenario Outline: Verify CSH Dashboard Layout <PA>
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                           |
      | Pension & Employee Benefits  |
      | Technical Answer Group - TAG |

  @CU-37090
  Scenario Outline: Verify CSH Dashboard Layout <PA>
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                                        |
      | Antitrust & Competition                   |
      | Securities - Corporation Law & Governance |
      | Securities - Federal & International      |
      | Securities - State                        |
      | Intellectual Property                     |
      | Litigation                                |
      | Tax - International                       |
      | Tax - State & Local                       |
      | Scion Reference Publications              |
      | Banking & Consumer Finance                |

  @CU-37091
  Scenario Outline: Verify CSH Dashboard Layout <PA>
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                             |
      | Government Contracts           |
      | Tax - Federal                  |
      | Tax - Estates, Gifts & Trusts  |
      | Products Liability & Insurance |
      | Human Resources                |
      | Payroll & Entitlements         |
      | Labor & Employment Law         |
      | Practice Of Law                |
      | Life Sciences                  |
      | Property & Construction Law    |
      | Transportation                 |
      | Bankruptcy                     |

  @CU-37092
  Scenario Outline: Verify CSH Dashboard Layout <PA>
    * I am logged in
    * I am on "<PA>" PA
    * I verify csh data for "<PA>" PA

    Examples:
      | PA                                       |
      | Energy & Environment                     |
      | Family Law                               |
      | Elder & Estates Law                      |
      | Healthcare                               |
      | Cybersecurity & Privacy                  |
      | Blue Chip                                |
      | Telecommunications                       |
      | Health Reform Knowledge Center           |
      | IP - WK Trademark Navigator              |
      | Blockchain & Virtual Currencies          |
      | Sexual Harassment & Workplace Compliance |
      | Kluwer International Tax Law             |

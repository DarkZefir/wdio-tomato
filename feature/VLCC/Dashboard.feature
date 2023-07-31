@smoke
@vlcc
@dashboard
Feature: Dashboard

  @CU-32232
  Scenario: [VLCC] Verify UI of All Content
    * I am logged in
    * I am on "All content" PA
    # Check that Practice Areas Box is visible
    * "Practice Areas Box" should be visible
    # Check that VLCC Tools Box is visible
    * "Vlcc Tools Box" should be visible
    # Check that VLCC Quick Answers Box is visible
    * "Vlcc Quick Answers Box" should be visible
    # Check that VLCC Find A Case Box is visible
    * "Vlcc Find A Case Box" should be visible
    # Check that VLCC Primary Law Box is visible
    * "Vlcc Primary Law Box" should be visible
    # Check that #1 of News Headlines Box is visible
    * "#1 of News Headlines Box" should be visible
    # Check that Ukraine Crisis Box is visible
    * "Ukraine Crisis Box" should be visible

  @CU-32693
  @logout
  Scenario: [VLCC] Verify List of PAs in All Content Practice Areas box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I am on "All content" PA
    * "Practice Areas Box" should be visible
    * Text of "Practice Areas Box > Title" should be "TOPICS"
    * I should see the following lines in "Practice Areas Box > Practice Area Links":
      | Banking                                   |
      | Bankruptcy                                |
      | Consumer Law                              |
      | Contracts & Forms                         |
      | Corporate Governance                      |
      | Corporate Law                             |
      | COVID-19 Resources                        |
      | Cybersecurity & Privacy                   |
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
      | Products Liability & Insurance            |
      | Real Estate & Construction                |
      | Securities - Federal                      |
      | Securities - State                        |
      | Sexual Harassment & Workplace Compliance  |
      | Tax                                       |
      | Telecommunications                        |
      | Torts                                     |
      | Trade & Advertising                       |
      | Transportation                            |

  @CU-32717
  Scenario Outline: [VLCC] Verify List of items in Primary Law box on Practice Areas
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Vlcc Primary Law Box" should be visible
    * Text of "Vlcc Primary Law Box > Title" should be "PRIMARY LAW"
    * I should see the following lines in "Vlcc Primary Law Box > Links" ignoring order:
      | United States Code          |
      | Code of Federal Regulations |
      | Federal Register            |
      | Federal Cases               |
      | State Law                   |
      | Other Primary Law           |

    Examples:
      | Practice Area            |
      | All Content              |
      | Distribution & Franchise |
      | Life Sciences            |
      | Torts                    |

  @CU-32797
  Scenario: [VLCC] Verify News Headlines Box on All Content
    * I am logged in
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "CORPORATE COUNSEL DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-34247
  Scenario Outline: [VLCC] Verify that correct DA is opened when user clicks on News Headlines widget Title
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box" should be visible
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                            | Daid           | Index |
      | Cybersecurity & Privacy VLCC             | WKUS_TAL_16517 | 1     |
      # | Sexual Harassment & Workplace Compliance | WKUS_TAL_18575 | 1     |
      | All Content                              | WKUS_TAL_17896 | 1     |
      | Telecommunications                       | WKUS_TAL_17792 | 1     |
      | Life Sciences                            | WKUS_TAL_6444  | 1     |
      | Securities - Federal                     | WKUS_TAL_6445  | 1     |
      # | Securities - Federal                     | WKUS_TAL_20137 | 2     |
      # | Bankruptcy                               | WKUS_TAL_20135 | 1     |
      | Health Care                              | WKUS_TAL_6444  | 1     |
      | Health Care                              | WKUS_TAL_20136 | 2     |

  @CU-34233
  Scenario Outline: [VLCC] Verify that "Sample Forms" widget is displayed on specific PAs
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Sample Forms Box" should be visible
    * Text of "Sample Forms Box > Title" should be "SAMPLE FORMS"

    Examples:
      | Practice Area            |
      | EMPLOYEE BENEFITS        |
      | Contracts & Forms        |
      | HR, Employment and Labor |
      | Intellectual Property    |
      | Litigation               |

  @CU-34251
  Scenario: [VLCC] Verify that user can perform search from Sample Forms widget
    * I am logged in
    * I open base url with "#/home/IP"
    * "Sample Forms Box" should be visible
    * I type "*" in "Sample Forms Box > Search Term Input"
    * I click "Sample Forms Box > Search Button"
    * "Results Toolbar > Hit Count" should be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Document Type: Sample Forms"

  @CU-32798
  Scenario Outline: [VLCC] Verify Find A Case Box on Practice Areas
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Vlcc Find A Case Box > Title" should be visible
    * Text of "Vlcc Find A Case Box > Title" should be "FIND A CASE"
    * "Vlcc Find A Case Box > Search By Dropdown" should be visible
    * "Vlcc Find A Case Box > Search Term Input" should be visible
    * "Vlcc Find A Case Box > Go Button" should be visible
    * "Vlcc Find A Case Box > Go Button" should not be enabled
    * I click "Vlcc Find A Case Box > Search By Dropdown"
    * "Vlcc Find A Case Box > Search By Dropdown > #1 of Items" should be visible
    * I should see the following lines in "Vlcc Find A Case Box > Search By Dropdown > Items":
      | Case Cite |
      | Keyword   |

    Examples:
      | Practice Area         |
      | All Content           |
      | Consumer Law          |
      | Intellectual Property |
      | Life Sciences         |
      | Securities - Federal  |
      | Securities - State    |
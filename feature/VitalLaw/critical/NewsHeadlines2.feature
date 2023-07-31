@critical_path
@mvl
Feature: News Headlines 2

  @CU-29159
  Scenario: Verify that "News Headlines" box is displayed on Blockchain & Virtual Currencies PA dashboard
    * I am logged in
    * I am on "BLOCKCHAIN & VIRTUAL CURRENCIES" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "BLOCKCHAIN NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-32641
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection title #1
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * Text of "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders" should be "<Box Title>" ignoring case
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                   | Box Title                     | Daid           | Index |
      | ANTITRUST & COMPETITION         | Antitrust Law Daily           | WKUS_TAL_6443  | 1     |
      | Banking & Consumer Finance      | Banking and Finance Law Daily | WKUS_TAL_6959  | 1     |
      | Blockchain & Virtual Currencies | Blockchain News               | WKUS_TAL_18578 | 1     |
      | Health Reform Knowledge Center  | Health Reform EDGE            | WKUS_TAL_7820  | 1     |
      | Healthcare                      | Health Law Daily              | WKUS_TAL_6444  | 1     |
      | Intellectual Property           | IP Law Daily                  | WKUS_TAL_17068 | 1     |
      | IP - WK Trademark Navigator     | Trademark Daily News          | WKUS_TAL_8815  | 1     |
      | COVID-19 RESOURCES              | COVID-19 NEWS                 | WKUS_TAL_19546 | 1     |

  @CU-32642
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection title #2
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * Text of "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders" should be "<Box Title>" ignoring case
    * I scroll "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders" to center of the window
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of SubHeaders"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                             | Box Title                         | Daid           | Index |
      | Labor & Employment Law                    | Labor & Employment Law Daily      | WKUS_TAL_14871 | 1     |
      | Life Sciences                             | Health Law Daily                  | WKUS_TAL_6444  | 1     |
      | Products Liability & Insurance            | Product Liability Daily           | WKUS_TAL_6949  | 1     |
      | Scion Reference Publications              | Health Reform EDGE                | WKUS_TAL_7820  | 1     |
      | Securities - All                          | Securities Regulation Daily       | WKUS_TAL_6445  | 1     |
      | Securities - Corporation Law & Governance | Corporation Law & Governance News | WKUS_TAL_17924 | 1     |
      | Securities - Federal & International      | Securities Regulation Daily       | WKUS_TAL_6445  | 1     |
      | Securities - State                        | Blue Sky Regulation News          | WKUS_TAL_11804 | 1     |

  @CU-32643
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection title #3
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#<Index1> of News Headlines Box > #<Index2> of SubSections > #1 of Read All Articles Buttons" should be visible
    * Text of "#<Index1> of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * Text of "#<Index1> of News Headlines Box > #<Index2> of SubSections > #1 of SubHeaders" should be "<Box Title>" ignoring case
    * I click "#<Index1> of News Headlines Box > #<Index2> of SubSections > #1 of SubHeaders"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                            | Box Title                                         | Daid           | Index1 | Index2 |
      | Sexual Harassment & Workplace Compliance | Sexual Harassment News                            | WKUS_TAL_18575 | 1      | 1      |
      | Tax - Federal                            | Federal Tax Day                                   | WKUS_TAL_1334  | 1      | 1      |
      | Tax - State & Local                      | State Tax Day                                     | WKUS_TAL_1338  | 1      | 1      |
      | Technical Answer Group - TAG             | TAG NEWS                                          | WKUS_TAL_18890 | 1      | 1      |
      | Kluwer International Tax Law             | Global Daily Tax News                             | WKUS_TAL_13719 | 1      | 1      |
      | Kluwer International Tax Law             | Transfer Pricing Daily                            | WKUS_TAL_8612  | 1      | 2      |
      | Kluwer International Tax Law             | Global VAT News                                   | WKUS_TAL_7267  | 1      | 3      |
      | Tax - All                                | Federal Tax Day                                   | WKUS_TAL_1334  | 1      | 1      |
      | Tax - All                                | Global Daily Tax News                             | WKUS_TAL_13719 | 1      | 2      |
      | HEALTHCARE                               | LAW FIRM PERSPECTIVES FOR HEALTHCARE: US & GLOBAL | WKUS_TAL_20136 | 2      | 1      |
      | BANKRUPTCY                               | LAW FIRM PERSPECTIVES FOR BANKRUPTCY: US & GLOBAL | WKUS_TAL_20135 | 1      | 1      |

  @CU-32644
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection title #4
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#<Index1> of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Text of "#<Index1> of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * Text of "#<Index1> of News Headlines Box > #<Index2> of SubSections > #1 of SubHeaders" should be "<Box Title>" ignoring case
    * I click "#<Index1> of News Headlines Box > #<Index2> of SubSections > #1 of SubHeaders"
    * I wait until "Loading Indicator" is gone
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                        | Box Title                                         | Daid           | Index1 | Index2 |
      | COVID-19 Resources                   | COVID-19 NEWS                                     | WKUS_TAL_19546 | 1      | 1      |
      | Tax - All                            | Transfer Pricing Daily                            | WKUS_TAL_8612  | 1      | 3      |
      | Tax - All                            | Global VAT News                                   | WKUS_TAL_7267  | 1      | 4      |
      | Tax - All                            | State Tax Day                                     | WKUS_TAL_1338  | 1      | 5      |
      | Tax - Estates, Gifts & Trusts        | Federal Tax Day                                   | WKUS_TAL_1334  | 1      | 1      |
      | Tax - Estates, Gifts & Trusts        | State Tax Day                                     | WKUS_TAL_1338  | 1      | 2      |
      | Tax - International                  | Global Daily Tax News                             | WKUS_TAL_13719 | 1      | 1      |
      | Tax - International                  | Transfer Pricing Daily                            | WKUS_TAL_8612  | 1      | 2      |
      | Tax - International                  | Global VAT News                                   | WKUS_TAL_7267  | 1      | 3      |
      | Telecommunications                   | TR Daily                                          | WKUS_TAL_17792 | 1      | 1      |
      | Telecommunications                   | TR State NewsWire                                 | WKUS_TAL_17790 | 1      | 2      |
      | Securities - Federal & International | LAW FIRM PERSPECTIVES FOR SECURITIES: US & GLOBAL | WKUS_TAL_20137 | 2      | 1      |
@critical_path
@mvl
Feature: News Headlines 5

  @CU-29423
  Scenario: Verify that "News Headlines" box is displayed on Securities - State PA dashboard
    * I am logged in
    * I am on "SECURITIES - STATE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "BLUE SKY REGULATION NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-32657
  Scenario Outline: Verify that popup is opened by click on "Sign Up" #1
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * I click "#1 of News Headlines Box > Header SignUp"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "<Tab>"

    Examples:
      | Practice Area                   | Tab     |
      | ANTITRUST & COMPETITION         | DAILIES |
      | Banking & Consumer Finance      | DAILIES |
      | Blockchain & Virtual Currencies | DAILIES |
      | Health Reform Knowledge Center  | DAILIES |
      | Healthcare                      | DAILIES |
      | Intellectual Property           | DAILIES |
      | IP - WK Trademark Navigator     | DAILIES |
      | Labor & Employment Law          | DAILIES |

  @CU-32658
  Scenario Outline: Verify that popup is opened by click on "Sign Up" #2
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#<Index> of News Headlines Box > Header SignUp" should be visible
    * I click "#<Index> of News Headlines Box > Header SignUp"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "<Tab>"

    Examples:
      | Practice Area                        | Tab         | Index |
      | Life Sciences                        | DAILIES     | 1     |
      | Products Liability & Insurance       | DAILIES     | 1     |
      | Scion Reference Publications         | DAILIES     | 1     |
      | Securities - All                     | DAILIES     | 1     |
      | Securities - Federal & International | DAILIES     | 1     |
      | Securities - Federal & International | NEWSLETTERS | 2     |
      | Securities - State                   | DAILIES     | 1     |
      | Telecommunications                   | DAILIES     | 1     |
      | BANKRUPTCY                           | NEWSLETTERS | 1     |
      | Healthcare                           | NEWSLETTERS | 2     |

  @CU-32659
  Scenario Outline: Verify that popup is opened by click on "Sign Up" #3
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * I click "#1 of News Headlines Box > Header SignUp"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "<Tab>"

    Examples:
      | Practice Area                            | Tab         |
      | Tax - Federal                            | NEWSLETTERS |
      | Tax - State & Local                      | NEWSLETTERS |
      | Kluwer International Tax Law             | NEWSLETTERS |
      | Tax - All                                | NEWSLETTERS |
      | Tax - Estates, Gifts & Trusts            | NEWSLETTERS |
      | Tax - International                      | NEWSLETTERS |
      | Sexual Harassment & Workplace Compliance | NEWSLETTERS |
      | COVID-19 Resources                       | DAILIES     |

  @CU-32660
  Scenario Outline: Verify that "Customize News Headlines" popup is opened by click on "Gear" icon
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > Header Customize" should be visible
    * I click "#1 of News Headlines Box > Header Customize"
    * "Customize News Headlines Popup" should be visible
    * Text of "Customize News Headlines Popup > Title" should be "Customize News Headlines" ignoring case
    * Text of "Customize News Headlines Popup > Group Label" should contain "Number of headlines to display"
    * "Customize News Headlines Popup > Save And Close" should be visible
    * "Customize News Headlines Popup > Cancel" should be visible
    * "Customize News Headlines Popup > X Close Button" should be visible
    * "Customize News Headlines Popup > Dropdown" should be visible

    Examples:
      | Practice Area                             |
      | Technical Answer Group - TAG              |
      | Securities - Corporation Law & Governance |

  @CU-35690
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection link
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons" should be visible
    * I remember number of "#1 of News Headlines Box > #<Index> of SubSections > Links" as "numOfLinks"
    * I remember random integer below "{$numOfLinks}" as "linkToClick"
    * I remember text of "#1 of News Headlines Box > #<Index> of SubSections > #{$linkToClick} of Links" as "title"
    * I remember "href" attribute of "#1 of News Headlines Box > #<Index> of SubSections > #{$linkToClick} of Links" as "linkUrl"
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #{$linkToClick} of Links"
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value
    * I remember current url as "docUrl"
    * "{$docUrl}" text should contain "<Daid>" text

    Examples:
      | Practice Area      | Daid           | Index |
      | COVID-19 Resources | WKUS_TAL_19546 | 1     |

  @CU-42501
  Scenario Outline: Verify that correct DA is opened when user clicks any link on News Headlines widget
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#<Index> of News Headlines Box" should be visible
    * I remember number of "#<Index> of News Headlines Box > #1 of SubSections > Links" as "links"
    * I click "#<Index> of News Headlines Box > #1 of SubSections > #{$randomInt(1, $links)} of Links"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                        | Daid           | Index |
      | Securities - Federal & International | WKUS_TAL_6445  | 1     |
      | Securities - Federal & International | WKUS_TAL_20137 | 2     |
      | Bankruptcy                           | WKUS_TAL_20135 | 1     |
      | Healthcare                           | WKUS_TAL_6444  | 1     |
      | Healthcare                           | WKUS_TAL_20136 | 2     |

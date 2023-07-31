@critical_path
@mvl
Feature: News Headlines 3

  @CU-32649
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection link #1
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
      | Practice Area                   | Daid           | Index |
      | ANTITRUST & COMPETITION         | WKUS_TAL_6443  | 1     |
      | Banking & Consumer Finance      | WKUS_TAL_6959  | 1     |
      | Blockchain & Virtual Currencies | WKUS_TAL_18578 | 1     |
      | Health Reform Knowledge Center  | WKUS_TAL_7820  | 1     |
      | Healthcare                      | WKUS_TAL_6444  | 1     |
      | Intellectual Property           | WKUS_TAL_17068 | 1     |
      | IP - WK Trademark Navigator     | WKUS_TAL_8815  | 1     |
      | Labor & Employment Law          | WKUS_TAL_14871 | 1     |
      | COVID-19 Resources              | WKUS_TAL_19546 | 1     |

  @CU-32650
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection link #2
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
      | Practice Area                             | Daid           | Index |
      | Life Sciences                             | WKUS_TAL_6444  | 1     |
      | Products Liability & Insurance            | WKUS_TAL_6949  | 1     |
      | Scion Reference Publications              | WKUS_TAL_7820  | 1     |
      | Securities - All                          | WKUS_TAL_6445  | 1     |
      | Securities - Corporation Law & Governance | WKUS_TAL_17924 | 1     |
      | Securities - Federal & International      | WKUS_TAL_6445  | 1     |
      | Securities - State                        | WKUS_TAL_11804 | 1     |
      | Sexual Harassment & Workplace Compliance  | WKUS_TAL_18575 | 1     |
      | COVID-19 Resources                        | WKUS_TAL_19546 | 1     |

  @CU-32651
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection link #3
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
      | Practice Area                | Daid           | Index |
      | COVID-19 Resources           | WKUS_TAL_19546 | 1     |
      | Tax - Federal                | WKUS_TAL_1334  | 1     |
      | Tax - State & Local          | WKUS_TAL_1338  | 1     |
      | Technical Answer Group - TAG | WKUS_TAL_18890 | 1     |
      | Kluwer International Tax Law | WKUS_TAL_13719 | 1     |
      | Kluwer International Tax Law | WKUS_TAL_8612  | 2     |
      | Kluwer International Tax Law | WKUS_TAL_7267  | 3     |
      | Tax - All                    | WKUS_TAL_1334  | 1     |
      | Tax - All                    | WKUS_TAL_13719 | 2     |
      | Tax - All                    | WKUS_TAL_8612  | 3     |

  @CU-32652
  Scenario Outline: Verify that appropriate document is opened by click on "NEWS HEADLINES" subsection link #4
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
      | Practice Area                 | Daid           | Index |
      | Tax - All                     | WKUS_TAL_7267  | 4     |
      | Tax - All                     | WKUS_TAL_1338  | 5     |
      | Tax - Estates, Gifts & Trusts | WKUS_TAL_1334  | 1     |
      | Tax - Estates, Gifts & Trusts | WKUS_TAL_1338  | 2     |
      | Tax - International           | WKUS_TAL_13719 | 1     |
      | Tax - International           | WKUS_TAL_8612  | 2     |
      | Tax - International           | WKUS_TAL_7267  | 3     |
      | Telecommunications            | WKUS_TAL_17792 | 1     |
      | Telecommunications            | WKUS_TAL_17790 | 2     |

  @CU-32653
  Scenario Outline: Verify that appropriate document is opened by click on "Read All Articles Button" #1
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons" should be visible
    * I scroll "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons" to center of the window
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                   | Daid           | Index |
      | ANTITRUST & COMPETITION         | WKUS_TAL_6443  | 1     |
      | Banking & Consumer Finance      | WKUS_TAL_6959  | 1     |
      | Blockchain & Virtual Currencies | WKUS_TAL_18578 | 1     |
      | Health Reform Knowledge Center  | WKUS_TAL_7820  | 1     |
      | Healthcare                      | WKUS_TAL_6444  | 1     |
      | Intellectual Property           | WKUS_TAL_17068 | 1     |
      | IP - WK Trademark Navigator     | WKUS_TAL_8815  | 1     |
      | Labor & Employment Law          | WKUS_TAL_14871 | 1     |
      | COVID-19 Resources              | WKUS_TAL_19546 | 1     |

  @CU-32654
  Scenario Outline: Verify that appropriate document is opened by click on "Read All Articles Button" #2
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#<Index> of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * I click "#<Index> of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons"
    * "Document Frame > Title" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                             | Daid           | Index |
      | COVID-19 Resources                        | WKUS_TAL_19546 | 1     |
      | Life Sciences                             | WKUS_TAL_6444  | 1     |
      | Products Liability & Insurance            | WKUS_TAL_6949  | 1     |
      | Scion Reference Publications              | WKUS_TAL_7820  | 1     |
      | Securities - All                          | WKUS_TAL_6445  | 1     |
      | Securities - Corporation Law & Governance | WKUS_TAL_17924 | 1     |
      | Securities - Federal & International      | WKUS_TAL_6445  | 1     |
      | Securities - Federal & International      | WKUS_TAL_20137 | 2     |
      | Securities - State                        | WKUS_TAL_11804 | 1     |
      | Sexual Harassment & Workplace Compliance  | WKUS_TAL_18575 | 1     |
      | HEALTHCARE                                | WKUS_TAL_20136 | 2     |
      | BANKRUPTCY                                | WKUS_TAL_20135 | 1     |

  @CU-32655
  Scenario Outline: Verify that appropriate document is opened by click on "Read All Articles Button" #3
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons" should be visible
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                | Daid           | Index |
      | Tax - Federal                | WKUS_TAL_1334  | 1     |
      | Tax - State & Local          | WKUS_TAL_1338  | 1     |
      | Technical Answer Group - TAG | WKUS_TAL_18890 | 1     |
      | Kluwer International Tax Law | WKUS_TAL_13719 | 1     |
      | Kluwer International Tax Law | WKUS_TAL_8612  | 2     |
      | Kluwer International Tax Law | WKUS_TAL_7267  | 3     |
      | Tax - All                    | WKUS_TAL_1334  | 1     |
      | Tax - All                    | WKUS_TAL_13719 | 2     |
      | Tax - All                    | WKUS_TAL_8612  | 3     |

  @CU-32656
  Scenario Outline: Verify that appropriate document is opened by click on "Read All Articles Button" #4
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #<Index> of SubSections" should be visible
    * "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons" should be visible
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #1 of Read All Articles Buttons"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                 | Daid           | Index |
      | Tax - All                     | WKUS_TAL_7267  | 4     |
      | Tax - All                     | WKUS_TAL_1338  | 5     |
      | Tax - Estates, Gifts & Trusts | WKUS_TAL_1334  | 1     |
      | Tax - Estates, Gifts & Trusts | WKUS_TAL_1338  | 2     |
      | Tax - International           | WKUS_TAL_13719 | 1     |
      | Tax - International           | WKUS_TAL_8612  | 2     |
      | Tax - International           | WKUS_TAL_7267  | 3     |
      | Telecommunications            | WKUS_TAL_17792 | 1     |
      | Telecommunications            | WKUS_TAL_17790 | 2     |

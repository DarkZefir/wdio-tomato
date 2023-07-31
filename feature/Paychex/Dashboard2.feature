@smoke
@px
@dashboard
Feature: Dashboard 2

  @CU-33223
  Scenario: [PX] Verify Hot Topics Box on Home Page
    * I am logged in
    * "Px Hot Topics Box" should be visible
    * Text of "Px Hot Topics Box > Title" should be "HOT TOPICS"
    * Count of "Px Hot Topics Box > Links" should be equal to "10"
    * I should see the following lines in "Px Hot Topics Box > Links":
      | 2023 Proposed Budget                           |
      | Adverse impact of unpredictable work schedules |
      | Cryptocurrency                                 |
      | Depreciation                                   |
      | Filing Deadlines                               |
      | Minimum Wage                                   |
      | Omnibus Spending Bill                          |
      | SECURE Act 2.0                                 |
      | Sources of workplace privacy                   |
      | Top 10 workplace law predictions for 2022      |

  @CU-33224
  Scenario Outline: [PX] Verify correct document is opened from Hot Topics Box
    * I am logged in
    * "Px Hot Topics Box > Title" should be visible
    * I click "Px Hot Topics Box > #<title> in Links"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "<id>" text ignoring case
    Examples:
      | title                                          | id                                      |
      | Adverse impact of unpredictable work schedules | b22261b87e2410009718000d3a8b5a8e01      |
      | Sources of workplace privacy                   | 09013e2c875874b7                        |
      | Top 10 workplace law predictions for 2022      | pyn01289d572c7e101000859a000d3a8abb4e01 |

  @CU-33225
  Scenario Outline: [PX] Verify text of search pill is the same as link text from Hot Topics Box & sorting is correct
    * I am logged in
    * "Px Hot Topics Box > Title" should be visible
    * I remember text of "Px Hot Topics Box > #<index> of Links" as "linkText"
    * I click "Px Hot Topics Box > #<index> of Links"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills" should match "{$linkText}"
    * Text of "Sorting Menu Button" should be "<sorting>" ignoring case
    Examples:
      | index | sorting            |
      | 1     | Most Recent on Top |
      | 3     | Most Recent on Top |
      | 4     | Relevance          |
      | 5     | Relevance          |
      | 6     | Relevance          |
      | 8     | Most Recent on Top |

  @CU-42494
  Scenario: [PX] Verify external link in Hot Topics Box
    * I am logged in
    * "Px Hot Topics Box > Title" should be visible
    * I remember "href" attribute of "Px Hot Topics Box > #Omnibus Spending Bill in Links" as "href"
    * "{$href}" text should be equal to "https://www.wolterskluwer.com/en/expert-insights/senate-joins-house-in-passing-omnibus-spending-bill" text

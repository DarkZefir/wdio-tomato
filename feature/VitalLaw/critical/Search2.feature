@critical_path
@mvl
Feature: Search

  @CU-31484
  Scenario Outline: Verify Recency and Relevancy sorting on results page
    * I am logged in
    * I perform search of "state tax addback"
    * "Sorting Menu" should be visible
    * I click "Sorting Menu Button"
    * I click "#<sortingType> in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"

    Examples:
      | sortingType        | expectedValue      |
      | Most Recent on Top | MOST RECENT ON TOP |
      | Oldest on Top      | OLDEST ON TOP      |
      | Relevance          | RELEVANCE          |

  @CU-31486
  Scenario: Verify DocType sorting on results page
    * I am logged in
    * I perform search of "tax addback"
    * "Sorting Menu" should be visible
    * I click "Sorting Menu Button"
    * I click "#Document Type in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "DOCUMENT TYPE"
    * Count of "Cluster" should be more than "1"
    * I remember number of "Cluster" as "clusters"
    * Count of "Cluster > Cluster Header" should be equal to "{$clusters}"
    * Count of "Cluster > Documents" should be more than "{$clusters}"
    * "Other Document Types Hint" should be visible

  @CU-31493
  Scenario: Verify elements of DocType cluster when sorting on results page
    * I am logged in
    * I perform search of "tax addback" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Document Type > Topic Pages                  |
    * "Sorting Menu Button" should be clickable
    * I click "Sorting Menu Button"
    * I click "#Document Type in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "DOCUMENT TYPE"
    * Count of "Cluster" should be equal to "2"
    * Count of "Cluster > See All Cluster Results Link" should be equal to "2"
    * I remember index of "Cluster > Cluster Name" matching "EXPLANATIONS AND ANNOTATIONS" as "index1"
    * I remember index of "Cluster > Cluster Name" matching "TOPIC PAGES" as "index2"
    * Count of "#{$index1} of Cluster > Documents" should be equal to "3"
    * Count of "#{$index2} of Cluster > Documents" should be equal to "3"
    * Count of "#{$index2} of Cluster > Snippets" should be equal to "3"

  @CU-31494
  Scenario Outline: Verify See All Cluster results button
    * I am logged in
    * I perform search of "<term>" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
      | SELECT FILTERS > Document Type > Topic Pages                  |
    * "Sorting Menu Button" should be clickable
    * I click "Sorting Menu Button"
    * I click "#Document Type in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "DOCUMENT TYPE"
    * Count of "Cluster" should be equal to "2"
    * I remember index of "Cluster > Cluster Name" matching "EXPLANATIONS AND ANNOTATIONS" as "indexSeeAll"
    * I click "#{$indexSeeAll} of See All Cluster Results Links"
    * I wait until "Loading Indicator" is gone
    * Count of "Cluster" should be equal to "1"
    * Text of "#1 of Cluster > #1 of Cluster Name" should match "EXPLANATIONS AND ANNOTATIONS"
    * Count of "Cluster > Documents" should be more than "3"

    Examples:
      | term            |
      | Pension Schemes |

  @CU-31495
  Scenario Outline: Verify that selected sorting type persists during session
    * I am logged in
    * I perform search of "state tax addback"
    * "Sorting Menu" should be visible
    * I click "Sorting Menu Button"
    * I click "#<sortingType> in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"
    * I click "Header > Home"
    * I perform search of "newspaper"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"

    Examples:
      | sortingType        | expectedValue      |
      | Most Recent on Top | MOST RECENT ON TOP |
      | Oldest on Top      | OLDEST ON TOP      |
      | Relevance          | RELEVANCE          |
      | Document Type      | DOCUMENT TYPE      |


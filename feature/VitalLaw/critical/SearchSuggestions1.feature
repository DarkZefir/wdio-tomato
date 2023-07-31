@critical_path
@mvl
Feature: Search Suggestions 1

  @CU-31673
  Scenario Outline: Verify Titles and Most Relevant Clusters in Advance search overlay
    * I am logged in
    * I am on "<pa>" PA
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I type "<term>" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Advanced Search Popup > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Advanced Search Popup > Search Suggestions > Recent Searches Cluster" should not be visible
    * "Advanced Search Popup > Search Suggestions > Most Relevant Cluster" should be visible
    * Text of "Advanced Search Popup > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * Count of "Advanced Search Popup > Search Suggestions > Titles Cluster > Suggestions" should be more than "0"
    * Count of "Advanced Search Popup > Search Suggestions > Most Relevant Cluster > Suggestions" should be more than "0"

    Examples:
      | pa                                       | term     |
      | Blockchain & Virtual Currencies          | block    |
      | Kluwer International Tax Law             | Transfer |
      | Sexual Harassment & Workplace Compliance | Federal  |
      | Technical Answer Group - TAG             | pension  |

  @CU-31678
  Scenario Outline: Verify that Advanced Search suggestions can be closed by clicking outside
    * I am logged in
    * I am on "<pa>" PA
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I type "" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * "Advanced Search Popup > Search Suggestions > Recent Searches Cluster" should be visible
    * I click "Advanced Search Popup > Search Title"
    * "Advanced Search Popup > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "<term>" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * "Advanced Search Popup > Search Suggestions > Titles Cluster" should be visible
    * "Advanced Search Popup > Search Suggestions > Most Relevant Cluster" should be visible
    * I click "Advanced Search Popup > Search Title"
    * "Advanced Search Popup > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Advanced Search Popup > Search Suggestions > Titles Cluster" should not be visible

    Examples:
      | pa                                       | term     |
      | Blockchain & Virtual Currencies          | block    |
      | Kluwer International Tax Law             | Transfer |
      | Sexual Harassment & Workplace Compliance | Federal  |
      | Technical Answer Group - TAG             | pension  |

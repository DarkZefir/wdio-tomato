@critical_path
@mvl
Feature: Search Suggestions

  @CU-29747
  Scenario: Verify that Global search is rerun correctly from Recent searches list (pre-,post Global search filters applied)
    * I am logged in
    * I disable thesaurus
    * I open base url with "#/home/Tax"
    * "Search Bar > Advanced Search" should be clickable
    * "Content Box > #1 of Main Content Types > #1 of Content Types" should be visible
    * I perform search of "Pension" with the following presearch filters:
      | SELECT FILTERS > Document Type > Explanations and Annotations |
    * "#JURISDICTION in Filter Groups > #2 of Show Subtypes" should be clickable
    * I click "#JURISDICTION in Filter Groups > #2 of Show Subtypes"
    * "#JURISDICTION in Filter Groups > #1 of Filter Items" should be visible
    * I click "#JURISDICTION in Filter Groups > #New York in Filter Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Pension"
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I open base url with "#/home/Tax"
    * I wait until "Loading Indicator" is gone
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be more than "0"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "Pension"
    * I click "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "Pension"
    * Text of "Session Navigator" should be "TAX - ALL"
    * Each element of "Highlighted Phrases" should contain "pension" ignoring case
    * "Search Bar > #1 of PreSearch Filters" should not be visible

  @CU-31633
  Scenario Outline: Verify Recent Searches in Advance search overlay
    * I am logged in
    * I am on "<pa>" PA
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I type "" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Advanced Search Popup > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * Count of "Advanced Search Popup > Search Suggestions > Recent Searches Cluster > Suggestions" should be more than "0"
    * Count of "Advanced Search Popup > Search Suggestions > Recent Searches Cluster > Suggestions > Time" should be more than "0"

    Examples:
      | pa                                       |
      | Blockchain & Virtual Currencies          |
      | Kluwer International Tax Law             |
      | Pension & Employee Benefits              |
      | Sexual Harassment & Workplace Compliance |
      | Technical Answer Group - TAG             |

  @CU-31635
  Scenario: Verify that Recent Searches are displayed when search input is cleared
    * I am logged in
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" as "suggestion"
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Time" as "time"
    * I type "new" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions" should be visible
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I click "Search Bar > Search Delete"
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should be "{$suggestion}"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Time" should be "{$time}"

  @CU-31663
  @local
  Scenario Outline: Verify that user can run search by selecting suggestion with keyboard from Most Relevant Cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Most Relevant Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Most Relevant Cluster > Cluster Title" should be "Most Relevant"
    * Count of "Search Bar > Search Suggestions > Most Relevant Cluster > Suggestions" should be equal to "5"
    * I send sequence of keys "ArrowDown, ArrowDown" to element "Search Bar > Search Input"
    * I remember text of "Search Bar > Search Suggestions > Most Relevant Cluster > #2 of Suggestions > Text" as "suggestion"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$suggestion}"
    * "#1 of Search Result Items" should be visible
    * Count of "Search Result Items" should be equal to "25"
    * "Problem Encountered Popup" should not be visible

    Examples:
      | term        |
      | safe harbor |

  @CU-31670
  @local
  Scenario Outline: Verify that user can open document by selecting suggestion with keyboard from Titles Cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * I send sequence of keys "ArrowDown" to element "Search Bar > Search Input"
    * I remember text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" as "suggestion"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "DA Title" should be "{$suggestion}" ignoring case ignoring whitespaces
    * "Problem Encountered Popup" should not be visible

    Examples:
      | term                             |
      | Virginia State Tax Reporter 2000 |

  @CU-31677
  Scenario: Verify that Search suggestions can be closed by clicking outside
    * I am logged in
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * I click "Header > User Menu"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * I type "tax" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should be visible
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should be visible
    * I click "Header > User Menu"
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible


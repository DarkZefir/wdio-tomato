@critical_path
@mvl
Feature: Search 4

  @CU-29833
  @local
  Scenario Outline: Verify search results - Author Operator Search
    * I am logged in
    * I am on "TAX - ALL" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I should see "author" metadata parameter with "<metadataValue>" value

    Examples:
      | searchTerm                            | metadataValue       |
      | "federal agency" AND author: Rattiner | Jeffrey H. Rattiner |

  @CU-29835
  @local
  Scenario Outline: Verify search results - from-to search operator
    * I am logged in
    * I am on "TAX - INTERNATIONAL" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * I type " <dateOperator>" in "Search Bar > Search Input"
    * "Search Bar > Search Button" should be clickable
    * I click "Search Bar > Search Button"
    * Count of "Documents" should be more than "0"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "sort-date" metadata parameter as "sortdate"
    * "{$sortdate}" date should be before or the same as "<dateTo>"
    * "{$sortdate}" date should be after or the same as "<dateFrom>"

    Examples:
      | searchTerm    | dateOperator                            | dateFrom   | dateTo     |
      | "Protocol #3" | from 1990 to 91                         | 1990-01-01 | 1991-12-31 |
      | "Protocol #3" | from 09/10/91 to 12/91                  | 1991-09-10 | 1991-12-31 |
      | "Protocol #3" | income from Sep 10, 1991 to December 91 | 1991-09-10 | 1991-12-31 |

  @CU-29850
  @local
  Scenario Outline: Proximity search operator - f proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Problem Encountered Popup" should not be visible
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should match "<searchTerm>" ignoring whitespaces

    Examples:
      | searchTerm           |
      | credit f/200 foreign |
      | credit f/1 foreign   |

  @CU-29851
  @local
  Scenario Outline: Proximity search operator - p proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Problem Encountered Popup" should not be visible
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should match "<searchTerm>" ignoring whitespaces

    Examples:
      | searchTerm           |
      | foreign p/200 credit |
      | foreign p/63 credit  |
      | foreign p/1 credit   |

  @CU-29831
  @local
  Scenario: State Search Operator
    * I am logged in
    * I am on "LITIGATION" PA
    * I disable thesaurus
    * I perform search of ""AND SURVIVORSHIP ACTIONS" and st:(California or Idaho)"
    * Count of "Documents" should be more than "1"
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"
    * "#{$jurisdiction} of Filter Groups > More Label" should not be visible
    * I click "#{$jurisdiction} of Filter Groups > #1 of Show Subtypes"
    * Each element of "#{$jurisdiction} of Filter Groups > Subtypes Label" should match "(California|Idaho)" ignoring case

@critical_path
@mvl
Feature: Search

  @CU-29714
  Scenario: Verify no results page
    * I am logged in
    * I type "asjdfkjdfljww" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "No Results Text" should be visible
    * Text of "No Results Text" should be "There are no results for your query."

  @CU-29718
  Scenario: Verify Search filed - clear text button
    * I am logged in
    * I type "search term" in "Search Bar > Search Input"
    * "Search Bar > Search Delete" should be visible
    * Value in "Search Bar > Search Input" should be "search term"
    * I click "Search Bar > Search Delete"
    * Value in "Search Bar > Search Input" should be ""

  @CU-29810
  @local
  Scenario Outline: Verify that results are correct for term in quotes
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * "Search Bar > Search Button" should be clickable
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Each element of "Highlighted Phrases" should match "<containsTerm>" ignoring case

    Examples:
      | searchTerm                                  | containsTerm                               |
      | "marital deduction" "against public policy" | (marital deduction\|against public policy) |
      | "marital deduction"                         | marital deduction                          |

  @CU-29817
  @local
  Scenario: AND search operator from 'All Content'
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "cease AND violation"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * Each element of "Highlighted Phrases" should match "(cease|violation)" ignoring case
    * Each element of "Documents" should contain "cease" ignoring case
    * Each element of "Documents" should contain "violation" ignoring case

  @CU-29818
  @local
  Scenario: OR search operator from 'All Content'
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "redemption or agreement"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * Each element of "Highlighted Phrases" should match "(redemption|agreement)" ignoring case

  @CU-29822
  @local
  Scenario: Verify that search works correctly with NOT operator from All Content
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "rico not puerto"
    * I type "rico not puerto" in "Search Bar > Search Input"
    * Count of "Documents" should be more than "0"
    * Each element of "Highlighted Phrases" should match "rico(?!.puerto)" ignoring case
    * Each element of "Highlighted Phrases" should contain "rico" ignoring case

  @CU-29827
  @local
  Scenario: Search Operator "Title" - Financial disclosure
    * I am logged in
    * I am on "PENSION & EMPLOYEE BENEFITS" PA
    * I disable thesaurus
    * I perform search of "title: "Financial disclosure""
    * Count of "Documents" should be more than "0"
    * Each element of "Documents > Document Title" should match "Financial disclosure" ignoring case

  @CU-29832
  @local
  Scenario Outline: Doctype Search Operator
    * I am logged in
    * I am on "SECURITIES - ALL" PA
    * I disable thesaurus
    * I perform search of "<Search Term>"
    * "Results Toolbar > Hit Count" should be visible
    * Each element of "Document Type" should match "<Expected metadata value>" ignoring case

    Examples:
      | Search Term                  | metadata-field      | Expected metadata value |
      | doctype: Case                | condor:documentType | Cases                   |
      | Doctype: "Acts and Statutes" | condor:documentType | Acts and Statutes       |


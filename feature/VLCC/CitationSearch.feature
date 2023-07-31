@smoke
@smoke_1
@vlcc
@ipa
@citation_search
Feature: Citation Search

  @CU-32571
  @local
  Scenario Outline: [VLCC] Verify user is able to do global citation search
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "<Search Term>"
    * Count of "Citation Results" should be more than "0"
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should contain "<Search Term>" ignoring whitespaces

    Examples:
      | Search Term   |
      | IRC Sec. 9502 |
      | irc 1441      |
      | sec. 531      |

  @CU-32569
  @local
  Scenario Outline: [VLCC] Verify user is able to open document from Citation Matches
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "<Search Term>"
    * Count of "Citation Results" should be more than "0"
    * I click "#1 of Citation Results"
    * I click "Show Metadata"
    * Text of "Document Frame" should contain "<Search Term>" ignoring case ignoring whitespaces

    Examples:
      | Search Term      |
      | 15 U.S.C. §77b-1 |
      | IRC Sec. 1441    |

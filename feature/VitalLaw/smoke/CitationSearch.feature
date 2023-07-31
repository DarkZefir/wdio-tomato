@smoke
@mvl
@ipa
@citation_search
Feature: Citation Search

  @CU-32499
  @local
  Scenario Outline: Verify user is able to do global citation search
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    # Perform search of <Search Term> from examples
    * I perform search of "<Search Term>"
    # Verify that number of Citation Results is more than 0
    * Count of "Citation Results" should be more than "0"
    * "Results Toolbar > Search Information Icon" should be clickable
    # Click on "Search Information Icon"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    # Verify that Search Queries in "Search Information Popup" contains <Search Term> from examples
    * Text of "Search Information Popup > Search Queries" should contain "<Search Term>" ignoring whitespaces

    Examples:
      | Practice Area           | Search Term     |
      | ALL CONTENT             | 1934 Act, 0-10  |
      | TAX - ALL               | irc 1441        |
      | ANTITRUST & COMPETITION | FTC Act, Sec. 3 |

  @CU-32500
  @local
  Scenario Outline: Verify user is able to open document from Citation Matches
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    # Perform search of <Search Term> from examples
    * I perform search of "<Search Term>"
    * Count of "Citation Results" should be more than "0"
    # Click #1 of Citation Results
    * I click "#1 of Citation Results"
    # Open documents metadata by click on "Show Metadata"
    * I click "Show Metadata"
    # Verify that "Document Frame contain <Search Term> from  examples
    * Text of "Document Frame" should contain "<Search Term>" ignoring case ignoring whitespaces

    Examples:
      | Practice Area           | Search Term         |
      | ALL CONTENT             | 17 C.F.R. §240.0-10 |
      | TAX - ALL               | I.R.C. §1441        |
      | ANTITRUST & COMPETITION | 15 U.S.C. §18       |

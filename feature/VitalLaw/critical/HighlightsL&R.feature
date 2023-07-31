@critical_path
@mvl
@Highlighted
Feature: Highlighted

  @CU-40082
  @local
  Scenario Outline: Search term is highlighted in Doc View for L&R from SRL
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search for the search term
    * I perform search of "<SearchTerm2>"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    # Open the doc
    * I click "#1 of Documents"
    # Search term should be highlighted in doc view
    * "Document Frame > Title" should be visible
    * Text in collection of "Document Frame > Highlights" should contain "<SearchTerm2>" ignoring case

    Examples:
      | SearchTerm1                                 | SearchTerm2 |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | determining |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | Section     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | succeeding  |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | mediation   |

  @CU-40083
  Scenario Outline: Search & search within terms are highlighted in Doc View for L&R
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search for the search term
    * I perform search of "<SearchTerm2>"
    * "#1 of Documents" should be visible
    # Search within for another search term
    * I perform search of "<SearchTerm3>"
    * "#1 of Documents" should be visible
    # Open the first doc
    * I wait until "Loading Indicator" is gone
    * I click "#1 of Documents"
    * "Document Frame > Title" should be visible
    # All search terms should be highlighted
    * Text in collection of "Document Frame > Highlights" should contain "<SearchTerm1>" ignoring case
    * Text in collection of "Document Frame > Highlights" should contain "<SearchTerm2>" ignoring case
    * Text in collection of "Document Frame > Highlights" should contain "<SearchTerm3>" ignoring case

    Examples:
      | SearchTerm1 | SearchTerm2 | SearchTerm3    |
      | locomotives | steam       | chains         |
      | law         | pregnancy   | discrimination |
      | bee         | honey       | parasite       |

  @CU-40084
  Scenario Outline: Search terms in Doc View for L&R are not highlighted when checkbox is not checked
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search for the search term
    * I perform search of "<SearchTerm2>"
    * "#1 of Documents" should be visible
    # Search within for another search term
    * I perform search of "<SearchTerm3>"
    * "#1 of Documents" should be visible
    * I wait until "Loading Indicator" is gone
    # Open the first doc
    * I click "#1 of Documents"
    # All search terms should be highlighted
    * "Document Frame > Title" should be visible
    # # Uncheck "Highlight search term" checkbox
    *  I click "Toolbar > Highlight Checkbox"
    # Search terms should not be highlighted
    * "Document Frame > Disabled Highlights" should be visible

    Examples:
      | SearchTerm1 | SearchTerm2 | SearchTerm3    |
      | locomotives | steam       | chains         |
      | law         | pregnancy   | discrimination |
      | bee         | honey       | parasite       |

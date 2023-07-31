@smoke
@mvl
@Highlighted
Feature: Highlighted

  @CU-40080
  Scenario Outline: Active highlighted search terms in Doc View for L&R are switching with navigation buttons
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search within for another search term
    * I perform search of "<SearchTerm2>"
    * "#1 of Documents" should be visible
    # Search within for another search term
    * I perform search of "<SearchTerm3>"
    * "#1 of Documents" should be visible
    # Search within for another search term
    * I perform search of "<SearchTerm4>"
    * I wait until "Loading Indicator" is gone
    # Open the first doc
    * I click "#1 of Documents"
    # SearchTerm2 should be active highlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm2>" ignoring case
    # Click "Next" button on the navigation panel
    * I click "Toolbar > Next Highlight Button"
    # SearchTerm3 should be active highlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm3>" ignoring case
    # Click "Next" button on the navigation panel
    * I click "Toolbar > Next Highlight Button"
    # SearchTerm4 should be active highlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm4>" ignoring case
    # Click "Previous" button on the navigation panel
    * I click "Toolbar > Previous Highlight Button"
    # SearchTerm3 should be active highlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm3>" ignoring case
    # Click "Previous" button on the navigation panel
    * I click "Toolbar > Previous Highlight Button"
    # SearchTerm2 should be active highlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm2>" ignoring case

    Examples:
      | SearchTerm1                                 | SearchTerm2 | SearchTerm3 | SearchTerm4 |
      | us-law-e04ca2666db80ed0cf55080692b5de74-v1  | state       | Congress    | subsequent  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | Section     | Public      | National    |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | succeeding  | October     | corporation |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | opposing    | division    | documents   |

  @CU-40081
  Scenario Outline: Page is scrolled to the first highlighted search term when opening L&R doc from SRL
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search for the search term
    * I perform search of "<SearchTerm2>"
    * I wait until "Loading Indicator" is gone
    # Open the first doc
    * I click "#1 of Documents"
    # SearchTerm2 should be active higlight
    * Text of "Document Frame > Selected Highlight" should be "<SearchTerm2>" ignoring case
    # Page should be scrolled down to the 1st highlight
    * "Document Frame > Selected Highlight" should be visible

    Examples:
      | SearchTerm1                                 | SearchTerm2 |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | whenever    |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | purpose     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | forth       |
      | nv-regs-4dbc9ab49a411492f6ec39b363331ea9-v1 | documents   |

@smoke
@mvl @vlcc @px
@history_overlay
Feature: History Overlay 1

  @CU-29735 @CU-32318 @CU-33081
  Scenario Outline: Verify that document title is present in History overlay on top position
    * I am logged in
    # Open <DocID> doc
    * I open "<DocID>" document
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    # Click "X Close" button in "History" popup
    * I click "History Popup > X Close Button"
    * "History Popup" should not be visible
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify that First item in "History" popup contains <Title> of the opened doc
    * Text of "History Popup > #1 of Items" should be "<Title>" ignoring case

    Examples:
      | DocID                 | Title                                               |
      | lfl0109013e2c8457beb0 | Labor Relations Federal Laws, FEDERAL CREDIT UNIONS |

  @CU-29742 @CU-32326 @CU-33083
  Scenario: Verify that search is present in History overlay on top position
    * I am logged in
    # Perform search of 'tax' term
    * I perform search of "'tax'"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "'tax'"
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is dipslayed
    * "History Popup" should be visible
    # Verify that test of First item displayed in "History" popup is "SEARCH: 'tax'"
    * Text of "History Popup > #1 of Items" should be "SEARCH: 'tax'" ignoring case

  @CU-29734 @CU-32328 @CU-33085
  Scenario Outline: Verify that document title is present in History dropdown on top position
    * I am logged in
    # Open <DocID> document
    * I open "<DocID>" document
    # Navigate to "Home" page
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that First item in "History" dropdown contains <Title> text of the opened doc
    * Text of "Header > History Dropdown > #1 of Items Title" should be "<Title>" ignoring case

    Examples:
      | DocID                 | Title                                               |
      | lfl0109013e2c8457beb0 | Labor Relations Federal Laws, FEDERAL CREDIT UNIONS |


  @CU-29740 @CU-32330 @CU-33087
  Scenario: Verify that search is present in History dropdown on top position
    * I am logged in
    # Perform search of "golden"
    * I perform search of "golden"
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that First item in "History" dropdown contains "SEARCH: golden" text
    * Text of "Header > History Dropdown > #1 of Items Title" should be "SEARCH: golden" ignoring case

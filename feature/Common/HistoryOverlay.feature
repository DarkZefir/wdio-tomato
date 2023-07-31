@smoke
@mvl @vlcc @px
@history_overlay
Feature: History Overlay

  @CU-29789 @CU-32317 @CU-33080
  Scenario Outline: Verify that Search Within is present in History overlay on top position
    * I am logged in
    #Opens document
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    #Performs search within document
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I click "Header > Home"
    #Verifies History overlay
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * Text of "History Popup > #1 of Items" should contain "SEARCH: <searchTerm>" ignoring case

    Examples:
      | DocID                 | searchTerm |
      | qsc0109013e2c8452f6c9 | credit     |

  @CU-29785 @CU-32325 @CU-33082
  Scenario Outline: Verify that Saved search is present in History overlay on top position
    * I am logged in
    * "Search Bar > Search Input" should be visible
    # Search for <searchTerm>
    * I perform search of "<searchTerm>"
    # Click "Save This Search" button
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * "Save This Search Popup > Input" should be clickable
    # Input "CU-29785" text into "Input" field of "Save This Search" popup
    * I type "CU-29785" in "Save This Search Popup > Input"
    # Click "Save & Close" button
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    * "Header > Saved Items Dropdown" should be visible
    # Click "Saved Items" in Header
    * I click "Header > Saved Items Dropdown"
    # Click "Saved Searches" item in opened dropdown
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    # Verify that "Saved Searches" popup is displayed
    * "Saved Searches Popup" should be visible
    # Verify that text of the First item in "Saved Searches" popup is "CU-29785"
    * Text of "Saved Searches Popup > #1 of Items > Name" should be "CU-29785"
    # Click First item's name in "Saved Searches" popup
    * I click "Saved Searches Popup > #1 of Items > Name"
    # Verify that number of results is displayed
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in displayed dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify that text of First item in "History" popup is "SAVED SEARCH: CU-29785"
    * Text of "History Popup > #1 of Items > Link" should be "SAVED SEARCH: CU-29785" ignoring case

    Examples:
      | searchTerm |
      | pension    |

  @CU-29784 @CU-32327 @CU-33084
  Scenario Outline: Verify that Saved search is present in History dropdown on top position
    * I am logged in
    # Search for <searchTerm>
    * I perform search of "<searchTerm>"
    * "Results Toolbar > Hit Count" should be visible
    # Click "Save This Search" button
    * I click "Results Toolbar > Save Search Button"
    * I click "Save This Search Popup > Title"
    # Input "CU-29784" text into Input field of opened "Save This Search" popup
    * I type "CU-29784" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    # Click "Save & Close" button
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "Saved Items" in Header
    * I click "Header > Saved Items Dropdown"
    # Click "Saved Searches" item in displayed dropdown
    * I click "Header > Saved Items Dropdown >#Saved Searches in Items"
    # Verify that "Saved Searches" popup is displayed
    * "Saved Searches Popup" should be visible
    # Verify that First item's name in "Saved Searches" popup is "CU-29784"
    * Text of "Saved Searches Popup >#1 of Items > Name" should be "CU-29784"
    # Click First item's name
    * I click "Saved Searches Popup > #1 of Items > Name"
    # Verify that results number is displayed in Toolbar
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that First title's item displayed in "History" dropdown contains "SAVED SEARCH: CU-29784" text
    * Text of "Header > History Dropdown >#1 of ItemsTitle" should be "SAVED SEARCH: CU-29784" ignoring case

    Examples:
      | searchTerm |
      | pension    |

  @CU-29788 @CU-32329 @CU-33086
  Scenario Outline: Verify that Search Within is present in History dropdown on top position
    * I am logged in
    #Opens document
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    #Performs search within document
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I click "Header > Home"
    #Verifies History dropdown
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "SEARCH: <searchTerm>" ignoring case

    Examples:
      | DocID                 | searchTerm |
      | qsc0109013e2c8452f6c9 | credit     |

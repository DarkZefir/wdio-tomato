@critical_path
@mvl
Feature: History Overlay 1

  @CU-29773
  Scenario Outline: Verify that Search Case Database is rerun from History dropdown
    * I am logged in
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "Search Case Databases Box > Search Term" should be visible
    * I scroll "Search Case Databases Box > Search Term" to center of the window
    * I type "<searchCaseDatabasesTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Case Databases:"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Case Databases:"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | searchCaseDatabasesTerm |
      | tax                     |

  @CU-29787
  Scenario Outline: Verify that Saved search is rerun correctly from History overlay
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29787" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * Text of "Saved Searches Popup > #1 of Items > Name" should be "CU-29787"
    * I click "Saved Searches Popup > #1 of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > #1 of Items > Link"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | searchTerm |
      | pension    |

  @CU-29786
  Scenario Outline: Verify that Saved search is rerun correctly from History dropdown
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-29786" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Home"
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * Text of "Saved Searches Popup > #1 of Items > Name" should contain "CU-29786"
    * I click "Saved Searches Popup > #1 of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | searchTerm |
      | pension    |

  @CU-29792
  Scenario Outline: Verify that Search Within is rerun correctly from History overlay
    * I am logged in
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > #1 of Items > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: All Content"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "<docTitle>"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"
    * I click "Search Information Popup > Close Button"
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | DocID                 | searchTerm | docTitle              |
      | pir0109013e2c83d8fb85 | credit     | Internal Revenue Code |

  @CU-29790
  Scenario Outline: Verify that Search Within is rerun correctly from History dropdown
    * I am logged in
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I wait 5 seconds
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * I wait 5 seconds
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: All Content"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "<docTitle>"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | DocID                 | searchTerm | docTitle              |
      | pir0109013e2c83d8fb85 | credit     | Internal Revenue Code |

  @CU-32802
  Scenario: Verify that document opened from OPSC template is logged in History
    * I am logged in
    * I open "tes01b48ff1cc7c6c1000925cd8d385ad169402" topics document
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Smart Charts Widget" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "#1 of Results Nodes" should be visible
    * "Utility Bar" should be visible
    * "#1 of Results Nodes > #1 of Headers" should be visible
    * I click "#1 of Citation Links"
    * "Document Frame > Title" should be visible
    * I remember text of "Document Frame > Title" as "title"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "Alabama State Tax Reporter, Al... 810-27-1-.10, Property Factor" ignoring case
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * Text of "History Popup > #1 of Items" should contain "{$title}" ignoring case ignoring whitespaces

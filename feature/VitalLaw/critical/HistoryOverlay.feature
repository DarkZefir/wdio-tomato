@critical_path
@mvl
Feature: History Overlay

  @CU-29736
  Scenario Outline: Verify that document can be opened from History dropdown
    * I am logged in
    * I open "<DocID>" document
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * I wait until "Loading Indicator" is gone
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "docId"
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocID                                   | Title                                                               |
      | fbl014174eeb47b801000969800215ad7479002 | Federal Banking Laws, 12 U.S.C. Sec. 1, Comptroller of the Currency |

  @CU-29737
  Scenario Outline: Verify that document can be opened from History overlay
    * I am logged in
    * I perform search of "<DocID>"
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * I click "#1 of Documents"
    * I switch to last tab
    * I wait 10 seconds
    * I switch to first tab
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > Close Button"
    * "History Popup" should not be visible
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > #1 of Items > Link"
    * I wait until "Loading Indicator" is gone
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "docId"
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocID                                   | Title                                                               |
      | fbl014174eeb47b801000969800215ad7479002 | Federal Banking Laws, 12 U.S.C. Sec. 1, Comptroller of the Currency |

  @CU-29752
  Scenario Outline: Verify that citation search is rerun from History dropdown
    * I am logged in
    * I am on "TAX - ALL" PA
    * I type "<citationSearch>" in "Citation Lookup Box > Input Field"
    * "Citation Lookup Box > Go Button" should be clickable
    * I click "Citation Lookup Box > Go Button"
    * "Citation Lookup Box" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"

    Examples:
      | citationSearch |
      | 512            |

  @CU-29753
  Scenario Outline: Verify that citation search is rerun from History overlay
    * I am logged in
    * I am on "TAX - ALL" PA
    * I type "<citationSearch>" in "Citation Lookup Box > Input Field"
    * "Citation Lookup Box > Go Button" should be clickable
    * I click "Citation Lookup Box > Go Button"
    * "Citation Lookup Box" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > #1 of Items > Search Information Icon"
    * "Search Information Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: Tax - All"
    * Text of "Search Information Popup" should contain "Citation Lookup: <citationSearch>"
    * I click "Search Information Popup > Close Button"
    * "Search Information Popup" should not be visible
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"
    Examples:
      | citationSearch |
      | 512            |

  @CU-29759
  Scenario Outline: Verify that Citation Builder search is rerun from History dropdown
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    * "Citation Template Search Box" should not be visible
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"

    Examples:
      | citationSearch |
      | 27             |

  @CU-29760
  Scenario Outline: Verify that Citation Builder search is rerun from History overlay
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I click "Search Bar > Citation Search Builder Button"
    * I wait until "Loading Indicator" is gone
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    * "Citation Template Search Box" should not be visible
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > See All" should be visible
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * I click "History Popup > #1 of Items > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: Securities - Federal & International"
    * Text of "Search Information Popup" should contain "Citation Search: Securities Act of 1933 §<citationSearch>"
    * I click "Search Information Popup > Close Button"
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"

    Examples:
      | citationSearch |
      | 27             |

  @CU-29766
  Scenario Outline: Verify that Sample Form search is present in History overlay on top position
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Sample Forms Box" should be visible
    * I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    * I click "Sample Forms Box > #1 of Dropdowns"
    * I remember text of "Sample Forms Box > Active Dropdown > #2 of Items" as "chosenSFTopic"
    * I scroll "Sample Forms Box > Active Dropdown > #2 of Items" to center of the window
    * I click "Sample Forms Box > Active Dropdown > #2 of Items"
    * I type "<sampleFormsearch>" in "Sample Forms Box > Search Term Input"
    * I click "Sample Forms Box > Search Button"
    * "Sample Forms Box" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Sample Forms:"
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
    * Text of "Search Information Popup" should contain "<sampleFormsearch>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: Securities - Federal & International"
    * Text of "Search Information Popup" should contain "Sample Forms"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"
    * I click "Search Information Popup > Close Button"
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Sample Forms:"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"

    Examples:
      | sampleFormsearch |
      | tax              |

  @CU-29774
  Scenario Outline: Verify that Search Case Database is rerun from History overlay
    * I am logged in
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "Search Case Databases Box > Search Term" should be visible
    * I scroll "Search Case Databases Box > Search Term" to center of the window
    * I type "<searchCaseDatabasesTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar" should be visible
    * Text of "Search Bar > Search Title" should be "Case Databases:"
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
    * Text of "Search Information Popup" should contain "<searchCaseDatabasesTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "TTAB Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"
    * I click "Search Information Popup > Close Button"
    * "Search Information Popup" should not be visible
    * I click "History Popup > #1 of Items > Link"
    * "History Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Case Databases:"
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"

    Examples:
      | searchCaseDatabasesTerm |
      | tax                     |

  @CU-29793
  @local
  Scenario: Verify that 10 last records are displayed in History dropdown
    * I am logged in
    * I perform search of "Tax 1"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 2"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 3"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 4"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 5"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 6"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 7"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 8"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 9"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 10"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I perform search of "Tax 11"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"

    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "tax 11" ignoring case
    * Text of "Header > History Dropdown > #2 of Items Title" should contain "tax 10" ignoring case
    * Text of "Header > History Dropdown > #3 of Items Title" should contain "tax 9" ignoring case
    * Text of "Header > History Dropdown > #4 of Items Title" should contain "tax 8" ignoring case
    * Text of "Header > History Dropdown > #5 of Items Title" should contain "tax 7" ignoring case
    * Text of "Header > History Dropdown > #6 of Items Title" should contain "tax 6" ignoring case
    * Text of "Header > History Dropdown > #7 of Items Title" should contain "tax 5" ignoring case
    * Text of "Header > History Dropdown > #8 of Items Title" should contain "tax 4" ignoring case
    * Text of "Header > History Dropdown > #9 of Items Title" should contain "tax 3" ignoring case
    * Text of "Header > History Dropdown > #10 of Items Title" should contain "tax 2" ignoring case
    * "Header > History Dropdown > #11 of Items Title" should not be visible

  @CU-29765
  Scenario Outline: Verify that Sample Form search is rerun from History dropdown
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Sample Forms Box" should be visible
    * I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    * I click "Sample Forms Box > #1 of Dropdowns"
    * I remember text of "Sample Forms Box > Active Dropdown > #2 of Items" as "chosenSFTopic"
    * I scroll "Sample Forms Box > Active Dropdown > #2 of Items" to center of the window
    * I click "Sample Forms Box > Active Dropdown > #2 of Items"
    * I type "<sampleFormsearch>" in "Sample Forms Box > Search Term Input"
    * I click "Sample Forms Box > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Sample Forms Box" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Sample Forms:"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "Sample Forms:"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | sampleFormsearch |
      | tax              |


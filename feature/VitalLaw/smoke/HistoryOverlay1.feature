@smoke
@mvl
@history_overlay
Feature: History Overlay 1

  @CU-29748
  Scenario Outline: Verify that citation search is present in History dropdown on top position
    * I am logged in
    # Navigate to "Tax - ALL" PA
    * I am on "TAX - ALL" PA
    * "Citation Lookup Box > Input Field" should be visible
    # Input <citationSearch> into input field of "Citation Lookup" box
    * I type "<citationSearch>" in "Citation Lookup Box > Input Field"
    # Click "Go" button
    * I click "Citation Lookup Box > Go Button"
    # Verify that "Results" page is displayed
    * "Results Toolbar > Hit Count" should be visible
    * "Citation Matches Header" should be visible
    # Verify that "CITATION MATCHES" text is displayed
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that text of the First item in "History" dropdown contains "CITATION LOOKUP: <citationSearch>"
    * Text of "Header > History Dropdown > #1 of Items Title" should be "CITATION LOOKUP: <citationSearch>" ignoring case

    Examples:
      | citationSearch |
      | 512            |

  @CU-29749
  Scenario Outline: Verify that citation search is present in History overlay on top position
    * I am logged in
    # Navigate to "TAX - ALL" PA
    * I am on "TAX - ALL" PA
    * "Citation Lookup Box > Input Field" should be visible
    # Input <citationSearch> text into input field of "Citation Lookup" box
    * I type "<citationSearch>" in "Citation Lookup Box > Input Field"
    # Click "Go" button
    * "Citation Lookup Box > Go Button" should be clickable
    * I click "Citation Lookup Box > Go Button"
    # Verify that "Results" page is displayed
    * "Results Toolbar > Hit Count" should be visible
    # Verify that "CITATION MATCHES" text is displayed
    * Text of "Citation Matches Header" should be "CITATION MATCHES"
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify that text of First item in "History" popup contains "CITATION LOOKUP: <citationSearch>"
    * Text of "History Popup > #1 of Items > Link" should be "CITATION LOOKUP: <citationSearch>" ignoring case

    Examples:
      | citationSearch |
      | 512            |

  @CU-29755
  Scenario Outline: Verify that Citation Builder search is present in History dropdown on top position
    * I am logged in
    # Navigate to "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    # Click "Citation Search" button
    * I click "Search Bar > Citation Search Builder Button"
    # Verify that "Citation Template Search" box is displayed
    * "Citation Template Search Box" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    # Type <citationSearch> text into First input field of First Citation Template
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    # Click "Go" button appeared next to input field
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    # Verify that "Results" page is opened
    * "Results Toolbar > Hit Count" should be visible
    # Remember text of displayed in Search Bar as "title"
    * I remember text of "Search Bar > Title" as "title"
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that text of First item displayed in "History" dropdown contains "CITATION SEARCH:" text
    * Text of "Header > History Dropdown > #1 of Items Title" should be "CITATION SEARCH: Securities Act of..."
    # Verify that title attribute of First item's title contains {$title} text
    * I remember "title" attribute of "Header > History Dropdown > #1 of Items Title" as "historyTitle"
    * "{$historyTitle}" text should contain "{$title}" text ignoring case

    Examples:
      | citationSearch |
      | 27             |

  @CU-29756
  Scenario Outline: Verify that Citation Builder search is present in History overlay on top position
    * I am logged in
    # Navigate to "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    # Click "Citation Search" button
    * I click "Search Bar > Citation Search Builder Button"
    # Verify that "Citation Template Search" box is displayed
    * "Citation Template Search Box" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    # Type <citationSearch> text into First input field of First Citation Template
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    # Click "Go" button appeared next to input field
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    # Verify that "Results" page is opened
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify that text of First item displayed in "History" popup contains "CITATION SEARCH: Securities Act of 1933 §<citationSearch>"
    * Text of "History Popup > #1 of Items > Link" should be "CITATION SEARCH: Securities Act of 1933 §<citationSearch>" ignoring case

    Examples:
      | citationSearch |
      | 27             |

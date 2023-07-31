@critical_path
@mvl
Feature: Search Case Database

  @CU-29836
  Scenario Outline: Verify that SCD performed correctly. TTAB Case Database and Keyword
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_8805"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #TTAB Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Keyword in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * I wait until "Results Toolbar > Hit Count" is visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "TTAB Case Law Database"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "TTAB Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | tax        |

  @CU-29837
  Scenario Outline: Verify that SCD performed correctly. Federal Circuit Trademark Case Database and Keyword
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_11707"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * I wait until "Results Toolbar > Hit Count" is visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #Federal Circuit Trademark Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Keyword in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal Circuit Trademark Case Law Datab..."
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "Federal Circuit Trademark Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | tax        |

  @CU-29838
  Scenario Outline: Verify that SCD performed correctly. TTAB Case Database and Party
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_8805"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "title:(<searchTerm>)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #TTAB Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Party in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "TTAB Case Law Database"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "title:(<searchTerm>)"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "TTAB Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | tax        |

  @CU-29839
  Scenario Outline: Verify that SCD performed correctly. Federal Circuit Trademark Case Database and Party
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_11707"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "title:(<searchTerm>)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #Federal Circuit Trademark Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Party in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal Circuit Trademark Case Law Datab..."
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "title:(<searchTerm>)"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "Federal Circuit Trademark Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | tax        |

  @CU-29840
  Scenario Outline: Verify that SCD performed correctly. TTAB Case Database and Case No.
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_8805"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "@@TTAB P<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #TTAB Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Case No. in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "TTAB Case Law Database"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "@@TTAB P<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "TTAB Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | 91214495   |

  @CU-29841
  Scenario Outline: Verify that SCD performed correctly. Federal Circuit Trademark Case Database and Case No.
    * I am logged in
    * I disable thesaurus
    * I perform search of "WKUS_TAL_11707"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Search Delete"
    * Text of "Search Bar > Search Input" should be ""
    * I type "@@TTAB P<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #Federal Circuit Trademark Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Case No. in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "Case Databases:"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal Circuit Trademark Case Law Datab..."
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Search Query"
    * Text of "Search Information Popup" should contain "@@TTAB P<searchTerm>"
    * Text of "Search Information Popup" should contain "Terms Applied"
    * Text of "Search Information Popup" should contain "Pre-Search Selections"
    * Text of "Search Information Popup" should contain "Practice Area: IP - WK Trademark Navigator"
    * Text of "Search Information Popup" should contain "Case Databases"
    * Text of "Search Information Popup" should contain "Selected Content"
    * Text of "Search Information Popup" should contain "Federal Circuit Trademark Case Law Database"
    * Text of "Search Information Popup" should contain "Post-Search Selections"
    * Text of "Search Information Popup" should contain "None"

    Examples:
      | searchTerm |
      | 2014-1203  |

  @CU-29842
  Scenario Outline: Verify that SCD widget remains last values of controls
    * I am logged in
    * I disable thesaurus
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be visible
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * I click "Search Case Databases Box > Scope"
    * I click "Search Case Databases Box > #Federal Circuit Trademark Case Database in Items"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Case No. in Items"
    * I click "Header > Home"
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #IP - WK TRADEMARK NAVIGATOR in Practice Areas List Items"
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * Text of "Search Case Databases Box > Scope" should contain "FEDERAL CIRCUIT TRADEMARK CASE DATABASE"
    * Text of "Search Case Databases Box > Search By" should contain "CASE NO."
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > #Party in Items"
    * I type "<searchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I click "Header > Home"
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #IP - WK TRADEMARK NAVIGATOR in Practice Areas List Items"
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * Text of "Search Case Databases Box > Scope" should contain "FEDERAL CIRCUIT TRADEMARK CASE DATABASE"
    * Text of "Search Case Databases Box > Search By" should contain "PARTY"

    Examples:
      | searchTerm |
      | tax        |

  @CU-29843
  @logout
  Scenario: Verify that SCD widget is not displayed if the user has not access to TTAB and Federal Circuit Trademark Databases publications
    * I am logged in as "TMNWithoutCaseDB@wk.com" with "password" password
    * I disable thesaurus
    * I am on "IP - WK Trademark Navigator" PA
    * I wait until "Loading Indicator" is gone
    * "Search Case Databases Box" should not be visible

  @CU-29844
  @logout
  Scenario: Verify that "Federal Circuit Trademark Case Database" value is not present if user  has not access to FCTD publications
    * I am logged in as "tmnwithoutfct@wk.com" with "password" password
    * I disable thesaurus
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * Text of "Search Case Databases Box > Scope" should contain "TTAB CASE DATABASE"
    * I click "Search Case Databases Box > Scope"
    * "Search Case Databases Box > #1 of Items" should be visible
    * "Search Case Databases Box > #2 of Items" should not be visible

  @CU-29845
  @logout
  Scenario: Verify that "TTAB Case Database" value is not present if user  has not access to TTABВ publications
    * I am logged in as "tmnwithoutttab@wk.com" with "password" password
    * I disable thesaurus
    * I am on "IP - WK Trademark Navigator" PA
    * "Search Case Databases Box" should be present
    * I scroll "Search Case Databases Box > Scope" to center of the window
    * Text of "Search Case Databases Box > Scope" should contain "FEDERAL CIRCUIT TRADEMARK CASE DATABASE"
    * I click "Search Case Databases Box > Scope"
    * "Search Case Databases Box > #1 of Items" should be visible
    * "Search Case Databases Box > #2 of Items" should not be visible

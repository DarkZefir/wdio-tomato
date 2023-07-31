@critical_path
@mvl
Feature: Search Pills 3

  @CU-32277
  @local
  Scenario Outline: Verify that Proximity Connectors can be applied to SWSR
    * I am logged in
    * I perform search of "tax"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> <search>"
    Examples:
      | search            |
      | trust f/2 revoc   |
      | revoc p/200 trust |
      | revoc w/25 trust  |
      | revoc w/sen trust |
      | revoc w/par trust |

  @CU-32278
  @local
  Scenario Outline: Verify that Search with Parentheses can be applied to SWSR
    * I am logged in
    * I perform search of "tax"
    * I type "<search>" in "Search Bar > Search Input"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<search>"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Search Queries" should be "tax >> <search>"
    Examples:
      | search                                                      |
      | Title: (blue sky) and hardship exemption                    |
      | Title: (Microsoft or Apple) and Doctype: cases and hardship |

  @CU-32279
  @local
  Scenario: Verify that Results Bar is updated every time after new SWSR from a search chain is performed: text of bar is change to display new terms
    * I am logged in
    * I perform search of "editorial experts"
    * I perform search of "Former"
    * Text of "Results Toolbar > Previous Search Query" should be "“editorial experts”"
    * Text of "Results Toolbar > Current Search Query" should be "“Former”"
    * I perform search of "freedom"
    * Text of "Results Toolbar > Previous Search Query" should be "“Former”"
    * Text of "Results Toolbar > Current Search Query" should be "“freedom”"
    * I perform search of "Freedom of Information Act"
    * Text of "Results Toolbar > Previous Search Query" should be "“freedom”"
    * Text of "Results Toolbar > Current Search Query" should be "“Freedom of Information Act”"

  @CU-32280
  @local
  Scenario Outline: Verify that all search terms from a search chain are highlighted in SWSR SRL
    * I am logged in
    * I am on "SECURITIES - ALL" PA
    * I disable thesaurus
    * I perform search of "expert"
    * I perform search of "<search>"
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Highlighted Phrases" should contain "expert"
    * Text in collection of "Highlighted Phrases" should contain "<search>"
    * I click "Search Bar > #2 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * "#1 of Highlighted Phrases" should be visible
    * I wait 4 seconds
    * Text in collection of "Highlighted Phrases" should contain "expert"
    * Text in collection of "Highlighted Phrases" should not contain "<search>"
    Examples:
      | search |
      | rule   |
      | Credit |

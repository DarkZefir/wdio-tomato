@critical_path
@mvl
Feature: Search 5

  @CU-29731
  @local
  Scenario: Search info without any filter
    * I am logged in
    * I disable thesaurus
    * I perform search of "reorganization C-type"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Title" should be "SEARCH INFORMATION"
    * Text of "Search Information Popup > Search Queries" should be "reorganization C-type"
    * Text of "Search Information Popup > Applied Terms" should be "reorganization C-type"
    * Text of "Search Information Popup > Practice Area" should be "All Content"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "None"
    * "Search Information Popup > Close Button" should be visible
    * "Search Information Popup > X Close Button" should be visible
    * I click "Search Information Popup > Close Button"
    * "Search Information Popup" should not be visible

  @CU-29770
  @local
  Scenario Outline: Verify that results are found when user performs a search using periods, other punctuation
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Count of "Documents" should be more than "0"
    * "Results Toolbar > Hit Count" should be visible
    * Text in collection of "Highlighted Phrases" should contain "<containsTerm>" ignoring case

    Examples:
      | searchTerm                                                                              | containsTerm       |
      | Subchapter G Star+Plus for example                                                      | Subchapter         |
      | CCH-ANNO, Cost plus contracts                                                           | CCH-ANNO           |
      | Chapter 7. Rules Applicable to Owners/Operators of Hazardous Waste Facilities           | Hazardous Waste    |
      | Impact Plus Services Provider Type – 29                                                 | impact             |
      | CCH Tax Research Consultant, REORG: 100, Fundamental Concepts—Corporate                 | Concepts—Corporate |
      | Cost-plus contracts                                                                     | cost-plus          |
      | CCH Tax Research Consultant, REORG: 100, Fundamental Concepts—Corporate Reorganizations | REORG              |
      | a21, Inc.                                                                               | a21                |
      | 1934 Act, 0-10                                                                          | 1934 Act           |

@critical_path
@mvl
Feature: Search Suggestions 2

  @CU-37354
  @local
  Scenario Outline: Verify that user can open document by selecting suggestion with keyboard from 'Q&A' Cluster
    * I am logged in
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > QandA Cluster > Cluster Title" should be "Q&A"
    * I send sequence of keys "ArrowDown" to element "Search Bar > Search Input"
    * I remember text of "Search Bar > Search Suggestions > QandA Cluster> #1 of Suggestions > Text" as "suggestion"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * Text of "Document Frame > Title" should contain "{$suggestion}" ignoring case ignoring whitespaces
    * "Problem Encountered Popup" should not be visible

    Examples:
      | term                           |
      | Is the ADEA part of Title VII? |

  @CU-37355
  Scenario Outline: Verify that 'Q&A' cluster is available in 'Advanced Search' overlay
    * I am logged in
    * I am on "<pa>" PA
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I type "<term>" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Suggestions > QandA Cluster > #1 of Suggestions" should be visible
    * Text of "Advanced Search Popup > Search Suggestions > QandA Cluster > Cluster Title" should be "Q&A"
    * Count of "Advanced Search Popup > Search Suggestions > QandA Cluster > Suggestions" should be more than "0"
    Examples:
      | pa                                       | term  |
      | Pension & Employee Benefits              | case  |
      | Sexual Harassment & Workplace Compliance | law   |
      | Technical Answer Group - TAG             | state |

  @CU-37356
  Scenario Outline: Verify that 'Q&A' cluster section is displayed when user performs search from Read view
    * I am logged in
    * I open "<docId>" document
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > QandA Cluster > Cluster Title" should be "Q&A"
    * Count of "Search Bar > Search Suggestions > QandA Cluster > Suggestions" should be more than "0"
    Examples:
      | docId                                    | term     |
      | fed01313ba5c87b681000bfff001b78be8c78049 | attorney |

  @CU-37357
  Scenario Outline: Verify that 'Q&A' cluster section is displayed when user performs search from TLP document
    * I am logged in
    * I open "<docId>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > QandA Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > QandA Cluster > Cluster Title" should be "Q&A"
    * Count of "Search Bar > Search Suggestions > QandA Cluster > Suggestions" should be more than "0"
    Examples:
      | docId                                    | term   |
      | tppc018dcd37347cb21000b76190b11c18cbab01 | health |

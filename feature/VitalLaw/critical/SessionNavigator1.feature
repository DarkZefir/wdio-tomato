@critical_path
@mvl
Feature: Session Navigator 1

  @CU-29053
  Scenario Outline: Verify that Citation Lookup Search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I am on "<PA>" PA
    * I remember text of "Session Navigator > Session Navigator Tab" as "PA"
    * I type "<SearchTerms>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Citation Lookup Box" should not be visible
    * "Results Toolbar > Hit Count" should be visible
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Expand"
    * "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait until text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title Text" is "<SearchTerms>" ignoring case
    * Text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "CITATION LOOKUP: <SearchTerms>"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * "Search Bar > Search Input" should not be visible
    * Text of "Search Bar" should contain "Citation Lookup: <SearchTerms>"
    * Count of "Documents" should be more than "0"

    Examples:
      | PA        | SearchTerms |
      | TAX - ALL | IRC 1       |

  @CU-29055
  Scenario Outline: Verify that Citation Builder Search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I am on "<PA>" PA
    * I remember text of "Session Navigator > Session Navigator Tab" as "PA"
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * I wait until "Citation Template Search Box > Loading Indicator" is gone
    * I type "<SearchTerms1>" in "Citation Template Search Box > #<Title> in Citation Groups > #1 of Templates > #1 of Inputs"
    * I type "<SearchTerms2>" in "Citation Template Search Box > #<Title> in Citation Groups > #1 of Templates > #2 of Inputs"
    * I click "Citation Template Search Box > #<Title> in Citation Groups > #1 of Templates > Go Button"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Expand"
    * "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait until text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title Text" is "<Citation>" ignoring case
    * Text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "CITATION SEARCH: <Citation>"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Input" should not be visible
    * Text of "Search Bar" should contain "Citation Search: <Citation>" ignoring case
    * Count of "Documents" should be more than "0"

    Examples:
      | PA                      | SearchTerms1 | SearchTerms2 | Title                                              | Citation            |
      | Antitrust & Competition | 15           | 2            | Trade Regulation Laws, Cases, and Agency Materials | 15 U.S. CODE SEC. 2 |

  @CU-29061
  Scenario Outline: Verify that Sample Form search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I am on "<PA>" PA
    * I remember text of "Session Navigator > Session Navigator Tab" as "PA"
    * "Sample Forms Box > Search Term Input" should be visible
    * I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    * I click "Sample Forms Box > #1 of Dropdowns"
    * "Sample Forms Box > #1 of Dropdowns > #1 of Items" should be visible
    * I click "Sample Forms Box > #1 of Dropdowns > #Corporations in Items"
    * "Sample Forms Box > #2 of Dropdowns" should be visible
    * I click "Sample Forms Box > #2 of Dropdowns"
    * "Sample Forms Box > #2 of Dropdowns > #1 of Items" should be visible
    * I click "Sample Forms Box > #2 of Dropdowns > #<Filter> in Items"
    * I type "<SearchTerm>" in "Sample Forms Box > Search Term Input"
    * I click "Sample Forms Box > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Post Search Filters" should be visible
    * "#1 of Documents" should be visible
    * Text of "Search Bar > #1 of Post Search Filters > Filter Name" should contain "<Filter>"
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Expand"
    * "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait 3 seconds
    * Text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "SAMPLE FORMS: <SearchTerm> - <Filter>" ignoring case
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm>"
    * Text of "Search Bar" should contain "Sample Forms:"
    * Text of "Search Bar > Post Search Filters > Filter Name" should contain "<Filter>"
    * Count of "Documents" should be more than "0"

    Examples:
      | PA                   | SearchTerm | Filter |
      | SECURITIES - FEDERAL | tax        | Bylaws |

  @CU-29062
  Scenario Outline: Verify that Search Case Database search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I open base url with "<URL>"
    * Text of "Session Navigator > Session Navigator Tab" should not be ""
    * I remember text of "Session Navigator > Session Navigator Tab" as "PA"
    * I click "Search Case Databases Box > Scope"
    * "Search Case Databases Box > Scope > #1 of Links" should be visible
    * I click "Search Case Databases Box > Scope > #<Link1> in Links"
    * I click "Search Case Databases Box > Search By"
    * I click "Search Case Databases Box > Search By > #<Link2> in Items"
    * I type "<SearchTerm>" in "Search Case Databases Box > Search Term"
    * I click "Search Case Databases Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Expand"
    * "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait 2 seconds
    * Text of "Session Navigator > #{$PA} in Practice Areas List Items> Events Panel > #1 of Event > Title" should contain "CASE DATABASES: <SearchTerm>" ignoring case
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm>"
    * Text of "Search Bar" should contain "Case Databases:"
    * "Search Bar > #1 of PreSearch Filters" should be visible
    * Text in collection of "Search Bar > PreSearch Filters" should contain "<Filter1>"
    * Count of "Documents" should be more than "0"

    Examples:
      | URL                       | SearchTerm | Filter | Link1              | Link2   | Filter1                |
      | #/home/TrademarkNavigator | tax        | Bylaws | TTAB Case Database | Keyword | TTAB Case Law Database |

  @CU-29065
  Scenario Outline: Verify that TAG FAQ Database search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I open base url with "<URL>"
    * I remember text of "Session Navigator > Session Navigator Tab" as "PA"
    * "Search Within Tag Box > Search Input" should be visible
    * I type "<SearchTerm>" in "Search Within Tag Box > Search Input"
    * "Search Within Tag Box > Search Button" should be clickable
    * I click "Search Within Tag Box > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Search Within Tag Box" should not be visible
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #{$PA} in Practice Areas List Items> Expand"
    * I wait 2 seconds
    * "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel" should be visible
    * Text of "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "TAG FAQ DATABASE: <SearchTerm>" ignoring case
    * I click "Session Navigator > #{$PA} in Practice Areas List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm>"
    * Text of "Search Bar" should contain "TAG FAQ DATABASE:"
    * Count of "Search Bar > Post Search Filters > Filter Name" should be more than "1"
    * Count of "Documents" should be more than "0"

    Examples:
      | URL        | SearchTerm |
      | #/home/TAG | tax        |

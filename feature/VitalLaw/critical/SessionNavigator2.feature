@critical_path
@mvl
Feature: Session Navigator 2

  @CU-35864
  Scenario: Verify that recently opened PA is displayed at the top of the PAs list in Session Navigator
    * I am logged in
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I remember random integer below "{$PAs}" as "randomPA"
    * I remember text of "Practice Areas Box > #{$randomPA} of Practice Area Links" as "recentPA"
    * I click "Practice Areas Box > #{$randomPA} of Practice Area Links"
    * I wait until text of "Session Navigator > Session Navigator Tab" is "{$recentPA}" ignoring case
    * I click "Session Navigator > Session Navigator Tab"
    * I wait until "Loading Indicator" is gone
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I wait 5 seconds
    * "Session Navigator > Practice Areas List Header" should be visible
    * "Session Navigator > Resourses List Header" should be visible
    * Text of "Session Navigator > Practice Areas List Header" should be "PRACTICE AREAS"
    * Text of "Session Navigator > Resourses List Header" should be "RESOURCES"
    * Text of "Session Navigator > #1 of Resourses List Items" should be "LAWS & REGULATIONS"
    * Text of "Session Navigator > #2 of Resourses List Items" should be "PRACTICAL CONTENT"
    * Text of "Session Navigator > #1 of Practice Areas List Items" should be "{$recentPA}" ignoring case

  @CU-35875
  Scenario Outline: Verify that Off-platform Smart Chart from Practical Content Dashboard is logged to Session Navigator and page could be reopened from it
    * I am logged in
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "Practice Areas Filter" should be visible
    * "#1 of Content Boxes" should be visible
    * I remember number of "#<title> in Content Boxes > Items" as "boxItems"
    * I remember random integer below "{$boxItems}" as "randomItem"
    * I remember text of "#<title> in Content Boxes > #{$randomItem} of Items" as "Title"
    * I remember number of browser tabs
    * I click "#<title> in Content Boxes > #{$randomItem} of Items"
    * I switch to new tab
    * I wait 15 seconds
    * I should see "<text>" text on page
    * I switch to first tab
    * I click "Session Navigator > Session Navigator Tab"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > #<PA1> in <Items>"
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #<PA1> in <Items> > Expand"
    * "Session Navigator > #<PA1> in <Items> > Events Panel" should be visible
    * Text of "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event" should contain "{$Title}" ignoring case
    * I remember number of browser tabs
    * I click "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event"
    * I switch to new tab
    * I should see "<text>" text on page

    Examples:
      | title        | text  | Items                | PA1               |
      | SMART CHARTS | Chart | Resourses List Items | PRACTICAL CONTENT |

  @CU-29041
  @local
  Scenario Outline: Verify that Global Search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I open base url with "<URL>"
    * I perform search of "<SearchTerm1>" with the following presearch filters:
      | <Filter1> |
    * "Filter Groups > #1 of Filter Items" should be visible
    * I click "#<Filter2> in Filter Groups > #<Filter2> in Filter Items"
    * I type "<SearchTerm2>" in "Search Bar > Search Input"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Button" should be visible
    * I click "Search Bar > Search Button"
    * "#1 of Documents" should be visible
    * "Results Toolbar > Hit Count" should be visible
    * I click "Header > Home"
    * I am on "ALL CONTENT" PA
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of <Items>" should be visible
    * I wait 3 seconds
    * I click "Session Navigator > #<PA1> in <Items> > Expand"
    * "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event" should be visible
    * I wait until text of "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event > Title Text" is "<SearchTerm1>" ignoring case
    * I click "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event"
    * "#1 of Documents" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<SearchTerm1>"
    * Text of "Search Bar > #2 of Search Pills > Text" should be "<SearchTerm2>"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "<Filter>"
    * Text in collection of "Search Bar > Post Search Filters > Filter Name" should contain "<Filter2>"
    * Text of "Results Toolbar" should contain "<SearchTerm1>"
    * Text of "Results Toolbar" should contain "<SearchTerm2>"
    * Count of "Documents" should be more than "0"

    Examples:
      | URL                  | Home               | SearchTerm1    | SearchTerm2 | Filter    | Filter1                                    | Filter2 | Items                     | PA1                |
      | #/home/AllContent    | Home               | captive of law | day         | Treatises | SELECT FILTERS > Document Type > Treatises | Federal | Practice Areas List Items | ALL CONTENT        |
      | #/home/PrimarySource | Laws & Regulations | law            | court       | Laws      | SELECT FILTERS > Document Type > Laws      | State   | Resourses List Items      | LAWS & REGULATIONS |

  @CU-31975
  Scenario Outline: Verify that Citation Search is logged to Session Navigator and could be re-executed from it
    * I am logged in
    * I am on "<PA1>" PA
    * I type "<term>" in "Citation Lookup Box > Input Field"
    * "Citation Lookup Box > Go Button" should be clickable
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Citation Lookup Box" should not be visible
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #<PA1> in Practice Areas List Items > Expand"
    * "Session Navigator > #<PA1> in Practice Areas List Items > Events Panel" should be visible
    * I wait 3 seconds
    * Text of "Session Navigator > #<PA1> in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "CITATION LOOKUP: <term>"
    * I click "Session Navigator > #<PA1> in Practice Areas List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Input" should not be visible
    * Text of "Search Bar" should contain "Citation Lookup: <term>"
    * Count of "Documents" should be more than "0"

    Examples:
      | PA1       | term  |
      | TAX - ALL | IRC 1 |

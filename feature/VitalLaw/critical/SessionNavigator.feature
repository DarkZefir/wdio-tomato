@critical_path
@mvl
Feature: Session Navigator

  @logout
  @CU-29001
  Scenario: Verify that not-subscribed PAs are not displayed in Session Navigator
    * I am logged in as "TLPuser@wk.com" with "password" password
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * Count of "Session Navigator > Practice Areas List Items" should be equal to "5"
    * I should see the following lines in "Session Navigator > Practice Areas List Items" ignoring order:
      | ALL CONTENT                  |
      | TAX - INTERNATIONAL          |
      | TAX - FEDERAL                |
      | TAX - ALL                    |
      | KLUWER INTERNATIONAL TAX LAW |

  @CU-29015
  Scenario: Verify that the most recent 10 items are displayed in Session Navigator Right Panel
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "merger"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "text"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "search"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "act"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "captive"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "tea"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "date"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "concern"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "tax"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I perform search of "rose"
    * "Search Bar > #1 of Search Pills" should be visible
    * "#1 of Documents" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items > Expand"
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event" should be visible
    * Count of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > Event" should not be less than "10"
    * Text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: ROSE"
    * Text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #5 of Event > Title" should contain "SEARCH: TEA"
    * Text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #10 of Event > Title" should contain "SEARCH: MERGER"
    * I perform search of "table"
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items > Expand"
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel" should be visible
    * Count of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > Event" should not be less than "10"
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event" should be visible
    * Text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: TABLE"
    * Text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #2 of Event > Title" should contain "SEARCH: ROSE"

  @CU-29029
  Scenario: Verify that Session Navigator is closed on clicking Session Navigator again or anywhere outside it
    * I am logged in
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should not be visible
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Search Bar > Search Input"
    * "Session Navigator > #1 of Practice Areas List Items" should not be visible

  @CU-29032
  Scenario Outline: Verify that opening of Regular Document is logged to Session Navigator and doc could be reopened from it
    * I am logged in
    * I open "<Doc>" document
    * "Document Frame" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember text of "Document Frame" as "docFrame"
    * I click "Header > Home"
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #<PA1> in <Items> > Expand"
    * "Session Navigator > #<PA1> in <Items> > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event > Title Text" should be "Department of Justice Antitrust Division Manual, Disclaimer" ignoring case
    * I remember "href" attribute of "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event > Link" as "url"
    * "{$url}" text should contain "<Doc>" text
    * I click "Session Navigator > #<PA1> in <Items> > Events Panel > #1 of Event > Title"
    * "Document Frame" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Document Frame" should be "{$docFrame}"

    Examples:
      | Doc                                     | Home | PA1         | Items                     |
      | anh011a4248f67c2e1000a23990b11c2ac4f102 | Home | ALL CONTENT | Practice Areas List Items |

  @CU-29036
  Scenario Outline: Verify that opening of Topic Page is logged to Session Navigator and page could be reopened from it
    * I am logged in
    * I open "<Doc>" topics document
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * I remember text of "Tax Topic Page > Topic Title" as "topicTitle1"
    * I click "Header > Home"
    * "Session Navigator" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items > Expand"
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items> Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * I wait until text of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Title Text" is "Apportionment Formulas" ignoring case
    * I remember "href" attribute of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Link" as "url"
    * "{$url}" text should contain "<Doc>" text
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Title"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$topicTitle1}"

    Examples:
      | Doc                                     |
      | tes01b37dfc8e7c6c1000b459d8d385ad169402 |

  @CU-32814
  Scenario Outline: Verify that document opened from On Platform Smart Charts template is logged to Session Navigator
    * I am logged in
    * I open "<Doc>" topics document
    * I wait until "Loading Indicator" is gone
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "#1 of Results Nodes" should be visible
    * "Utility Bar" should be visible
    * "#1 of Results Nodes > #1 of Headers" should be visible
    * I click "#1 of Citation Links"
    * "Document Frame > Title" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "Id"
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #ALL CONTENT in Practice Areas List Items > Expand"
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel" should be visible
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel" should be visible
    * I remember "href" attribute of "Session Navigator > #ALL CONTENT in Practice Areas List Items > Events Panel > #1 of Event > Link" as "url"
    * "{$url}" text should contain "{$Id}" text

    Examples:
      | Doc                                     |
      | tes01b48ff1cc7c6c1000925cd8d385ad169402 |

@critical_path
@mvl
Feature: RBSF Widget

  @CU-31851
  Scenario: Verify values in drop downs when Private Placements is selected in RBSF widget
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "RBsourceFilings" should be visible
    * I click "RBsourceFilings > Content > Scope Dropdown > Button"
    * "RBsourceFilings > Content > Scope Dropdown > #1 of Items" should be visible
    * I click "RBsourceFilings > Content > Scope Dropdown > #Private Placements in Items"
    * Text of "RBsourceFilings > Content > Scope Dropdown > Button" should be "PRIVATE PLACEMENTS"
    * Text of "RBsourceFilings > #1 of Labels" should be "Scope"
    * "RBsourceFilings > #2 of Labels" should be visible
    * Text of "RBsourceFilings > #2 of Labels" should be "Company Name"
    * "RBsourceFilings > #3 of Labels" should be visible
    * Text of "RBsourceFilings > #3 of Labels" should be "Governing Law"
    * "RBsourceFilings > #4 of Labels" should be visible
    * Text of "RBsourceFilings > #4 of Labels" should be "Bookrunner"
    * "RBsourceFilings > #5 of Labels" should be visible
    * Text of "RBsourceFilings > #5 of Labels" should be "Search Term"
    * "RBsourceFilings > #6 of Labels" should be visible
    * Text of "RBsourceFilings > #6 of Labels" should be "Date"
    * "RBsourceFilings > Content > Private Placements Form > Company Name Input" should be visible
    * Placeholder text for "RBsourceFilings > Content > Private Placements Form > Company Name Input" should be ""
    * "RBsourceFilings > Content > Private Placements Form > Governing Law Input" should be visible
    * Value in "RBsourceFilings > Content > Private Placements Form > Governing Law Input" should be ""
    * "RBsourceFilings > Content > Private Placements Form > Bookrunner Input" should be visible
    * Value in "RBsourceFilings > Content > Private Placements Form > Bookrunner Input" should be ""
    * "RBsourceFilings > Content > Private Placements Form > Search Term Input" should be visible
    * Value in "RBsourceFilings > Content > Private Placements Form > Search Term Input" should be ""
    * "RBsourceFilings > Content > Date Form Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Date Form Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Go Button" should be visible
    * "RBsourceFilings > Go Button" should not be enabled
    * I click "RBsourceFilings > Content > Date Form Dropdown > Button"
    * "RBsourceFilings > Content > Date Form Dropdown > #1 of Items" should be visible
    * I should see the following lines in "RBsourceFilings > Content > Date Form Dropdown > Items":
      | All Dates      |
      | Today          |
      | Prior 7 Days   |
      | Prior 30 Days  |
      | Prior 90 Days  |
      | Prior 365 Days |
      | Prior 3 Years  |
      | Prior 5 Years  |
      | Since a Date   |
      | Until a Date   |
      | On a Date      |
      | Date Range     |

  @CU-31854
  Scenario: Verify values in drop downs when Law Firm Memos is selected  in RBSF widget
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "RBsourceFilings" should be visible
    * I click "RBsourceFilings > Content > Scope Dropdown > Button"
    * "RBsourceFilings > Content > Scope Dropdown > #1 of Items" should be visible
    * I click "RBsourceFilings > Content > Scope Dropdown > #Law Firm Memos in Items"
    * Text of "RBsourceFilings > Content > Scope Dropdown > Button" should be "LAW FIRM MEMOS"
    * Text of "RBsourceFilings > #1 of Labels" should be "Scope"
    * "RBsourceFilings > #2 of Labels" should be visible
    * Text of "RBsourceFilings > #2 of Labels" should be "Keyword"
    * "RBsourceFilings > #3 of Labels" should be visible
    * Text of "RBsourceFilings > #3 of Labels" should be "Category"
    * "RBsourceFilings > #4 of Labels" should be visible
    * Text of "RBsourceFilings > #4 of Labels" should be "Subcategory"
    * "RBsourceFilings > #5 of Labels" should be visible
    * Text of "RBsourceFilings > #5 of Labels" should be "Date"
    * "RBsourceFilings > Content > Law Firm Memos Form > Keyword Input" should be visible
    * Value in "RBsourceFilings > Content > Law Firm Memos Form > Keyword Input" should be ""
    * "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Content > Date Form Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Date Form Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Go Button" should be visible
    * "RBsourceFilings > Go Button" should not be enabled
    * I click "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > Button"
    * "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > #1 of Items" should be visible
    * Count of "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > Items" should be more than "2"
    * Each element of "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > Items" should match "^(?!\s*$).+"
    * Text in collection of "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > Items" should contain "- SELECT -"
    * I click "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > #2 of Items"
    * "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > #1 of Items" should not be visible
    * "RBsourceFilings > Content > Law Firm Memos Form > Category Dropdown > #1 of Items" should not be visible
    * I click "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Button"
    * "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > #1 of Items" should be visible
    * Count of "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Items" should be more than "2"
    * Each element of "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Items" should match "^(?!\s*$).+"
    * Text in collection of "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Items" should contain "- SELECT -"
    * I click "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > Button"
    * "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > #1 of Items" should not be visible
    * "RBsourceFilings > Content > Law Firm Memos Form > Subcategory Dropdown > #1 of Items" should not be visible
    * I click "RBsourceFilings > Content > Date Form Dropdown > Button"
    * "RBsourceFilings > Content > Date Form Dropdown > #1 of Items" should be visible
    * I should see the following lines in "RBsourceFilings > Content > Date Form Dropdown > Items":
      | All Dates      |
      | Today          |
      | Prior 7 Days   |
      | Prior 30 Days  |
      | Prior 90 Days  |
      | Prior 365 Days |
      | Prior 3 Years  |
      | Prior 5 Years  |
      | Since a Date   |
      | Until a Date   |
      | On a Date      |
      | Date Range     |

  @logout
  @CU-31866
  Scenario Outline: Verify that RBSF widget is not displayed for user without subscription to Filings
    * I am logged in as "cht.rbs.only1@wk.com" with "password" password
    * I am on "<PA>" PA
    * I wait 5 seconds
    * "RBsourceFilings" should not be visible

    Examples:
      | PA                                   |
      | SECURITIES - FEDERAL & INTERNATIONAL |
      | SECURITIES - ALL                     |

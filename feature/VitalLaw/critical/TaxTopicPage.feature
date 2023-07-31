@critical_path
@mvl
Feature: Tax Topics List

  @CU-31675
  @logout
  Scenario: Verify that citations in TLP documents that lead to documents that are not available for a user with limited subscription are displayed plain text
    * I am logged in as "TLPmixed@wk.com" with "password" password
    * I open "tppc01b81174a07d171000b4dd90b11c18c90201" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * I remember text of "Tax Topic Page > Topic Title" as "title"
    * I move mouse over "Tax Topic Page > #requirements in Citation Links"
    * I wait 3 seconds
    * "Tax Topic Page > Citation Popover" should not be visible
    * I click "Tax Topic Page > #requirements in Citation Links"
    * "Tax Topic Page > Citation Popover" should not be visible
    * "Results Popup" should not be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$title}"

  @CU-31679
  Scenario: Verify that on click on citation links in TLP documents target content is displayed
    * I am logged in
    * I open "tppc01b81174a07d171000b4dd90b11c18c90201" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I move mouse over "Tax Topic Page > #birthday in Citation Links"
    * "Tax Topic Page > Citation Popover" should be visible
    * Text of "Tax Topic Page > Citation Popover" should be "Rulings REVENUE RULINGS, REV. RUL. 2003-72, REV. RUL. 2003-72, I.R.B. 2003-33,346, 2003-2 C.B. 346, (JUL. 18, 2003)" ignoring case ignoring whitespaces
    * I click "Tax Topic Page > #birthday in Citation Links"
    * I switch to last tab
    * "Document Frame > Document Content" should be visible
    * I switch to first tab
    * "Tax Topic Page > Topic Title" should be visible
    * I move mouse over "Tax Topic Page > #exclude in Citation Links"
    * "Tax Topic Page > Citation Popover" should be visible
    * Text of "Tax Topic Page > Citation Popover" should be "Multiple values, please click the link to view" ignoring case ignoring whitespaces
    * I click "Tax Topic Page > #exclude in Citation Links"
    * "Results Popup" should be visible
    * I remember number of browser tabs
    * I click "Results Popup > #1 of Documents"
    * I switch to new tab
    * "Document Frame > Document Content" should be visible

  @CU-33997
  Scenario Outline: Verify displaying of 'Tax Snapshot' widget on International Tax Topics
    * I am logged in
    * I open base url with "<url>"
    * "Tax Topic Page > Topic Title" should be visible
    * I switch to "Tax Snapshot Iframe" iframe
    * Text of "Tax Snapshot Iframe > Header Title" should be "Tax Snapshot"
    * Text of "Tax Snapshot Iframe > Header Country" should be "Poland"
    * I switch to default content
    * I click "Tax Topic Page > Tax Snapshot Widget > View Tax Snapshot Button"
    * "Tax Snapshot Popup" should be visible
    Examples:
      | url                                                          |
      | #/topics/kluwertaxlaw/bb2434f47c931000b5c590b11c18cbab0c     |
      | #/topics/TaxInternational/bb2434f47c931000b5c590b11c18cbab0c |

  @CU-34007
  Scenario: Verify 'Treatment by State' section on State Topic Page
    * I am logged in
    * I open "tes0172c1ec507ce410008324d8d385ad169402" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Treatment by State in Table Of Contents Items"
    * "Tax Topic Page > Treatment By State Widget > #1 of Navigation Tabs" should be visible
    * Count of "Tax Topic Page > Treatment By State Widget > Navigation Tabs" should be equal to "6"
    * Text of "Tax Topic Page > Treatment By State Widget > #3 of Navigation Tabs" should be "Sales and Use"
    * I click "Tax Topic Page > Treatment By State Widget > #3 of Navigation Tabs"
    * Count of "Tax Topic Page > Treatment By State Widget > State Links" should be equal to "51"
    * Count of "Tax Topic Page > Treatment By State Widget > Disabled Links" should be equal to "5"
    * I click "Tax Topic Page > Treatment By State Widget > #Florida in State Links"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "norm-link-values" metadata parameter as "normLinkValues"
    * "{$normLinkValues}" text should contain "P60-300" text ignoring case

  @CU-34017
  Scenario: Verify that for user with limited subscription only content user is subscribed to is available in ‘Treatment by State’ section of State Topic Page
    * I am logged in as "TLPseveralstates@wk.com" with "password" password
    * I open "tes01b40861c67c6c1000baf8d8d385ad169402" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Treatment by State in Table Of Contents Items"
    * "Tax Topic Page > Treatment By State Widget > #1 of Navigation Tabs" should be visible
    * Count of "Tax Topic Page > Treatment By State Widget > Navigation Tabs" should be equal to "3"
    * Text of "Tax Topic Page > Treatment By State Widget > #1 of Navigation Tabs" should be "Corporate Income"
    * Text of "Tax Topic Page > Treatment By State Widget > #2 of Navigation Tabs" should be "Sales and Use"
    * Text of "Tax Topic Page > Treatment By State Widget > #3 of Navigation Tabs" should be "Property"
    * I click "Tax Topic Page > Treatment By State Widget > #1 of Navigation Tabs"
    * Count of "Tax Topic Page > Treatment By State Widget > State Links" should be equal to "51"
    * Count of "Tax Topic Page > Treatment By State Widget > Active Links" should be equal to "3"
    * Count of "Tax Topic Page > Treatment By State Widget > Disabled Links" should be equal to "48"
    * I remember text of "Tax Topic Page > Treatment By State Widget > Active Links" as "ActiveLinks"
    * "{$ActiveLinks}" text should contain "Alaska" text
    * "{$ActiveLinks}" text should contain "New Jersey" text
    * "{$ActiveLinks}" text should contain "Utah" text
    * I click "Tax Topic Page > Treatment By State Widget > #3 of Navigation Tabs"
    * Count of "Tax Topic Page > Treatment By State Widget > Active Links" should be equal to "3"
    * I remember text of "Tax Topic Page > Treatment By State Widget > Active Links" as "ActiveLinks"
    * "{$ActiveLinks}" text should contain "Alaska" text
    * "{$ActiveLinks}" text should contain "New Jersey" text
    * "{$ActiveLinks}" text should contain "Utah" text

  @CU-34018
  Scenario Outline: Verify 'Treatment By Jurisdiction' section on International Tax Topic page
    * I am logged in
    * I open base url with "<url>"
    * "Tax International Topics List Country > Dropdown" should be visible
    * Text of "Tax International Topics List Country > Dropdown" should match "FRANCE"
    * I remember number of "Tax International Topics List Country > Topic Links" as "topics"
    * I remember random integer below "{$topics}" as "randomtopic"
    * I remember text of "Tax International Topics List Country > #{$randomtopic} of Topic Links" as "linkTitle"
    * I click "Tax International Topics List Country > #{$randomtopic} of Topic Links"
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should contain "FRANCE" ignoring case
    * I click "Tax Topic Page > #Treatment by Jurisdiction in Table Of Contents Items"
    * "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown" should be visible
    * Text of "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown > Label" should be "FRANCE"
    * I scroll "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown" to center of the window
    * I click "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown"
    * Text in collection of "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown > Items" should contain "Canada" ignoring case
    * I click "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown > #Canada in Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Tax Topic Page > Treatment By Jurisdiction Widget > Dropdown > Label" should be "CANADA"
    * Text of "Tax Topic Page > Topic Title" should contain "CANADA" ignoring case
    Examples:
      | url                                      |
      | #/topics/browse/kitl/kluwertaxlaw/FR     |
      | #/topics/browse/intl/TaxInternational/FR |

  @CU-34025
  Scenario Outline: Verify 'Key Primary Sources' section of Federal & State Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Key Primary Sources in Table Of Contents Items"
    * "Tax Topic Page > Key Primary Sources Widget" should be in viewport
    * Text of "Tax Topic Page > Key Primary Sources Widget > Title" should be "Key Primary Sources" ignoring case
    * Count of "Tax Topic Page > Key Primary Sources Widget > Tabs" should be more than "0"
    * I remember number of "Tax Topic Page > Key Primary Sources Widget > Tabs" as "tabs"
    * I click "Tax Topic Page > Key Primary Sources Widget > #{$randomInt(1, $tabs)} of Tabs"
    * Count of "Tax Topic Page > Key Primary Sources Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Key Primary Sources Widget > Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * I remember text of "Tax Topic Page > Key Primary Sources Widget > #{$randombox} of Links" as "docTitle"
    * I click "Tax Topic Page > Key Primary Sources Widget > #{$randombox} of Links"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Show Metadata" should be clickable
    * I click "Show Metadata"
    * I remember value of "search-title" metadata parameter as "title"
    * "{$title}" text should contain "{$docTitle}" text ignoring whitespaces ignoring case ignoring punctuation marks
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc0121df0dfc7c691000b77690b11c18cbab02 |
      | state                  | tppc0121df0e7e7c691000ad6090b11c18cbab0f |


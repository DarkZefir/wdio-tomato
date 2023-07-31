@critical_path
@mvl
Feature: On Platform Smart Charts

  @CU-31373
  Scenario Outline: Verify that thesaurus is applied while executing search in Configuration Panel of On Platform Smart Charts
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Config Button" should be visible
    * "#1 of Results Nodes" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * I type "<search term>" in "Config Panel > Topics Filter > Topic Search Input"
    * I click "Config Panel > Topics Filter > Search Button"
    * "Config Panel > Topics Filter > #1 of Highlighted Items" should be visible
    * Each element of "Config Panel > Topics Filter > Highlighted Items" should match "<topics>"
    Examples:
      | search term | topics                              |
      | Chargeoff   | (Bad Debt Deduction—IRC\|Bad Debts) |
      | Hockey      | Athletics                           |

  @CU-31378
  Scenario: Verify that in case when no results are found, 'No Results' bar is displayed on Configuration Panel of OPSC
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Config Button" should be visible
    * "#1 of Results Nodes" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * I type "buiness income" in "Config Panel > Topics Filter > Topic Search Input"
    * I click "Config Panel > Topics Filter > Search Button"
    * "Config Panel > Topics Filter > Message" should be visible
    * "Config Panel > Topics Filter > X Icon" should be visible
    * "Config Panel > Topics Filter > Checked Topic Checkboxes" should not be visible
    * I click "Config Panel > Topics Filter > X Icon"
    * "Config Panel > Topics Filter > Message" should not be visible
    * I click "Config Panel > Topics Filter > Clear Topic Input"
    * I type "E-Filing" in "Config Panel > Topics Filter > Topic Search Input"
    * I click "Config Panel > Topics Filter > Search Button"
    * "Config Panel > Topics Filter > Message" should not be visible

  @CU-31458
  Scenario: Verify UI of configuration panel of On Platform Smart Charts
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Config Button" should be visible
    * "#1 of Results Nodes" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * "Config Panel > State Filter" should be visible
    * Text of "Config Panel > State Filter > Title" should be "Jurisdictions"
    * Text of "Config Panel > State Filter > #1 of Links" should contain "Select All"
    * Text of "Config Panel > State Filter > #2 of Links" should contain "Deselect All"
    * Count of "Config Panel > State Filter > Items" should be equal to "51"
    * "Config Panel > Topics Filter" should be visible
    * Text of "Config Panel > Topics Filter > Title" should be "Topics"
    * Text of "Config Panel > Topics Filter > #1 of Links" should contain "Select All"
    * Text of "Config Panel > Topics Filter > #2 of Links" should contain "Deselect All"
    * "Config Panel > Topics Filter > Topic Search Input" should be visible
    * Placeholder text for "Config Panel > Topics Filter > Topic Search Input" should be "Search for a topic..."
    * "Config Panel > Topics Filter > Search Button" should be visible
    * "Config Panel > Topics Filter > Search Button" should not be enabled
    * Count of "Config Panel > Topics Filter > Topic Checkboxes" should be equal to "9"
    * Count of "Config Panel > Topics Filter > Expand Buttons" should be equal to "9"
    * "Config Panel > View Results Button" should be visible
    * "Config Panel > View Results Button" should be enabled

  @CU-31517
  @logout
  Scenario: Verify that user with limited subscriptions has proper jurisdictions and topics on Configuration Panel of On Platform Smart Charts template
    * I am logged in as "OPSC4@wk.com" with "password" password
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Config Button" should be visible
    * "#1 of Results Nodes" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * Count of "Config Panel > State Filter > Items" should be equal to "2"
    * Text of "Config Panel > State Filter > #1 of Items" should contain "AK"
    * Text of "Config Panel > State Filter > #2 of Items" should contain "AL"
    * Count of "Config Panel > Topics Filter > Topic Checkboxes" should be equal to "9"
    * Count of "Config Panel > Topics Filter > Expand Buttons" should be equal to "9"
    * I click "Config Panel > Topics Filter > #2 of Links"
    * I click "Config Panel > Topics Filter > #8 of Expand Buttons"
    * Text of "Config Panel > Topics Filter" should contain "Hospital Tax"
    * Text of "Config Panel > Topics Filter" should contain "Real Property Transfer Taxes/Fees"
    * I click "Config Panel > Topics Filter > #12 of Topic Checkboxes"
    * I click "Config Panel > Topics Filter > #14 of Topic Checkboxes"
    * I type "taxation" in "Config Panel > Topics Filter > Topic Search Input"
    * I click "Config Panel > View Results Button"
    * I wait until "Loading Indicator" is gone
    * "Config Panel" should not be visible
    * Text of "#1 of Results Nodes > #1 of Section Titles" should contain "Other Taxes"
    * Text of "#1 of Results Nodes > #1 of Section Titles" should contain "Hospital Tax"
    * Text of "#2 of Results Nodes > #1 of Section Titles" should contain "Other Taxes"
    * Text of "#2 of Results Nodes > #1 of Section Titles" should contain "Real Property Transfer Taxes/Fees"
    * I click "#2 of Results Nodes > Expand Button"
    * I wait until "Loading Indicator" is gone
    * Count of "#1 of Results Nodes > Content > Rows" should be equal to "2"
    * Count of "#1 of Results Nodes > Content > Rows" should be equal to "2"
    * Count of "#2 of Results Nodes > Content > Rows" should be equal to "2"
    * Text of "#1 of Results Nodes > Content > #1 of Rows" should contain "Alabama"
    * Text of "#1 of Results Nodes > Content > #2 of Rows" should contain "Alaska"
    * Text of "#2 of Results Nodes > Content > #1 of Rows" should contain "Alabama"
    * Text of "#2 of Results Nodes > Content > #2 of Rows" should contain "Alaska"

  @CU-31520
  Scenario Outline: Verify that on selection topics and jurisdictions through Configuration panel user is able to see proper content on On Platform Smart Charts Template
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Config Button" should be visible
    * "#1 of Results Nodes" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * I click "Config Panel > State Filter > #2 of Links"
    * I click "Config Panel > State Filter > #AZ in Items"
    * I click "Config Panel > State Filter > #CA in Items"
    * I click "Config Panel > Topics Filter > #2 of Links"
    * Count of "Config Panel > State Filter > Checked Items" should be equal to "2"
    * I remember index of "Config Panel > Topics Filter > Contents" exactly matching "<title>" as "index"
    * I click "Config Panel > Topics Filter > #{$index} of Expand Buttons"
    * Text in collection of "Config Panel > Topics Filter > Contents" should contain "<title1>"
    * I remember index of "Config Panel > Topics Filter > Contents" exactly matching "<title1>" as "index1"
    * I click "Config Panel > Topics Filter > #{$index1} of Expand Buttons"
    * Text in collection of "Config Panel > Topics Filter > Contents" should contain "Real Property"
    * I remember index of "Config Panel > Topics Filter > Contents" exactly matching "<title2>" as "index2"
    * I click "Config Panel > Topics Filter > #{$index2} of Expand Buttons"
    * Text of "Config Panel > Topics Filter" should contain "<title3>"
    * I remember index of "Config Panel > Topics Filter > Contents" exactly matching "<title3>" as "index3"
    * I remember index of "Config Panel > Topics Filter > Contents" exactly matching "<title4>" as "index4"
    * I click "Config Panel > Topics Filter > #{$index3} of Topic Checkboxes"
    * I click "Config Panel > Topics Filter > #{$index4} of Topic Checkboxes"
    * I type "sales" in "Config Panel > Topics Filter > Topic Search Input"
    * I click "Config Panel > View Results Button"
    * I wait until "Loading Indicator" is gone
    * "Config Panel" should not be visible
    * Text of "#1 of Results Nodes > #1 of Section Titles" should contain "<title>"
    * Text of "#1 of Results Nodes > #1 of Section Titles" should contain "<title1>"
    * Text of "#1 of Results Nodes > #1 of Section Titles" should contain "<title2>"
    * Text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" should contain "<title3>"
    * Text of "#2 of Results Nodes > #1 of Section Titles" should contain "<title>"
    * Text of "#2 of Results Nodes > #1 of Section Titles" should contain "<title1>"
    * Text of "#2 of Results Nodes > #1 of Section Titles" should contain "<title2>"
    * Text of "#2 of Results Nodes > #1 of Section Titles > Leaf Title" should contain "<title4>"
    * I click "#2 of Results Nodes > Expand Button"
    * "#1 of Results Nodes > Content > #1 of Rows" should be visible
    * Count of "#1 of Results Nodes > Content > Rows" should be equal to "2"
    * Count of "#2 of Results Nodes > Content > Rows" should be equal to "2"
    * Text of "#1 of Results Nodes > Content > #1 of Rows" should contain "Arizona"
    * Text of "#1 of Results Nodes > Content > #2 of Rows" should contain "California"
    * Text of "#2 of Results Nodes > Content > #1 of Rows" should contain "Arizona"
    * Text of "#2 of Results Nodes > Content > #2 of Rows" should contain "California"

    Examples:
      | title        | title1                           | title2  | title3                 | title4           |
      | Property Tax | Assessment, Payment, and Appeals | Appeals | Administrative Appeals | Judicial Appeals |

  @CU-31526
  Scenario: Verify expansion/collapse of On Platform Smart Charts sections
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "#1 of Results Nodes > Content" should be visible
    * "#1 of Results Nodes > Collapse Button" should be visible
    * I click "#1 of Results Nodes > Collapse Button"
    * "#1 of Results Nodes > Content" should not be visible
    * I click "#2 of Results Nodes > Expand Button"
    * "#2 of Results Nodes > Content" should be visible
    * I click "Expand All Button"
    * I wait 2 seconds
    * I scroll to the bottom
    * "Collapse All Button" should be visible
    * "#1 of Results Nodes > Content" should be visible
    * "#1 of Results Nodes > Collapse Button" should be visible
    * I scroll to the bottom
    * "#2 of Results Nodes > Content" should be visible
    * "#2 of Results Nodes > Collapse Button" should be visible
    * I scroll to the bottom
    * "#3 of Results Nodes > Content" should be visible
    * I click "Collapse All Button"
    * "#1 of Results Nodes > Expand Button" should be visible
    * "#2 of Results Nodes > Expand Button" should be visible
    * "#3 of Results Nodes > Expand Button" should be visible
    * "#1 of Results Nodes > Content" should not be visible
    * "#2 of Results Nodes > Content" should not be visible
    * "#3 of Results Nodes > Content" should not be visible

  @CU-31527
  Scenario: Verify that 'Info' bar is displayed on click on 'Info' icon on On Platform Smart Charts Template
    * I am logged in
    * I open "tes01b4713ffc7c6c1000bc42d8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "#1 of Results Nodes > Info Icon" should be visible
    * I click "#1 of Results Nodes > Collapse Button"
    * "#1 of Results Nodes > Info Icon" should be visible
    * I remember number of "Results Nodes" as "ResultsNodesN"
    * I remember random integer below "{$ResultsNodesN}" and above "1" as "InfoToClick"
    * I click "#{$InfoToClick} of Results Nodes > Info Icon"
    * "#{$InfoToClick} of Results Nodes > Info Bar" should be visible
    * "#{$InfoToClick} of Results Nodes > Info Icon" should be visible
    * "#{$InfoToClick} of Results Nodes > Info Bar > X Icon" should be visible
    * I click "#{$InfoToClick} of Results Nodes > Expand Button"
    * "#{$InfoToClick} of Results Nodes > #1 of Headers" should be visible
    * "#{$InfoToClick} of Results Nodes > Info Bar" should be visible
    * I click "#{$InfoToClick} of Results Nodes > Info Bar > X Icon"
    * "#{$InfoToClick} of Results Nodes > Info Bar" should not be visible
    * "#{$InfoToClick} of Results Nodes > #1 of Headers" should be visible
    * "#{$InfoToClick} of Results Nodes > Info Icon" should be visible

  @CU-31536
  Scenario Outline: Verify displaying of On Platform Smart Charts in vertical and horizontal view
    * I am logged in
    * I open "tes01b48ff1cc7c6c1000925cd8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "#1 of Results Nodes" should be visible
    * "Utility Bar" should be visible
    * "#1 of Results Nodes > #1 of Headers" should be visible
    * "#1 of Results Nodes > Collapse Button" should be visible
    * Count of "#1 of Results Nodes > Headers" should be equal to "5"
    * "Horizontal View" should be visible
    * Text of "#1 of Results Nodes > Content > #1 of Rows" should contain "<state>" ignoring case
    * I remember text of "#1 of Results Nodes > #2 of Headers" as "title2"
    * I remember text of "#1 of Results Nodes > #3 of Headers" as "title3"
    * I remember text of "#1 of Results Nodes > #4 of Headers" as "title4"
    * I remember text of "#1 of Results Nodes > #5 of Headers" as "title5"
    * I click "Utility Bar > Columns Icon"
    * "Vertical View" should be visible
    * Count of "#1 of Results Nodes > Headers" should be equal to "51"
    * Text of "#1 of Results Nodes > Content > #1 of Rows" should contain "{$title2}" ignoring case
    * Text of "#1 of Results Nodes > Content > #2 of Rows" should contain "{$title3}" ignoring case
    * Text of "#1 of Results Nodes > Content > #3 of Rows" should contain "{$title4}" ignoring case
    * Text of "#1 of Results Nodes > Content > #4 of Rows" should contain "{$title5}" ignoring case
    * Text of "#1 of Results Nodes > #1 of Headers" should be "<state>" ignoring case
    Examples:
      | state   |
      | Alabama |

@critical_path
@mvl
Feature: Related Items

  @CU-29738
  @local
  Scenario: Verify "Related Items" trigger is displayed in document body
    * I am logged in
    * I am on "TAX - ALL" PA
    * I perform search of "Regulation: Georgia Personal Income Tax Guide, Georgia, Reg. Sec. 560-7-3-.04, Captive Real Estate Investment Trust Expenses and Costs"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Related Items Dropdown" should be visible
    * I click "Document Frame > #1 of Related Items Dropdown"
    * "Document Frame > #1 of Related Items Dropdown > #1 of Items" should be visible
    * Text in collection of "Document Frame > #1 of Related Items Dropdown > Items" should contain "Statutes"
    * Text in collection of "Document Frame > #1 of Related Items Dropdown > Items" should contain "Regulations"
    * Text in collection of "Document Frame > #1 of Related Items Dropdown > Items" should contain "CCH Explanations"
    * I click "Document Frame > #1 of Related Items Dropdown > #1 of Items"
    * "Related Items Popup" should be visible
    * I click "Related Items Popup > Close Button"
    * "Related Items Popup" should not be visible

  @CU-29777
  Scenario: Verify that corresponding document opens when User clicks link in Related Items popup
    * I am logged in
    * I perform search of "jga4009013e2c84d48007"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Related Items Dropdown" should be visible
    * I click "Document Frame > #1 of Related Items Dropdown"
    * "Document Frame > #1 of Related Items Dropdown > #1 of Items" should be visible
    * I click "Document Frame > #1 of Related Items Dropdown > #1 of Items"
    * "Related Items Popup" should be visible
    * "Related Items Popup > #1 of Documents" should be visible
    * I click "Related Items Popup > #Oregon State Tax Reporter, ¶16-125, Oregon, Additions--Related Party Transactions in Documents > Document Title"
    * I wait until "Loading Indicator" is gone
    * I wait 2 seconds
    * "Show Metadata" should be visible
    * I click "Show Metadata"
    * Text of "Document Frame" should contain "Oregon State Tax Reporter, ¶16-125, Oregon, Additions--Related Party Transactions" ignoring whitespaces
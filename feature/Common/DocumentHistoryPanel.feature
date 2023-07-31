@smoke
@mvl @vlcc
@ipa
@document_history_panel
Feature: Document History Panel

  @CU-29063 @CU-32264
  @local
  Scenario: Verify the display of document history widget on reading pane
    * I am logged in
    # Open "ALL CONTENT" PA
    * I am on "ALL CONTENT" PA
    # Search for "Regulation: Federal Tax Regulations, §1.0-1, Internal Revenue Code of 1954 and regulations"
    * I perform search of "Regulation: Federal Tax Regulations, §1.0-1, Internal Revenue Code of 1954 and regulations"
    * "#1 of Non UCM Documents" should be clickable
    # Click #1 of Documents
    * I click "#1 of Non UCM Documents"
    * I wait until "Loading Indicator" is gone
    # Verify that Document Page page is opened
    * "Document Frame > Document Content" should be visible
    # Verify that "Document History" button is displayed next to "Contents" panel
    * "Tab Triggers > History" should be visible

  @CU-29064 @CU-32265
  @local
  Scenario: Verify document history widget can be opened on clicking
    * I am logged in
    # Open "ALL CONTENT" PA
    * I am on "ALL CONTENT" PA
    # Search for "fnl0109013e2c83f97697"
    * I perform search of "fnl0109013e2c83f97697"
    * "#1 of Non UCM Documents" should be clickable
    # Click #1 of Documents
    * I click "#1 of Non UCM Documents"
    # Verify that page is opened
    * "Document Frame > Document Content" should be visible
    # Verify that Document History button is displayed next to "Contents" panel
    * "Tab Triggers > History" should be visible
    # Click "Document History" button
    * I click "Tab Triggers > History"
    # Verify that "History" tab is visible
    * "History Tab" should be visible
    # Verify that document's title in "History" tab contain "daTitle" displyaed in "Title Bar"
    * I remember text of "Search Bar > Search Title" as "daTitle"
    * Text of "History Tab" should contain "{$daTitle}"
    # Click "Close" button in "History" tab
    * I click "History Tab > Close Button"
    # Verify that "History" tab is not displayed
    * "History Tab" should not be visible
    # Verify that "Document History" button is visible
    * "Tab Triggers > History" should be visible

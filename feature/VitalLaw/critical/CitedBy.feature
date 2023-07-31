@critical_path
@mvl
Feature: Cited By

  @CU-29705
  @local
  Scenario: Verify that Cited By overlay appears * User clicks Cited By link
    * I am logged in
    # Open 'ust0209013e2c86f4eb31' doc
    * I perform search of "ust0209013e2c86f4eb31"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    # Click on History tab near TOC
    * I click "Tab Triggers > History"
    * "History Tab" should be visible
    # Verify that the second item in History has 'SCT' title
    * Text of "History Tab > #2 of History Items > Case Signature" should be "SCT"
    # Click on 'Cited By' link
    * I click "History Tab > #2 of History Items > Cited By Link"
    # Verify that 'Cited By' overlay with '220 US 107,  31 SCt 342'items is displayed
    * "Cited By Popup" should be visible
    * Text of "Cited By Popup > Document Info Box > #1 of Citation Items Links" should contain "220 US 107,"
    * Text of "Cited By Popup > Document Info Box > #2 of Citation Items Links" should contain "31 SCt 342"

  @CU-29708
  @local
  Scenario: Verify that links from Cited By popup leads to appropriate documents
    * I am logged in
    # Open '1a8c230e80e2c8cbff2628e98ab1890a' doc
    * I perform search of "1a8c230e80e2c8cbff2628e98ab1890a"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    # Click on History tab near TOC
    * I click "Tab Triggers > History"
    * "History Tab" should be visible
    # Verify that the third item in History has 'SCT (AFF'G CA)' title
    * Text of "History Tab > #3 of History Items > Case Signature" should be "SCT (AFF'G CA)"
    # Click on 'Cited By' link
    * I click "History Tab > #3 of History Items > Cited By Link"
    # Verify that 'Cited By' overlay is displayed
    * "Cited By Popup" should be visible
    * "Cited By Popup > Content Items > #1 of Case Titles" should be visible
    # Remember the title of the first citation and click on it
    * "Cited By Popup > Document Info Box > Case Title" should be visible
    * I remember text of "Cited By Popup > Content Items > #1 of Citations" as "docTitle1"
    * I click "Cited By Popup > Content Items > #1 of Citations"
    # Verify that the doc is opened in a new tab
    * I switch to last tab
    * "Document Frame > Document Content" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that doc frame contains the citation title that was memorized
    * Text of "Document Frame" should contain "{$docTitle1}" ignoring whitespaces

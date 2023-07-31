@smoke
@mvl @vlcc
@dailies
Feature: Dailies

  @CU-29059 @CU-32465
  Scenario: Verify UI of 'Dailies' tab in 'News' overlay
    * I am logged in
    # Click "News" dropdown in Header
    * I click "Header > News Dropdown"
    # Click "Dailies" option in "News" dropdown
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that "News" popup is opened
    * "News Popup" should be visible
    # Verify that link with text "MANAGE DAILY ALERTS" is displayed
    * "News Popup > Manage Daily Alerts" should be visible
    * Text of "News Popup > Manage Daily Alerts" should be "MANAGE DAILY ALERTS"
    # Verify that "DAILIES" tab is active
    * Text of "News Popup > Active Tab" should contain "DAILIES"
    * I switch to "Dailies Iframe" iframe
    * "Dailies Iframe > Dailies Header" should be visible
    # Verify that text of that Header of table with Dailies contains the following  columns:
    * Text of "Dailies Iframe > Dailies Header" should contain "Name"
    * Text of "Dailies Iframe > Dailies Header" should contain "Status"
    * Text of "Dailies Iframe > Dailies Header" should contain "RSS"
    # Verify that "Subscribe" button is displayed next to each dailies title
    * Each element of "Dailies Iframe > Dailies List" should contain "Subscribe"
    * I remember number of "Dailies Iframe > Dailies List" as "itemsNumber"
    # Verify that "RSS" icon  is displayed for each daily
    * Count of "Dailies Iframe > Rss Icons" should be equal to "{$itemsNumber}"
    # Verify that "View" dropdown is displayed with the text "ALL" in it
    * "Dailies Iframe > View Dropdown" should be visible
    * Text of "Dailies Iframe > View Dropdown" should contain "ALL"
    * I switch to default content
    * "News Popup > Save And Close" should be enabled
    # Click "Close" button
    * I click "News Popup > Save And Close"
    # Verify that "News" popup is closed
    * "News Popup" should not be visible
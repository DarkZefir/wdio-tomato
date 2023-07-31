@smoke
@mvl @vlcc @px
@newsletters_customiozation
Feature: Newsletters Customization

  @CU-29094 @CU-32337 @CU-33100
  Scenario: Verify UI of 'Newsletters' tab in 'News' overlay
    * I am logged in
    # Click "News" in Header
    * I click "Header > News Dropdown"
    # Click "NewsLetters" in "News" dropdown
    * I click "Header > News Dropdown > #Newsletters in List"
    # Verify that "News" popup is displayed
    * "News Popup" should be present
    # Verify that active tab in "News" popup is "NEWSLETTERS"
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    # Verify that "Manage Daily Alerts" button is not displayed within "News" overlay
    * "News Popup > Manage Daily Alerts" should not be visible
    # Verify the following elements in "News" popup:
    * "News Popup > X Close Button" should be visible
    * "News Popup > #1 of Newsletters Name List" should be visible
    * Text of "News Popup > #1 of Newsletters Name List" should not be ""
    * "News Popup > #1 of Newsletters Name List" should be visible
    * "News Popup > Newsletters View Dropdown" should be visible
    * Text of "News Popup > Newsletters View Dropdown" should be "ALL"
    * "News Popup > Save And Close" should not be enabled
    * "News Popup > Cancel Button" should be enabled
    * "News Popup > Newsletters Name Column Header" should be visible
    * Text of "News Popup > Newsletters Name Column Header" should be "Name"
    * "News Popup > Newsletters Email Subscribe Column Header" should be visible
    * Text of "News Popup > Newsletters Email Subscribe Column Header" should be "Email Subscribe"
    * "News Popup > Newsletters Customize Column Header" should be visible
    * Text of "News Popup > Newsletters Customize Column Header" should be "Customize"
    * "News Popup > Newsletters Aggregated Email Digest Column Header" should be visible
    * Text of "News Popup > Newsletters Aggregated Email Digest Column Header" should be "Aggregated Email Digest"
    * "News Popup > Newsletters Email Format Column Header" should be visible
    * Text of "News Popup > Newsletters Email Format Column Header" should be "Email Format"
    * "News Popup > Newsletters Help Icon" should be visible
    * "News Popup > Newsletters Email Input" should be visible
    * Text of "News Popup > Newsletters Email Input Legend" should be "Email"
    # Click "View" dropdown
    * I click "News Popup > Newsletters View Dropdown"
    * "News Popup > #1 of View Dropdown Items" should be visible
    # Verify that the following items are present in opened "View" dropdown
    * Text in collection of "News Popup > View Dropdown Items" should contain "All"
    * Text in collection of "News Popup > View Dropdown Items" should contain "Available"
    * Text in collection of "News Popup > View Dropdown Items" should contain "Subscribed"
    # Verify that number of items in opened "View" dropdown is 3
    * Count of "News Popup > View Dropdown Items" should be equal to "3"
    # Click "Cancel" button
    * I click "News Popup > Cancel Button"
    # Verify that "News" popup is not displayed
    * "News Popup" should not be visible

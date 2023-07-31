@smoke
@mvl
@newsletters_customiozation
Feature: Newsletters Customization

  @CU-29680
  Scenario Outline: Verify UI of 'Customize' overlay for Newsletters/Trackers
    * I am logged in
    # Click "News" in Header
    * I click "Header > News Dropdown"
    # Click Second item in "News" dropdown
    * I click "Header > News Dropdown > #2 of List"
    # Verify that active tab in "News" dropdown is "NEWSLETTERS"
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    # Click 23rd item ("Tax") in Newsletters List
    * I click "News Popup > #23 of Newsletters Name List"
    # Verify that 23rd item("Tax") is expanded and trackers are displayed
    * "News Popup > #1 of Trackers" should be visible
    # Select checkbox in "Email Subscribe" column next to 4th of displayed trackers
    * I click "News Popup > #4 of Trackers > Subscribe"
    * "News Popup > #4 of Trackers > Customize" should be visible
    # Click "Customize" icon ("Pencil") in "Customize" column next to 4th of displayed trackers
    * I click "News Popup > #4 of Trackers > Customize"
    # Verify that "CUSTOMIZE" popup is displayed
    * "Tracker Customization Popup" should be visible
    # Verify the following elements in "Customize" popup:
    * Text of "Tracker Customization Popup > Notification Info Text" should be "Applied changes are not reflected in the RSS feed."
    * Text of "Tracker Customization Popup > Notification Info Label" should be "Hide RSS Feed" ignoring whitespaces
    * "Tracker Customization Popup > Notification Info Checkbox" should not be selected
    * Text of "Tracker Customization Popup" should contain "You can change the name of this Tracker, add search terms, apply thesaurus and save it as a new Tracker in your list by clicking SAVE."
    * Text of "Tracker Customization Popup > Default Tracker Title Label" should be "Default Title"
    * Text of "Tracker Customization Popup > Default Tracker Title Tracker Name" should be "<TrackerName>"
    * Text of "Tracker Customization Popup > Customization Tracker Title Label" should be "Tracker Title"
    * Value in "Tracker Customization Popup > Customization Tracker Title Input" should be "<TrackerName>"
    * Text of "Tracker Customization Popup > Customization Search Term Label" should be "Search Terms"
    * Value in "Tracker Customization Popup > Customization Search Term Input" should be ""
    * "Tracker Customization Popup > Customization Thesaurus Checkbox" should not be selected
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab1Name>"
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab2Name>"
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab3Name>"
    * "Tracker Customization Popup > Cancel" should be enabled
    * "Tracker Customization Popup > Save And Close" should not be enabled
    * "Tracker Customization Popup > X Close Button" should be enabled

    Examples:
      | TrackerPA | TrackerName          | Tab1Name | Tab2Name | Tab3Name       |
      | Tax       | Daily State Tax News | TOPICS   | STATES   | DOCUMENT TYPES |
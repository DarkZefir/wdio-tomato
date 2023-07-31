@smoke
@vlcc
@newsletters_customiozation
Feature: Newsletters Customization

  @CU-32335
  Scenario Outline: [VLCC] Verify UI of 'Customize' overlay for Newsletters/Trackers
    * I am logged in
    # Click "News" in Header
    * I click "Header > News Dropdown"
    # Click Second item in "News" dropdown
    * I click "Header > News Dropdown > #2 of List"
    # Verify that active tab in "News" dropdown is "NEWSLETTERS"
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    # * I remember index of "News Popup > Newsletters Name List" matching "<TrackerPA>" as "itemToClick"
    * I click "News Popup > #Food, Drugs, and Devices in Newsletters Name List"
    * "News Popup > #1 of  Trackers" should be visible
    * I remember text of "News Popup > #1 of Trackers > Title" as "TrackerName"
    * I click "News Popup > #1 of Trackers > Subscribe"
    * "News Popup > #1 of Trackers > Customize" should be visible
    * I click "News Popup > #1 of Trackers > Customize"
    # Verify that "CUSTOMIZE" popup is displayed
    * "Tracker Customization Popup" should be visible
    # Verify the following elements in "Customize" popup:
    * Text of "Tracker Customization Popup > Notification Info Text" should be "Applied changes are not reflected in the RSS feed."
    * Text of "Tracker Customization Popup > Notification Info Label" should be "Hide RSS Feed" ignoring whitespaces
    * "Tracker Customization Popup > Notification Info Checkbox" should not be selected
    * Text of "Tracker Customization Popup" should contain "You can change the name of this Tracker, add search terms, apply thesaurus and save it as a new Tracker in your list by clicking SAVE."
    * Text of "Tracker Customization Popup > Default Tracker Title Label" should be "Default Title"
    * Text of "Tracker Customization Popup > Default Tracker Title Tracker Name" should be "{$TrackerName}"
    * Text of "Tracker Customization Popup > Customization Tracker Title Label" should be "Tracker Title"
    * Value in "Tracker Customization Popup > Customization Tracker Title Input" should be "{$TrackerName}"
    * Text of "Tracker Customization Popup > Customization Search Term Label" should be "Search Terms"
    * Value in "Tracker Customization Popup > Customization Search Term Input" should be ""
    * "Tracker Customization Popup > Customization Thesaurus Checkbox" should not be selected
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab1Name>"
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab2Name>"
    * "Tracker Customization Popup > Cancel" should be enabled
    * "Tracker Customization Popup > Save And Close" should not be enabled
    * "Tracker Customization Popup > X Close Button" should be enabled

    Examples:
      | TrackerPA                | Tab1Name | Tab2Name |
      | Food, Drugs, and Devices | TOPICS   | DOCTYPES |

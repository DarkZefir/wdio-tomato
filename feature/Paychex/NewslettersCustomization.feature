@smoke
@px
@newsletters_customization
Feature: Newsletters Customization

  @CU-33102
  Scenario Outline: [PX] Verify UI of 'Customize' overlay for Newsletters/Trackers
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<NodeName> in Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * I click "News Popup > #<TrackerName> in Trackers > Subscribe"
    * "News Popup > #<TrackerName> in Trackers > Customize" should be visible
    * I click "News Popup > #<TrackerName> in Trackers > Customize"
    * "Tracker Customization Popup" should be visible
    * Text of "Tracker Customization Popup > Notification Info Text" should be "Applied changes are not reflected in the RSS feed."
    * Text of "Tracker Customization Popup > Notification Info Label" should contain "Hide RSS Feed"
    * "Tracker Customization Popup > Notification Info Checkbox" should not be selected
    * Text of "Tracker Customization Popup" should contain "You can change the name of this Tracker, add search terms, apply thesaurus and save it as a new Tracker in your list by clicking SAVE."
    * Text of "Tracker Customization Popup > Default Tracker Title Label" should be "Default Title"
    * Text of "Tracker Customization Popup > Default Tracker Title Tracker Name" should contain "<TrackerName>"
    * Text of "Tracker Customization Popup > Customization Tracker Title Label" should be "Tracker Title"
    * Value in "Tracker Customization Popup > Customization Tracker Title Input" should be "<TrackerName>"
    * Text of "Tracker Customization Popup > Customization Search Term Label" should be "Search Terms"
    * Value in "Tracker Customization Popup > Customization Search Term Input" should be ""
    * "Tracker Customization Popup > Customization Thesaurus Checkbox" should not be selected
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab1Name>"
    * Text of "Tracker Customization Popup > Customization Topics" should contain "<Tab2Name>"
    * "Tracker Customization Popup > Cancel" should be enabled
    * "Tracker Customization Popup > Save And Close" should not be enabled
    * "Tracker Customization Popup > X Close Button" should be enabled

    Examples:
      | NodeName | TrackerName     | Tab1Name | Tab2Name       |
      | Tax      | Federal Tax Day | TOPICS   | DOCUMENT TYPES |

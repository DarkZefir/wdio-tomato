@critical_path
@mvl
Feature: Newsletters

  @CU-29095
  Scenario: Verify UI of expanded newsletters and trackers
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * I click "News Popup > #1 of Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * Text of "News Popup > #1 of Trackers" should be "Business Franchise Guide Newsletters" ignoring whitespaces
    * "News Popup > #1 of Trackers > Aggregated Email Digest" should not be visible
    * "News Popup > #1 of Trackers > Email Format Dropdown" should not be visible
    * "News Popup > #1 of Trackers > Customize" should not be visible
    * I click "News Popup > #1 of Trackers > Subscribe"
    * "News Popup > #1 of Trackers > Aggregated Email Digest" should be visible
    * "News Popup > #1 of Trackers > Email Format Dropdown" should be visible
    * "News Popup > #1 of Trackers > Customize" should be visible
    * Text of "News Popup > #1 of Trackers > Email Format Dropdown" should be "FULL TEXT"

  @CU-29729
  Scenario Outline: Verify that user is able to subscribe to a newsletter/tracker
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<TrackerPA> in Newsletters Name List"
    * "News Popup > #1 of  Trackers" should be visible
    * I remember index of "News Popup > Trackers" matching "<TrackerName>" as "trackerIndex1"
    * I scroll "News Popup > Content" element down "150" pixels
    * I click "News Popup > #{$trackerIndex1} of Trackers > Subscribe"
    * "News Popup > Save And Close" should be clickable
    * I click "News Popup > Save And Close"
    * "News Popup" should not be visible
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #2 of List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<TrackerPA> in Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * "News Popup > #{$trackerIndex1} of Trackers > Subscribe" should be selected

    Examples:
      | TrackerPA | TrackerName     |
      | Tax       | Federal Tax Day |

  @CU-29712
  Scenario Outline: Verify that user is able to unsubscribe from a newsletter/tracker
    * I am logged in
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<TrackerPA> in Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * I scroll "News Popup > #<TrackerName> in Trackers" to center of the window
    * I wait 2 seconds
    * I click "News Popup > #<TrackerName> in Trackers > Subscribe"
    * "News Popup > #<TrackerName> in Trackers > Subscribe" should be selected
    * "News Popup > Save And Close" should be clickable
    * I click "News Popup > Save And Close"
    * "News Popup" should not be visible
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #2 of List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<TrackerPA> in Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * "News Popup > #<TrackerName> in Trackers > Subscribe" should be selected
    * I click "News Popup > #<TrackerName> in Trackers > Subscribe"
    * "News Popup > #<TrackerName> in Trackers > Subscribe" should not be selected
    * I click "News Popup > Save And Close"
    * "News Popup" should not be visible
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #2 of List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #<TrackerPA> in Newsletters Name List"
    * "News Popup > #1 of  Trackers" should be visible
    * "News Popup > #<TrackerName> in Trackers > Subscribe" should not be selected

    Examples:
      | TrackerPA | TrackerName     |
      | Tax       | Federal Tax Day |

  @CU-29101
  Scenario: Verify that after click on 'Help' icon in 'Newsletters' tab correct help page is opened
    * I am logged in
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * I click "News Popup > Newsletters Help Icon"
    * I switch to last tab
    * I should see "Subscribing to News" text on page
    * I wait until page title is "Subscribing to News – VitalLaw™ Help"

  @CU-29103
  Scenario: Verify that user is able to select preferable Email Format for newsletters and trackers
    * I am logged in
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * I click "News Popup > #1 of Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * I click "News Popup > #1 of Trackers > Subscribe"
    * "News Popup > #1 of Trackers > Email Format Dropdown" should be visible
    * I click "News Popup > #1 of Trackers > Email Format Dropdown"
    * "News Popup > #1 of Trackers > #1 of Email Format List" should be visible
    * Text in collection of "News Popup > #1 of Trackers > Email Format List" should contain "Full Text"
    * Text in collection of "News Popup > #1 of Trackers > Email Format List" should contain "Headlines w/excerpts"
    * I click "News Popup > #1 of Trackers > #Headlines w/excerpts in Email Format List"
    * Text of "News Popup > #1 of Trackers > Email Format Dropdown" should be "HEADLINES W/EXCERPTS"
    * I click "News Popup > #1 of Trackers > Email Format Dropdown"
    * "News Popup > #1 of Trackers > #1 of Email Format List" should be visible
    * I click "News Popup > #1 of Trackers > #Full Text in Email Format List"
    * Text of "News Popup > #1 of Trackers > Email Format Dropdown" should be "FULL TEXT"

  @CU-29107
  @logout
  Scenario: Verify that Tracker DA title user (with limited subscription) is entitled to is displayed in 'Name' column of 'Newsletters' overlay
    * I am logged in as "2london@wk.com" with "password" password
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * Count of "News Popup > Newsletters Name List" should be equal to "5"
    * Text of "News Popup > #1 of Newsletters Name List" should contain "Banking & Consumer Finance"
    * Text of "News Popup > #2 of Newsletters Name List" should contain "Employee Benefits"
    * Text of "News Popup > #3 of Newsletters Name List" should contain "Litigation"
    * Text of "News Popup > #4 of Newsletters Name List" should contain "Payroll & Entitlements"
    * Text of "News Popup > #5 of Newsletters Name List" should contain "Tax"
    * I click "News Popup > #Litigation in Newsletters Name List"
    * Count of "News Popup > Trackers" should be equal to "1"
    * Text of "News Popup > #1 of Trackers" should contain "Of Counsel"

  @CU-29108
  Scenario: Verify that 'Info' icon is displayed next to Newsletters name and leads to 'Newsletter Information' overlay
    * I am logged in
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * I click "News Popup > #1 of Newsletters Name List"
    * "News Popup > #1 of Trackers > Information Icon" should be visible
    * I click "News Popup > #1 of Trackers > Information Icon" using JS
    * "Newsletter Information Popup" should be visible
    * Text of "Newsletter Information Popup > Content" should not be ""

  @CU-29669
  Scenario: Verify that user is able to add additional email address on 'Customize' overlay of News_Newsletters
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I clear "News Popup > Newsletters Email Input"
    * I remember random integer below "999" and above "111" as "random"
    * I type "randomStr{$random}@11.law" in "News Popup > Newsletters Email Input"
    * "News Popup > Save And Close" should be clickable
    * I click "News Popup > Save And Close"
    * "News Popup" should not be visible
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #2 of List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * I type ", news.cheetah@gmail.com" in "News Popup > Newsletters Email Input"
    * I wait 3 seconds
    * "News Popup > Save And Close" should be clickable
    * I click "News Popup > Save And Close"
    * I wait until "Loading Indicator" is gone
    * "News Popup" should not be visible
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #2 of List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * Value in "News Popup > Newsletters Email Input" should be "randomStr{$random}@11.law, news.cheetah@gmail.com"

  @CU-29739
  Scenario: Verify that 'The email address is empty.' inline message is displayed under 'Email' field of 'Newsletters' overlay when it is empty
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * "News Popup > Newsletters Email Input" should be clickable
    * I send sequence of keys "Control, A" to element "News Popup > Newsletters Email Input"
    * I send sequence of keys "Backspace" to active element
    * "News Popup > Newsletters Email Validation Error" should be visible
    * Text of "News Popup > Newsletters Email Validation Error" should be "The email address is empty."

  @CU-29751
  Scenario: Verify that 'An email address seems to be invalid' message is displayed under 'Email' field of 'Newsletters' overlay when format of input email is not valid
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should contain "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * "News Popup > Newsletters Email Input" should be clickable
    * I clear "News Popup > Newsletters Email Input"
    * I type "u2@wk" in "News Popup > Newsletters Email Input"
    * "News Popup > Newsletters Email Validation Error" should be visible
    * Text of "News Popup > Newsletters Email Validation Error" should be "An email address seems to be invalid"

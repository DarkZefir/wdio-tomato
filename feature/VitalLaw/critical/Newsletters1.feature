@critical_path
@mvl
Feature: Newsletters 1

  @CU-29848
  Scenario: Verify that by default RSS Icon is displayed next to each newsletters/tracker item in the 'Newsletters' tab
    * I am logged in
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Newsletters in List"
    * "News Popup" should be present
    * Text of "News Popup > Active Tab" should be "NEWSLETTERS"
    * "News Popup > #1 of Newsletters Name List" should be visible
    * I click "News Popup > #1 of Newsletters Name List"
    * "News Popup > #1 of Trackers" should be visible
    * I remember number of "News Popup > Trackers > RSS" as "NumberOfRSSIcons1"
    * Count of "News Popup > Trackers > Title" should be equal to "{$NumberOfRSSIcons1}"

  @CU-29111
  @logout
  Scenario: Verify the 'Newsletters' item is not displayed in 'News' dropdown when the user is not subscribed to correspondent publication
    * I am logged in as "HRKCLimit@wk.com" with "password" password
    *  I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    * Text in collection of "Header > News Dropdown > List" should not contain "Newsletters"

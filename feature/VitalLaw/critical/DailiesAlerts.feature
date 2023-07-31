@critical_path
@mvl
Feature: Dailies Alerts

  @CU-31848
  Scenario: Dailies Alerts: Verify UI of Alerts overlay (User doesn't have any Alerts)
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Verify that 'YOUR ALERTS' tab is displayed
    * Text of "Manage Daily Alerts Popup > Tab" should be "YOUR ALERTS"
    # Verify that Search Input with 'Add a search term' placeholder is displayed
    * "Manage Daily Alerts Popup > Search Input" should be visible
    * Placeholder text for "Manage Daily Alerts Popup > Search Input" should be "Add a search term"
    # Verify that 'Select Dailies' drop-down is displayed
    * "Manage Daily Alerts Popup > Select Dailies" should be visible
    # Verify that 'Apply' button is disabled
    * "Manage Daily Alerts Popup > Apply Button" should not be enabled
    # Verify that 'To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply".' instruction is displayed
    * Text of "Manage Daily Alerts Popup > Instruction Message" should be "To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply"."
    # Verify that 'Search Terms', 'Dailies', 'Delete' headers are displayed
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Search Terms"
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Dailies"
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Delete"
    # Verify that 'X Close' and 'Close' buttons are displayed
    * "Manage Daily Alerts Popup > X Close Button" should be visible
    * "Manage Daily Alerts Popup > Close Button" should be visible

  @CU-31850
  @logout
  Scenario: Dailies Alerts: Verify UI of Alerts overlay (User has Alerts)
    # Login as 'tag1@wk.com' with 'password' password
    * I am logged in as "tag1@wk.com" with "password" password
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Verify that 'YOUR ALERTS' tab is displayed
    * Text of "Manage Daily Alerts Popup > Tab" should be "YOUR ALERTS"
    # Verify that Search Input with 'Add a search term' placeholder is displayed
    * "Manage Daily Alerts Popup > Search Input" should be visible
    * Placeholder text for "Manage Daily Alerts Popup > Search Input" should be "Add a search term"
    # Verify that 'Select Dailies' drop-down is displayed
    * "Manage Daily Alerts Popup > Select Dailies" should be visible
    # Verify that 'Apply' button is disabled
    * "Manage Daily Alerts Popup > Apply Button" should not be enabled
    # Verify that instruction 'To create a search alert...' is not displayed
    * "Manage Daily Alerts Popup > Instruction Message" should not be visible
    # Verify that 'Search Terms', 'Dailies', 'Delete' headers are displayed
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Search Terms"
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Dailies"
    * Text of "Manage Daily Alerts Popup > Table Header" should contain "Delete"
    * "Manage Daily Alerts Popup > #1 of Alert Items" should be visible
    # Verify that 'Name', 'Info', 'Dailies Drop-down', 'Delete' are displayed
    * "Manage Daily Alerts Popup > #1 of Alert Items Name" should be visible
    * "Manage Daily Alerts Popup > #1 of Alert Items Info" should be visible
    * "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be visible
    * "Manage Daily Alerts Popup > #1 of Alert Items Delete" should be visible
    # Verify that 'X Close' and 'Close' buttons are displayed
    * "Manage Daily Alerts Popup > X Close Button" should be visible
    * "Manage Daily Alerts Popup > Close Button" should be visible

  @CU-31852
  Scenario: Dailies Alerts: Verify that "Apply" button is disabled when user types term in "Search Input" field, but doesn't select Daily from "Select Dailies" dropdown
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'tax' into the Search field
    * I type "tax" in "Manage Daily Alerts Popup > Search Input"
    * Value in "Manage Daily Alerts Popup > Search Input" should be "tax"
    # Verify that 'Apply' button is disabled
    * "Manage Daily Alerts Popup > Apply Button" should not be enabled

  @CU-31853
  Scenario: Dailies Alerts: Verify that "Apply" button is disabled when user doesn't type term in "Search Input" field, but selects Daily from "Select Dailies" dropdown
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Select the first item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown" should not be visible
    # Verify that 'Apply' button is disabled
    * "Manage Daily Alerts Popup > Apply Button" should not be enabled

  @CU-31855
  Scenario Outline: Dailies Alerts: Verify that user can create Daily Search Alert from Alerts overlay
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'business and tax' into the Search field
    * I type "business and tax" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Select the <element> from examples
    * I click "Manage Daily Alerts Popup > Dropdown > <element> Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    * "Manage Daily Alerts Popup > #1 of Alert Items" should be visible
    # Verify that the name of the alert is 'business and tax'
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Name" should be "business and tax"
    # Verify that the input of the 'Dailies' drop-down is <text> from examples
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be "<text>"

    Examples:
      | element     | text       |
      | #1 of Items | 1 Dailies  |
      | Select All  | 19 Dailies |

  @CU-31856
  Scenario Outline: Dailies Alerts: Verify that search is rerun when user clicks on Search term
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'tax' into the Search field
    * I type "tax" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Remember the title of the drop-down item exactly matching <daily1> from examples and select it
    * I remember index of "Manage Daily Alerts Popup > Dropdown > Items" matching "<daily1>" as "index1"
    * I click "Manage Daily Alerts Popup > Dropdown > #{$index1} of Items Checkbox"
    # Remember the title of the drop-down item exactly matching <daily2> from examples and select it
    * I remember index of "Manage Daily Alerts Popup > Dropdown > Items" matching "<daily2>" as "index2"
    * I click "Manage Daily Alerts Popup > Dropdown > #{$index2} of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    * "Manage Daily Alerts Popup > #1 of Alert Items Name" should be visible
    # Verify that the name of the alert is 'tax'
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Name" should be "tax"
    # Verify that the input of 'Dailies' drop-down is '2 Dailies'
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be "2 Dailies"
    # Click on the name of the alert
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Name"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    # Verify that 'tax' search pill is displayed in the search field
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    # Verify that two filters are selected
    * Count of "Search Bar > PreSearch Filters > Filter Name" should be equal to "2"
    # Verify that 'MOST RECENT ON TOP' option is displayed in the drop-down
    * Text of "Sorting Menu Button" should be "MOST RECENT ON TOP"
    # Click on Info icon
    * I click "Results Toolbar > Search Information Icon"
    # Verify that Search info popup is displayed
    * "Search Information Popup" should be visible
    # Verify that 'Search Query' is 'tax'
    * Text of "Search Information Popup > Search Queries" should match "tax"
    # Verify that 'Terms Applies' is 'tax'
    * Text of "Search Information Popup > Applied Terms" should match "tax"
    * "Search Information Popup > #1 of Filters" should be visible
    # Verify that the following lines are displayed as pre-search selections
    * I should see the following lines in "Search Information Popup > Filters" ignoring order:
      | Blockchain News |
      | TAG News        |
    # Verify that 'All Content' is displayed as 'Practice Area'
    * Text of "Search Information Popup > Practice Area" should match "All Content"

    Examples:
      | daily1          | daily2   |
      | Blockchain News | TAG News |

  @CU-31857
  Scenario: Dailies Alerts: Verify that user can create duplicate of Daily Search Alert
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'Job search expense' into the Search field
    * I type "Job search expense" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    * I remember number of "Manage Daily Alerts Popup > Dropdown > Items" as "items"
    * I remember random integer below "{$items}" as "randomItem"
    # Click on any item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #{$randomItem} of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Insert 'Job search expense' into the Search field
    * I type "Job search expense" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Click on any item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #{$randomItem} of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Verify that the name of the alert is 'Job search expense' and the input of the 'Dailies' drop-down is '1 Dailies' for both alerts
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Name" should be "Job search expense"
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be "1 Dailies"
    * Text of "Manage Daily Alerts Popup > #2 of Alert Items Name" should be "Job search expense"
    * Text of "Manage Daily Alerts Popup > #2 of Alert Items Dailies Dropdown" should be "1 Dailies"

  @CU-31859
  Scenario Outline: Dailies Alerts: Verify that user can edit Daily Search Alert
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    # Click on 'Dailies' in 'News' drop-down in Header
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'CU-31859' into the Search field
    * I type "CU-31859" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Click on the first item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of 'Dailies' drop-down is '1 Dailies'
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be "1 Dailies"
    # Click on 'Dailies' drop-down for the created alert
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Select the <item> from examples
    * I click "Manage Daily Alerts Popup > Dropdown > <Item> Checkbox"
    # Click on the blank space of the overlay
    * I click "Manage Daily Alerts Popup > Table Header"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of 'Dailies' drop-down is changed to <text> from examples
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Dailies Dropdown" should be "<text>"

    Examples:
      | Item        | text      |
      | #1 of Items | 0 Dailies |
      | #2 of Items | 2 Dailies |

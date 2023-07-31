@critical_path
@mvl
Feature: Dailies Alerts 1

  @CU-31860
  Scenario: Dailies Alerts: Verify UI of "Search Term" overlay
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    * I click "Header > News Dropdown"
    # Click on 'Dailies' in 'News' drop-down in Header
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    # Insert 'business organisations' into the Search field
    * I type "business organisations" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Remember the first item of the drop-down as 'appliedTerm' and select it
    * I remember text of "Manage Daily Alerts Popup > Dropdown > #1 of Items" as "appliedTerm"
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Click on Info icon for the first alert
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Info"
    * "Search Term Popup" should be visible
    # Verify that 'SEARCH TERM' popup is displayed
    * Text of "Search Term Popup > Title" should be "SEARCH TERM"
    # Verify that the popup contains the info below
    * Text of "Search Term Popup > Content" should contain "Search Query"
    * Text of "Search Term Popup > Content" should contain "business organisations"
    * Text of "Search Term Popup > Content" should contain "Terms Applied"
    * Text of "Search Term Popup > Content" should contain "business organisations"
    * Text of "Search Term Popup > Content" should contain "Pre-Search Selections"
    * Text of "Search Term Popup > Content" should contain "Practice Area: All Content"
    * Text of "Search Term Popup > Content" should contain "{$appliedTerm}"
    * Text of "Search Term Popup > Content" should contain "Post-Search Selections"
    * Text of "Search Term Popup > Content" should contain "None"
    # Verify that 'X Close' and 'CANCEL' and 'DELETE' buttons are dislayed and enabled
    * "Search Term Popup > X Close Button" should be visible
    * "Search Term Popup > X Close Button" should be enabled
    * "Search Term Popup > Cancel Button" should be visible
    * "Search Term Popup > Cancel Button" should be enabled
    * Text of "Search Term Popup > Cancel Button" should be "CANCEL"
    * "Search Term Popup > Delete Button" should be visible
    * "Search Term Popup > Delete Button" should be enabled
    * Text of "Search Term Popup > Delete Button" should be "DELETE"
    # Click on 'Cancel' button
    * I click "Search Term Popup > Cancel Button"
    # Verify that 'Search Term' popup is no longer displayed
    * "Search Term Popup" should not be visible

  @CU-31862
  @logout
  Scenario: Dailies Alerts: Verify that limit Notification appears when user tries to add more than 20 alerts
    # Login as 'alerts@wk.com' with 'password' password
    * I am logged in as "alerts@wk.com" with "password" password
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
    * I wait until "Loading Indicator" is gone
    # Click on Search input
    * I click "Manage Daily Alerts Popup > Search Input"
    * "Maximum Alerts Popup" should be visible
    # Verify that 'MAXIMUM ALERTS REACHED' popup is displayed
    * Text of "Maximum Alerts Popup > Title" should be "MAXIMUM ALERTS REACHED"
    # Verify that 'You have reached the maximum of 20 alerts. To create a new alert, please delete an existing alert.' message is displaued
    * Text of "Maximum Alerts Popup > Message" should be "You have reached the maximum of 20 alerts. To create a new alert, please delete an existing alert." ignoring case ignoring whitespaces ignoring punctuation marks
    * "Maximum Alerts Popup > X Close Button" should be visible
    * "Maximum Alerts Popup > Close Button" should be visible
    # Click on 'Close' button
    * I click "Maximum Alerts Popup > Close Button"
    # Verify that 'MAXIMUM ALERTS REACHED' popup is no longer displayed
    * "Maximum Alerts Popup" should not be visible

  @CU-31863
  Scenario: Dailies Alerts: Verify that user is able to delete Daily from "Search Term" overlay
    * I am logged in
    # Delete all daily alerts
    * I delete all daily alerts
    * I click "Header > News Dropdown"
    # Click on 'Dailies' in 'News' drop-down in Header
    * "Header > News Dropdown > #2 of List" should be visible
    * I click "Header > News Dropdown > #Dailies in List"
    # Verify that News popup is displayed
    * "News Popup" should be visible
    * "News Popup > Manage Daily Alerts" should be visible
    # Click on 'Manage Daily Alerts' link
    * I click "News Popup > Manage Daily Alerts"
    * "Manage Daily Alerts Popup" should be visible
    * I wait until "Loading Indicator" is gone
    # Insert 'rico NOT puerto' into the Search field
    * I type "rico NOT puerto" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Click on the first item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Click on Info icon for the first alert
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Info"
    * "Search Term Popup" should be visible
    # Click on 'Delete' button
    * I click "Search Term Popup > Delete Button"
    * "Confirmation Popup" should be visible
    # Verify that Confirmation popup with 'CONFIRM DELETE' title is displayed
    * Text of "Confirmation Popup > Title" should be "CONFIRM DELETE"
    # Verify that 'Are you sure you want to delete this Alert?This action cannot be undone.' message is displayed
    * Text of "Confirmation Popup > Message" should be "Are you sure you want to delete this Alert?This action cannot be undone." ignoring case ignoring whitespaces ignoring punctuation marks
    # Click on 'Delete' button
    * I click "Confirmation Popup > Confirm Button"
    # Verify that 'To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply".' message is displayed
    * Text of "Manage Daily Alerts Popup > Instruction Message" should be "To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply"."

  @CU-31864
  Scenario: Dailies Alerts: Verify that user is able to delete Daily from Alerts overlay
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
    * I wait until "Loading Indicator" is gone
    # Insert 'doesn't work' into the Search field
    * I type "doesn't work" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Click on the first item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Click on 'Delete' button
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Delete"
    * "Confirmation Popup" should be visible
    # Verify that Confirmation popup with 'CONFIRM DELETE' title is displayed
    * Text of "Confirmation Popup > Title" should be "CONFIRM DELETE"
    # Verify that 'Are you sure you want to delete this Alert?This action cannot be undone.' message is displayed
    * Text of "Confirmation Popup > Message" should be "Are you sure you want to delete this Alert?This action cannot be undone." ignoring case ignoring whitespaces ignoring punctuation marks
    # Click on 'Delete' button
    * I click "Confirmation Popup > Confirm Button"
    # Verify that 'To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply".' message is displayed
    * Text of "Manage Daily Alerts Popup > Instruction Message" should be "To create a search alert, add search term(s) to the search field above, select the dailies to be alerted and then click "apply"."

  @CU-31865
  Scenario: Dailies Alerts: Verify that Daily is not deleted when user clicks "X" button in "Confirmation" overlay
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
    * I wait until "Loading Indicator" is gone
    # Insert 'CU-31865' into the Search field
    * I type "CU-31865" in "Manage Daily Alerts Popup > Search Input"
    # Click on 'Select Dailies' drop-down
    * I click "Manage Daily Alerts Popup > Select Dailies"
    * "Manage Daily Alerts Popup > Dropdown > #1 of Items" should be visible
    # Click on the first item in the drop-down
    * I click "Manage Daily Alerts Popup > Dropdown > #1 of Items Checkbox"
    # Click on 'Apply' button
    * I click "Manage Daily Alerts Popup > Apply Button"
    * I wait until "Loading Indicator" is gone
    # Click on 'Delete' button
    * I click "Manage Daily Alerts Popup > #1 of Alert Items Delete"
    * "Confirmation Popup" should be visible
    # Verify that Confirmation popup with 'CONFIRM DELETE' title is displayed
    * Text of "Confirmation Popup > Title" should be "CONFIRM DELETE"
    # Verify that 'Are you sure you want to delete this Alert?This action cannot be undone.' message is displayed
    * Text of "Confirmation Popup > Message" should be "Are you sure you want to delete this Alert?This action cannot be undone." ignoring case ignoring whitespaces ignoring punctuation marks
    # Click on 'x Close' button
    * I click "Confirmation Popup > X Close Button"
    # Verify that 'CU-31865' alert is still displayed
    * Text of "Manage Daily Alerts Popup > #1 of Alert Items Name" should be "CU-31865"
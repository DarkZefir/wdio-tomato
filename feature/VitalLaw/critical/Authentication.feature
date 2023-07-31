@critical_path
@mvl
Feature: Authentication

  @CU-29044
  @logout
  Scenario: Verify that practice area dashboard is displayed after login with user which is entitled only for one practice area
    # Login as 'onePaUser@wk.com' with 'password' password
    * I am logged in as "onePaUser@wk.com" with "password" password
    # Click on Session Navigator tab
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    # Verify that only two PAs (All Content and KITL) are displayed in Session Navigator
    * Count of "Session Navigator > Practice Areas List Items" should be equal to "2"
    * Text in collection of "Session Navigator > Practice Areas List Items" should contain "KLUWER INTERNATIONAL TAX LAW"
    * Text in collection of "Session Navigator > Practice Areas List Items" should contain "ALL CONTENT"

  @CU-29047
  Scenario: Verify that user see informative message while incorrect User ID entering
    * I am logged in
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    # Verify that VitalLaw login page is displayed
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    # Insert invalid value into 'User ID' field
    * I type "incorrectUserId" in "Login Form > Username Input"
    # Insert 'password' into 'password' field
    * I type "password" in "Login Form > Password Input"
    # Click on Login button
    * I click "Login Form > Login Button"
    * "Login Form > Login Button" should be visible
    # Verify that the message 'Error: Please enter a valid user ID and password. Click the Forgot your password link for password help.' is displayed
    * Text of "Login Form > Error Message" should be "Error: Please enter a valid user ID and password. Click the Forgot your password link for password help."

  @CU-29048
  Scenario: Verify that user see informative message while incorrect Password entering
    * I am logged in
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    # Verify that VitalLaw login page is displayed
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    # Insert 'Taras.Fiashchuk@wolterskluwer.com' into 'User ID' field
    * I type "Taras.Fiashchuk@wolterskluwer.com" in "Login Form > Username Input"
    # Insert 'passwort' into 'Password' field
    * I type "passwort" in "Login Form > Password Input"
    # Click on Login button
    * I click "Login Form > Login Button"
    * "Login Form > Login Button" should be visible
    # Verify that the message 'Error: Please enter a valid user ID and password. Click the "Forgot password?" link for password help.' is displayed
    * Text of "Login Form > Error Message" should be "Error: Please enter a valid user ID and password. Click the Forgot your password link for password help."

  @CU-29049
  Scenario: Verify that user see informative message while incorrect User ID and Password entering
    * I am logged in
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    # Verify that VitalLaw login page is displayed
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    # Insert invalid value into 'User ID' field
    * I type "incorrectUserId" in "Login Form > Username Input"
    # Insert 'passwort' into 'Password' field
    * I type "passwort" in "Login Form > Password Input"
     # Click on Login button
    * I click "Login Form > Login Button"
    * "Login Form > Login Button" should be visible
    # Verify that the message 'Error: Please enter a valid user ID and password. Click the "Forgot password?" link for password help.' is displayed
    * Text of "Login Form > Error Message" should be "Error: Please enter a valid user ID and password. Click the Forgot your password link for password help."

  @CU-29051
  Scenario: Verify that Terms of Use can be opened (from login page) and contain correct information
    * I am logged in
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    # Verify that Login page is displayed
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    * "Login Form > Terms Of Use" should be visible
    # Click on 'Terms of Use link'
    * I click "Login Form > Terms Of Use"
    * I wait 3 seconds
    # Verify that the link https://law-store.wolterskluwer.com/s/policies/online-terms-of-use is opened in a new tab
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "https://law-store.wolterskluwer.com/s/policies/online-terms-of-use" text
    # Verify that the title is 'Terms of Use for CCH Online Content Services'
    * I should see "Terms of Use for CCH Online Content Services" text on page

  @CU-29052
  Scenario: Verify that all Child windows are closed after user logs out from VitalLaw main browser window
    * I am logged in
    # Perform search for 'tax' from the Home page
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    # Select 'Open in New Tab' checkbox
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Click on the first doc in SRL
    * I click "#1 of Documents"
    # Verify that the document is opened in a new tab
    * I switch to last tab
    # Switch back to the first tab
    * I switch to first tab
    # Remember the number of browser tabs (2)
    * I remember number of browser tabs as "numberOfTabs1"
    * "{$numberOfTabs1}" number should be equal to "2"
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"
    * "Login Form > Username Input" should be visible
    * I remember number of browser tabs as "numberOfTabs1"
    # Verify that the number of opened tabs is equal to 1
    * "{$numberOfTabs1}" number should be equal to "1"
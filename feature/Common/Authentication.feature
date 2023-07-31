@smoke
@mvl @vlcc @px
@authentication
Feature: Authentication

  @CU-29042 @CU-32225 @CU-32909
  Scenario: Verify the Login page is displayed when user is Logout from the application
    * I am logged in
    # Click User menu
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on "Logout" option in User Menu
    * I click "Header > User Menu > #Logout in Items"
    # Verify that user is logged out and "Login" page is displayed
    * I wait until page title is "$loginPageTitle"
    * "Login Form > Login Button" should be visible

  @CU-29043 @CU-32227 @CU-32910
  Scenario: Verify user is able to login to application
    * I am logged in
    # Click User menu
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on "Logout" option in User Menu
    * I click "Header > User Menu > #Logout in Items"
    # Verify that user is logged out and "Login" page is displayed
    * I wait until page title is "$loginPageTitle"
    * "Login Form > Username Input" should be visible
    * "Login Form > Password Input" should be visible
    # Log in with the following credentials
    * I type "atuser01@chdvl.com" in "Login Form > Username Input"
    * I type "password" in "Login Form > Password Input"
    * I click "Login Form > Login Button"
    # Verify that the user is logged in
    * I wait until page title is "$mainPageTitle"
    * "Header > User Menu" should be visible

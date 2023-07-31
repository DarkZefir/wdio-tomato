@critical_path
@mvl
Feature: Account Information

  @CU-29674
  @logout
  Scenario: Account Information
    # Login as 'atuser01@chdvl.com' with 'password' password
    * I am logged in as "atuser01@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Verify that overlay with 'ACCOUNT INFORMATION' title is displayed
    * Text of "Account Information Popup > Title" should be "ACCOUNT INFORMATION"
    # Verify that the overlay contains 'Enter current password to edit account information' text
    * Text of "Account Information Popup" should contain "Enter current password to edit account information"
    # Verify that 'Edit' button is displayed and disabled
    * "Account Information Popup > Edit Button" should be visible
    * "Account Information Popup > Edit Button" should not be enabled
    # Verify that 'Enter current password' field is displayed, enabled and blank
    * "Account Information Popup > Enter Current Password" should be visible
    * "Account Information Popup > Enter Current Password" should be enabled
    * Value in "Account Information Popup > Enter Current Password" should be ""
    # Verify that the overlay contains 'Personal Information', 'First Name', 'Last Name', 'Communication Email' fields
    * Text of "Account Information Popup" should contain "Personal Information"
    * Text of "Account Information Popup" should contain "First Name"
    * Text of "Account Information Popup" should contain "Last Name"
    * Text of "Account Information Popup" should contain "Communication Email"
    # Verify that fields in Account Information Form are disabled
    * "Account Information Popup > Account Information Form" should not be enabled
    # Verify that the overlay contains 'Change User ID' text, 'User ID (Email Address)'and 'Retype New User ID (Email Address)' fields
    * Text of "Account Information Popup" should contain "Change User ID"
    * Text of "Account Information Popup" should contain "User ID (Email Address)"
    * Text of "Account Information Popup" should contain "Retype New User ID (Email Address)"
    # Verify that the overlay contains 'Change Password', 'New Password', 'Retype New Password' fields
    * Text of "Account Information Popup" should contain "Change Password"
    * Text of "Account Information Popup" should contain "New Password"
    * Text of "Account Information Popup" should contain "Retype New Password"
    # Verify that the overlay contains 'Show passwords' checkbox (not checked)
    * Text of "Account Information Popup" should contain "Show passwords"
    # Verify that the overlay contains 'Cancel'(enabled), 'X Close'(enabled), 'Save & Close'(disabled) buttons
    * "Account Information Popup > Cancel Button" should be visible
    * "Account Information Popup > Cancel Button" should be enabled
    * "Account Information Popup > X Close Button" should be visible
    * "Account Information Popup > X Close Button" should be enabled
    * "Account Information Popup > Save and Close" should be visible
    * "Account Information Popup > Save and Close" should not be enabled
    # Insert 'password' into 'Enter current password' field and click on 'Edit' button
    * I type "password" in "Account Information Popup > Enter Current Password"
    * I click "Account Information Popup > Edit Button"
    * "Account Information Popup > Edit Button" should not be visible
    # Verify that the title of the overlay is 'ACCOUNT INFORMATION'
    * Text of "Account Information Popup > Title" should be "ACCOUNT INFORMATION"
    # Verify that 'Enter current password to edit account information' text is not displayed
    * Text of "Account Information Popup" should not contain "Enter current password to edit account information"
    # Verify that 'Edit' button and 'Edit current password' field are not dislayed
    * "Account Information Popup > Edit Button" should not be visible
    * "Account Information Popup > Enter Current Password" should not be visible
    # Verify that the overlay contains 'Personal Information' text, 'First Name', 'Last Name' and 'Communication Email' fields
    * Text of "Account Information Popup" should contain "Personal Information"
    * Text of "Account Information Popup" should contain "First Name"
    * Text of "Account Information Popup" should contain "Last Name"
    * Text of "Account Information Popup" should contain "Communication Email"
    # Verify that 'First Name' field is enabled and contains 'autuser', 'Last Name' field is enabled and contains 'first', 'Communication Email' field is enabled and contains 'cch.cheetah.qa@gmail.com'
    * "Account Information Popup > First Name" should be enabled
    * Value in "Account Information Popup > First Name" should be "autuser"
    * "Account Information Popup > Last Name" should be enabled
    * Value in "Account Information Popup > Last Name" should be "first"
    * "Account Information Popup > Communication Email" should be enabled
    * Value in "Account Information Popup > Communication Email" should be "cch.cheetah.qa@gmail.com"
    # Verify that 'Change User ID' text, 'User ID (Email Address)' and 'Retype New User ID (Email Address)' fields are displayed
    * Text of "Account Information Popup" should contain "Change User ID"
    * Text of "Account Information Popup" should contain "User ID (Email Address)"
    * Text of "Account Information Popup" should contain "Retype New User ID (Email Address)"
    # Verify that 'User ID' field is enabled and contains 'atuser01@chdvl.com'
    * "Account Information Popup > User ID" should be enabled
    * Value in "Account Information Popup > User ID" should be "atuser01@chdvl.com"
    # Verify that 'Retype New User ID' field is enabled and blank
    * "Account Information Popup > Retype New User ID" should be enabled
    * Value in "Account Information Popup > Retype New User ID" should be ""
    # Verify that 'Change Password', 'New Password', 'Retype New Password' fields are displayed
    * Text of "Account Information Popup" should contain "Change Password"
    * Text of "Account Information Popup" should contain "New Password"
    * Text of "Account Information Popup" should contain "Retype New Password"
    # Verify that 'New Password' field is enabled and blank
    * "Account Information Popup > New Password" should be enabled
    * Value in "Account Information Popup > New Password" should be ""
    # Verify that 'Retype New Password' field is enabled and blank
    * "Account Information Popup > Retype New Password" should be enabled
    * Value in "Account Information Popup > Retype New Password" should be ""
    # Verify that 'Show passwords' checkbox is displayed and not checked
    * Text of "Account Information Popup" should contain "Show passwords"
    * "Account Information Popup > Show Password" should be enabled
    * "Account Information Popup > Show Password" should not be selected
    # Verify that the overlay contains 'Cancel'(enabled), 'X Close'(enabled), 'Save & Close'(disabled) buttons
    * "Account Information Popup > Cancel Button" should be visible
    * "Account Information Popup > Cancel Button" should be enabled
    * "Account Information Popup > X Close Button" should be visible
    * "Account Information Popup > X Close Button" should be enabled
    * "Account Information Popup > Save and Close" should be visible
    * "Account Information Popup > Save and Close" should not be enabled
    # Click on 'Cancel' button
    * I click "Account Information Popup > Cancel Button"
    * "Account Information Popup" should not be visible
    # Verify that the overlay is no longer displayed

  @CU-29873
  @logout
  Scenario: Verify that 'New user ID values must match.' inline error message is displayed when value in 'Retype New User ID (Email Address)' text input field do not matches the value in 'User ID (Email Address)' text input fiel
    # Login as 'atuser01@chdvl.com' with 'password' password
    * I am logged in as "atuser01@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Clear 'User ID' field and insert 'atuser02@chdvl.com'
    * I clear "Account Information Popup > User ID"
    * I type "atuser02@chdvl.com" in "Account Information Popup > User ID"
    # Verify that 'New user ID values must match.' error is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "New user ID values must match."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Insert 'atuser01@chdvl.com' in 'Retype New User ID' field
    * I type "atuser01@chdvl.com" in "Account Information Popup > Retype New User ID"
    # Verify that 'New user ID values must match.' error is displayed' in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "New user ID values must match."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Clear 'Retype New User ID' field and insert 'atuser02@chdvl.com'
    * I clear "Account Information Popup > Retype New User ID"
    * I type "atuser02@chdvl.com" in "Account Information Popup > Retype New User ID"
    # Verify that no error message is displayed and 'Save & Close' button is enabled
    * "Account Information Popup > #1 of Error Messages" should not be visible
    * "Account Information Popup > Save and Close" should be enabled

  @CU-29874
  @logout
  Scenario: Verify that 'New password values must match' inline error message appears when entered into the 'New Password' text input field value do not matches the value in the 'Retype New Password' text input field
    # Login as 'atuser01@chdvl.com' with 'password' password
    * I am logged in as "atuser01@chdvl.com" with "password" password
    * "Header" should be visible
     # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Insert '123456' into 'New Password' field
    * I type "123456" in "Account Information Popup > New Password"
    # Verify that 'New password values must match.' error is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "New password values must match."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Verify that 'Save & Close' button is disabled
    * "Account Information Popup > Save and Close" should not be enabled
    # Insert '1234567' in 'Retype New Password' field
    * I type "1234567" in "Account Information Popup > Retype New Password"
    # Verify that 'New password values must match.' message is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "New password values must match."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Verify that 'Save & Close' button is disabled
    * "Account Information Popup > Save and Close" should not be enabled
    # Clear 'Retype New Password' field
    * I clear "Account Information Popup > Retype New Password"
    # Insert '123456' into 'Retype New Password' field
    * I type "123456" in "Account Information Popup > Retype New Password"
    # Verify that no error message is displayed and 'Save & Close' button is enabled
    * "Account Information Popup > #1 of Error Messages" should not be visible
    * "Account Information Popup > Save and Close" should be enabled

  @CU-29870
  @logout
  Scenario: Verify that 'Invalid email address' inline error message is displayed if a blank value or incorrect email is entered in the 'Communication Email' text input field
    # Login as 'atuser01@chdvl.com' with 'password' password
    * I am logged in as "atuser01@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter curent password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Clear 'Communication Email' field
    * I send sequence of keys "Control, A" to element "Account Information Popup > Communication Email"
    * I send sequence of keys "Backspace" to active element
    # Verify that 'Invalid email address.' message is displayed in red and 'Save & Close' button is disabled
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "Invalid email address."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    * "Account Information Popup > Save and Close" should not be enabled
    # Insert 'asd@ads' into 'communication Email' field
    * I type "asd@ads" in "Account Information Popup > Communication Email"
    # Verify that 'Invalid email address.' message is displayed in red and 'Save & Close' button is disabled
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "Invalid email address."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    * "Account Information Popup > Save and Close" should not be enabled
    # Clear 'Communication Email' field and insert 'asd@ads.com'
    * I clear "Account Information Popup > Communication Email"
    * I type "asd@ads.com" in "Account Information Popup > Communication Email"
    # Verify that no error message is displayed and 'Save & Close' button is enabled
    * "Account Information Popup > #1 of Error Messages" should not be visible
    * "Account Information Popup > Save and Close" should be enabled

  @CU-29867
  @logout
  Scenario: Verify that User's Personal Information (First, Last Names and Communication email) could be changed in Account Information
    # Login as 'atuser02@chdvl.com' with 'password' password
    * I am logged in as "atuser02@chdvl.com" with "password" password
    * "Header" should be visible
    # Make sure 'Communication Email' is set as 'cch.cheetah.qa@gmail.com'
    * I set communication email to "cch.cheetah.qa@gmail.com"
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Insert '1' into 'First Name', 'Last Name' and 'Communication Email' fields
    * I type "1" in "Account Information Popup > First Name"
    * I type "1" in "Account Information Popup > Last Name"
    * I type "1" in "Account Information Popup > Communication Email"
    # Verify that 'Save & Close' button is enabled
    * "Account Information Popup > Save and Close" should be enabled
    # Click on 'Save & Close' button
    * I click "Account Information Popup > Save and Close"
    * "Account Information Popup" should not be visible
    # Verify that 'Account Information Popup' is no longer displayed and 'Communication Email' is set as 'cch.cheetah.qa@gmail.com'
    * I set communication email to "cch.cheetah.qa@gmail.com"

  @CU-29876
  @logout
  Scenario: Verify that 'Account information' overlay is closed and changes do not save when user click 'Cancel' button and 'Yes' button on the 'Confirm cancel' overlay
    # Login as 'atuser03@chdvl.com' with 'password' password
    * I am logged in as "atuser03@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Remember the value of 'First Name' as 'firstName' and 'Last Name' as 'lastName'
    * I remember value of "Account Information Popup > First Name" as "firstName"
    * I remember value of "Account Information Popup > Last Name" as "lastName"
    # Clear 'First Name' and 'Last Name' fields
    * I clear "Account Information Popup > First Name"
    * I clear "Account Information Popup > Last Name"
    # Insert 'a new name' into 'First Name' field and 'a new surname' into 'Last Name' field
    * I type "a new name" in "Account Information Popup > First Name"
    * I type "a new surname" in "Account Information Popup > Last Name"
    # Remember the value of 'Communication Email' field as 'communicationEmail'
    * I remember value of "Account Information Popup > Communication Email" as "communicationEmail"
    # Clear 'Communication Email' field
    * I clear "Account Information Popup > Communication Email"
    # Insert 'aNewCommunicationEmail@wk.com' into 'Communication Email' field
    * I type "aNewCommunicationEmail@wk.com" in "Account Information Popup > Communication Email"
    # Remember the value of 'User ID' field as 'userIDName'
    * I remember value of "Account Information Popup > User ID" as "userIDName"
    # Clear 'UserIDName' field
    * I clear "Account Information Popup > User ID"
    # Insert 'aNewUserID@wk.com@' into 'UserID' field
    * I type "aNewUserID@wk.com@" in "Account Information Popup > User ID"
    # Insert 'aNewUserID@wk.com@' into 'Retype New User ID' field
    * I type "aNewUserID@wk.com@" in "Account Information Popup > Retype New User ID"
    # Insert 'newPassword' into 'New Password' field
    * I type "newPassword" in "Account Information Popup > New Password"
    # Insert 'newPassword' into 'Retype New Password' field
    * I type "newPassword" in "Account Information Popup > Retype New Password"
    # Click on 'Cancel' button
    * I click "Account Information Popup > Cancel Button"
    # Verify that 'Confirmation Popup' is displayed
    * "Confirmation Popup" should be visible
    # Click on 'Confirm' button
    * I click "Confirmation Popup > Confirm Button"
    # Verify that 'Confirmation Popup' is no longer displayed
    * "Confirmation Popup" should not be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    # Click on 'Account Information'
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    * "Account Information Popup > Edit Button" should not be visible
    # Verify that the values of 'First Name', 'Last Name', 'Communication Email' and 'User ID' are equal to the ones that were memorized
    * Value in "Account Information Popup > First Name" should be "{$firstName}"
    * Value in "Account Information Popup > Last Name" should be "{$lastName}"
    * Value in "Account Information Popup > Communication Email" should be "{$communicationEmail}"
    * Value in "Account Information Popup > User ID" should be "{$userIDName}"

  @CU-29875
  @logout
  Scenario: Verify that 'Account information' overlay is closed and changes do not save when user click close 'X' button and click 'Yes' button on the 'Confirm cancel' overlay
    # Login as 'atuser03@chdvl.com' with 'password' password
    * I am logged in as "atuser03@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
     # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Remember the value of 'First Name' as 'firstName' and 'Last Name' as 'lastName'
    * I remember value of "Account Information Popup > First Name" as "firstName"
    * I remember value of "Account Information Popup > Last Name" as "lastName"
    # Clear 'First Name' and 'Last Name' fields
    * I clear "Account Information Popup > First Name"
    * I clear "Account Information Popup > Last Name"
    # Insert 'a new name' into 'First Name' field and 'a new surname' into 'Last Name' field
    * I type "a new name" in "Account Information Popup > First Name"
    * I type "a new surname" in "Account Information Popup > Last Name"
    # Remember the value of 'Communication Email' field as 'communicationEmail'
    * I remember value of "Account Information Popup > Communication Email" as "communicationEmail"
    # Clear 'Communication Email' field
    * I clear "Account Information Popup > Communication Email"
    # Insert 'aNewCommunicationEmail@wk.com' into 'Communication Email' field
    * I type "aNewCommunicationEmail@wk.com" in "Account Information Popup > Communication Email"
    # Remember the value of 'User ID' field as 'userIDName'
    * I remember value of "Account Information Popup > User ID" as "userIDName"
    # Clear 'UserIDName' field
    * I clear "Account Information Popup > User ID"
    # Insert 'aNewUserID@wk.com@' into 'UserID' field
    * I type "aNewUserID@wk.com@" in "Account Information Popup > User ID"
    # Insert 'aNewUserID@wk.com@' into 'Retype New User ID' field
    * I type "aNewUserID@wk.com@" in "Account Information Popup > Retype New User ID"
    # Insert 'newPassword' into 'New Password' field
    * I type "newPassword" in "Account Information Popup > New Password"
    # Insert 'newPassword' into 'Retype New Password' field
    * I type "newPassword" in "Account Information Popup > Retype New Password"
    # Click on 'X Close' button
    * I click "Account Information Popup > X Close Button"
    # Verify that 'Confirmation Popup' is displayed
    * "Confirmation Popup" should be visible
    # Click on 'Confirm' button
    * I click "Confirmation Popup > Confirm Button"
    # Verify that 'Confirmation Popup' is no longer displayed
    * "Confirmation Popup" should not be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    # Click on 'Account Information'
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    * "Account Information Popup > Edit Button" should not be visible
    # Verify that the values of 'First Name', 'Last Name', 'Communication Email' and 'User ID' are equal to the ones that were memorized
    * Value in "Account Information Popup > First Name" should be "{$firstName}"
    * Value in "Account Information Popup > Last Name" should be "{$lastName}"
    * Value in "Account Information Popup > Communication Email" should be "{$communicationEmail}"
    * Value in "Account Information Popup > User ID" should be "{$userIDName}"

  @CU-29869
  @logout
  Scenario: Verify that 'Incorrect password' inline error message is displayed when user enters invalid password into 'Enter current password to edit account information'
    # Login as 'atuser03@chdvl.com' with 'password' password
    * I am logged in as "atuser03@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'sdasdjlak3990)' into 'Enter Current Password' field
    * I type "sdasdjlak3990)" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that error with 'Incorrect password.' message is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "Incorrect password."
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Clear 'Enter Current Password' field
    * I clear "Account Information Popup > Enter Current Password"
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    * "Account Information Popup > Edit Button" should not be visible
    # Verify that 'Enter current password to edit account information' text is not displayed
    * Text of "Account Information Popup" should not contain "Enter current password to edit account information"
    # Verify that 'Edit' button and 'Enter current password' field are not displayed
    * "Account Information Popup > Edit Button" should not be visible
    * "Account Information Popup > Enter Current Password" should not be visible

  @CU-29871
  @logout
  Scenario: Verify that 'Invalid password' inline message is displayed when user enter less than 6 character into the 'New password' text input field
    # Login as 'atuser04@chdvl.com' with 'password' password
    * I am logged in as "atuser04@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Insert '12345' into 'New Password' and 'Retype New Password' fields
    * I type "12345" in "Account Information Popup > New Password"
    * I type "12345" in "Account Information Popup > Retype New Password"
    # Verify that error with 'Invalid password.' message is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "Invalid password."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Verify that 'Save & Close' button is disabled
    * "Account Information Popup > Save and Close" should not be enabled
    # Clear 'New Password' and 'Retype New Password' fields
    * I clear "Account Information Popup > New Password"
    * I clear "Account Information Popup > Retype New Password"
    # Insert '1' into 'New Password' and 'Retype New Password' fields
    * I type "1" in "Account Information Popup > New Password"
    * I type "1" in "Account Information Popup > Retype New Password"
    # Verify that error with 'Invalid password.' message is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text of "Account Information Popup > #1 of Error Messages" should contain "Invalid password."
    * Count of "Account Information Popup > Error Messages" should be equal to "1"
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Verify that 'Save & Close' button is disabled
    * "Account Information Popup > Save and Close" should not be enabled
    # Clear 'New Password' and 'Retype New Password' field
    * I clear "Account Information Popup > New Password"
    * I clear "Account Information Popup > Retype New Password"
    # Insert '123456' into 'New Password' and 'Retype New Password' fields
    * I type "123456" in "Account Information Popup > New Password"
    * I type "123456" in "Account Information Popup > Retype New Password"
    # Verify that no error message is displayed and 'Save & Close' button is enabled
    * "Account Information Popup > #1 of Error Messages" should not be visible
    * "Account Information Popup > Save and Close" should be enabled

  @CU-29872
  @logout
  Scenario: Verify that 'Invalid email address' inline error message is displayed if an incorrect email is entered in the 'User ID (Email Address)' text input field
    # Login as 'atuser04@chdvl.com' with 'password' password
    * I am logged in as "atuser04@chdvl.com" with "password" password
    * "Header" should be visible
    # Click on User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    # Click on Account Information
    * I click "Header > User Menu > #Account Information in Items"
    * "Account Information Popup" should be visible
    # Insert 'password' into 'Enter Current Password' field
    * I type "password" in "Account Information Popup > Enter Current Password"
    # Click on 'Edit' button
    * I click "Account Information Popup > Edit Button"
    # Verify that 'Edit' button is no longer displayed
    * "Account Information Popup > Edit Button" should not be visible
    # Clear 'User ID' field
    * I clear "Account Information Popup > User ID"
    # Insert 'atuser01@chdvlcom' into 'User ID' field
    * I type "atuser01@chdvlcom" in "Account Information Popup > User ID"
    # Verify that error with 'Invalid email address.' is displayed in red
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text in collection of "Account Information Popup > Error Messages" should contain "Invalid email address."
    * Text color of "Account Information Popup > #1 of Error Messages" should be "#ff0000"
    # Verify that 'Save & Close' button is disabled
    * "Account Information Popup > Save and Close" should not be enabled
    # Clear 'User ID' field
    * I clear "Account Information Popup > User ID"
    # Insert 'atuser01@chdvl.com' into 'User ID' field
    * I type "atuser01@chdvl.com" in "Account Information Popup > User ID"
    # Verify that no error is displayed and 'Save & Close' button is disabled
    * "Account Information Popup > #1 of Error Messages" should be visible
    * Text in collection of "Account Information Popup > Error Messages" should contain "New user ID values must match."
    * "Account Information Popup > Save and Close" should not be enabled
    # Insert 'atuser01@chdvl.com' into 'Retype New User ID' field
    * I type "atuser01@chdvl.com" in "Account Information Popup > Retype New User ID"
    # Verify that no error is displayed and 'Save & Close' button is enabled
    * "Account Information Popup > #1 of Error Messages" should not be visible
    * "Account Information Popup > Save and Close" should be enabled

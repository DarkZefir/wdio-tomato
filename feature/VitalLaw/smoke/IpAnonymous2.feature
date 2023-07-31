@smoke
@mvl
@ipa_only
Feature: IP Anonymous

  @CU-37835
  Scenario: Verify UI of 'Notice' overlay when spooler is initiated after 'Quick Print' action on document's Read view opened from SRL for IP Anonymous user
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Toolbar Buttons > Quick Print Button" should be visible
    * I click "Toolbar Buttons > Quick Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should contain "The content you have selected is too large to print immediately."
    * Text of "Notice Popup > Notice Message" should contain "Enter your email address and we will notify you when the content is available for download."
    * "Notice Popup > Email Input" should be visible
    * Value in "Notice Popup > Email Input" should be ""
    * "Notice Popup > OK Button" should be visible
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > OK Button" should be enabled
    * "Notice Popup > Cancel Button" should be visible
    * "Notice Popup > Cancel Button" should be enabled
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > Cancel Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > OK Button"
    * "Notice Popup > Error Message" should be visible
    * Text of "Notice Popup > Error Message" should be "The email address is empty."
    * I click "Notice Popup > Cancel Button"
    * "Notice Popup" should not be visible

  @CU-37836
  Scenario: Verify UI of 'Notice' overlay when spooler is initiated after 'Print' action on document's Read view opened from SRL for IP Anonymous user
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Toolbar Buttons > Print Button" should be visible
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should contain "The content you have selected is too large to print immediately."
    * Text of "Notice Popup > Notice Message" should contain "Enter your email address and we will notify you when the content is available for download."
    * "Notice Popup > Email Input" should be visible
    * Value in "Notice Popup > Email Input" should be ""
    * "Notice Popup > OK Button" should be visible
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > OK Button" should be enabled
    * "Notice Popup > Cancel Button" should be visible
    * "Notice Popup > Cancel Button" should be enabled
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > Cancel Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > OK Button"
    * "Notice Popup > Error Message" should be visible
    * Text of "Notice Popup > Error Message" should be "The email address is empty."
    * I click "Notice Popup > Cancel Button"
    * "Notice Popup" should not be visible

  @CU-37837
  Scenario: Verify UI of 'Notice' overlay when spooler is initiated after Download action on document's Read view opened from SRL for IP Anonymous user
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Toolbar Buttons > Download Button" should be visible
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should contain "The content you have selected is too large to download immediately."
    * Text of "Notice Popup > Notice Message" should contain "Enter your email address and we will notify you when the content is available for download."
    * "Notice Popup > Email Input" should be visible
    * Value in "Notice Popup > Email Input" should be ""
    * "Notice Popup > OK Button" should be visible
    * Text of "Notice Popup > OK Button" should be "OK"
    * "Notice Popup > OK Button" should be enabled
    * "Notice Popup > Cancel Button" should be visible
    * Text of "Notice Popup > Cancel Button" should be "CANCEL"
    * "Notice Popup > Cancel Button" should be enabled
    * "Notice Popup > X Close Button" should be visible
    * "Notice Popup > X Close Button" should be enabled
    * I click "Notice Popup > OK Button"
    * "Notice Popup > Error Message" should be visible
    * Text of "Notice Popup > Error Message" should be "The email address is empty."
    * I click "Notice Popup > Cancel Button"
    * "Notice Popup" should not be visible

  @CU-37838
  Scenario: Verify UI of 'Login' screen opened by click on 'Log In' button in Global Header for IP Anonymous user
    * I am logged in
    * "Header" should be visible
    * "Header > Log In" should be visible
    * I click "Header > Log In"
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    * "Login Form > Application Logo" should be visible
    * "Login Form > Username Input" should be visible
    * "Login Form > Password Input" should be visible
    * "Login Form > Force Me To Login Checkbox" should be visible
    * "Login Form > Forgot Password" should be visible
    * "Login Form > Create User ID" should be visible
    * "Login Form > Terms Of Use" should be visible
    * "Login Form > Privacy And Cookies" should be visible

  @CU-37839
  Scenario: Verify that user can log in to VitalLaw from Login page reached by click on 'Log In' link in Global Header for IP Anonymous user
    * I am logged in
    * "Header" should be visible
    * "Header > Log In" should be visible
    * I click "Header > Log In"
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    * I type "atuser01@chdvl.com" in "Login Form > Username Input"
    * I type "password" in "Login Form > Password Input"
    * I click "Login Form > Login Button"
    * I wait until page title is "VitalLaw"
    * "Header > WK Logo" should be visible
    * "Header > WK Logo" should be visible
    * "Header > User Menu" should be visible

  @CU-37840
  Scenario: Verify that notification banner for IP Anonymous user is displayed on Home page
    * I am logged in
    * "Info Banner" should be visible
    * Text of "Info Banner" should contain "Optional:"
    * Text of "Info Banner" should contain "Log in"
    * Text of "Info Banner" should contain " to access VitalLaw customization features such as saved searches and worklists."
    * "Info Banner > Close" should be visible
    * "Info Banner > Log In" should be visible
    * I click "Info Banner > Close"
    * "Info Banner" should not be visible

  @CU-37841
  Scenario: Verify the possibility to login to VitalLaw by click on 'Log In' link in Infor Banner on Global Header displayed for IP Anonymous user
    * I am logged in
    * "Info Banner" should be visible
    * I click "Info Banner > Log In"
    * I wait until page title is "VitalLaw™ Login"
    * "Login Form > Login Button" should be visible
    * I type "atuser01@chdvl.com" in "Login Form > Username Input"
    * I type "password" in "Login Form > Password Input"
    * I click "Login Form > Login Button"
    * I wait until page title is "VitalLaw"
    * "Header > User Menu" should be visible

  @CU-37849
  Scenario: Verify elements of a toolbar panel for document opened in a new tab from SRL for IP Anonymous user
    * I am logged in
    * I perform search of "business"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * I click "#2 of Documents"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * "Favorite Button" should not be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should not be visible
    * "Toolbar Buttons > Add To Button" should not be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar > Next Document Button" should be visible
    * "Toolbar > Previous Document Button" should be visible
    * "Toolbar > Previous Results Button" should be visible
    * "Toolbar > Next Results Button" should be visible
    * "Toolbar > Previous Highlight Button" should be visible
    * "Toolbar > Next Highlight Button" should be visible
    * "Toolbar > Highlight Checkbox" should be visible

  @CU-37853
  Scenario: Verify that Global Header is present for the document opened in new tab from SRL for IP Anonymous
    * I am logged in
    * I perform search of "law"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * I click "#1 of Documents"
    * I switch to last tab
    * "Header" should be visible
    * "Header > Application Logo" should be visible
    * "Header > User Menu" should not be visible
    * "Header > Log In" should be visible
    * "Header > Help" should be visible
    * "Header > My Solutions" should be visible
    * "Header > Feedback Button" should be visible
    * "Header > Application Logo" should be visible
    * "Header > Home" should be visible
    * "Session Navigator" should be visible
    * "Header > Practical Content Button" should be visible
    * "Header > Titles Button" should be visible
    * "Header > Favorites Button" should not be visible
    * "Header > History Dropdown" should not be visible
    * "Header > Folders Dropdown" should not be visible
    * "Header > Saved Items Dropdown" should not be visible
    * "Header > News Dropdown" should not be visible

  @CU-28864
  Scenario: Verify that Question widget is NOT displayed on TAG PA for IP anonymous user
    * I am logged in
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * I wait 5 seconds
    * "Submit A Question To TAG Box" should not be visible

  @CU-37866
  Scenario Outline: Verify UI elements of Federal Topic List page for IP Anonymous user
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"
    * "Topics List Search Icon" should be visible
    * "Topics List Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * "Tax Federal Topics List > Mode Switch" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By IRC"
    * "Expand All" should be visible
    * "Collapse All" should be visible
    * I remember text of "Tax Federal Topics List > Top Level Node" as "titles"
    * "{$titles}" text should be equal to "<Subscription>" text

    Examples:
      | Subscription                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | A CLOSER LOOK,ACCOUNTING METHODS AND PERIODS,BUSINESS DEDUCTIONS AND CREDITS,C CORPORATIONS,COMPENSATION AND BENEFITS,DEPRECIATION DEDUCTIONS,ESTATES, GIFTS, AND TRUSTS,HEALTHCARE,INCOME ITEMS,INDIVIDUAL AND NONBUSINESS DEDUCTIONS AND CREDITS,INDIVIDUALS,INTERNATIONAL TAXATION,LLCS,LIQUOR INDUSTRY TAXES AND CONTROL,PARTNERSHIPS,RETIREMENT PLANS,S CORPORATIONS,SALES AND EXCHANGES,SPECIAL ENTITIES,TAX PRACTICE AND PROCEDURE |

  @CU-37890
  Scenario: Search Within DA - Searching with Pre-search Filters for IP Anonymous user
    * I am logged in
    * I open "feefc6827d8610008d07005056886db702" document
    * I remember text of "DA Title" as "DAtitle"
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * I type "tax" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > #1 of Presearch Filters > Title"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Presearch Filter Titles"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Filter Items > #1 of Filter Item Level0 > Label"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #2 of Presearch Filter Titles"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #2 of Filter Items >  #1 of Filter Item Level0 > Label"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "News and Blogs"
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Federal"
    * Text of "Search Bar > Search Title" should be "{$DAtitle}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Document Type: News and Blogs"
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Jurisdiction: Federal"

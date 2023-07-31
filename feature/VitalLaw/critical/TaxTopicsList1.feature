@critical_path
@mvl
Feature: Tax Topics List 1

  @CU-32455
  Scenario: Verify that IRC path reflects TOC
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle C—Employment Taxes [Secs. 3101-3512] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 21—FEDERAL INSURANCE CONTRIBUTIONS ACT [Secs. 3101-3128] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #Subchapter A—Tax on Employees [Secs. 3101-3102] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 3101. RATE OF TAX. in Node Titles"
    * "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > See IRC Path"
    * "Internal Revenue Code Popup" should be visible
    * I remember text of "Internal Revenue Code Popup > Content" as "IrcPath"
    * I click "Internal Revenue Code Popup > X Close Button"
    * "Internal Revenue Code Popup" should not be visible
    * I remember number of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > IRC Links" as "IRCLinks"
    * I remember random integer below "{$IRCLinks}" as "RandomLink"
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #{$RandomLink} of IRC Links"
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Key Primary Sources in Table Of Contents Items"
    * "Tax Topic Page > Key Primary Sources Widget" should be visible
    * I click "Tax Topic Page > Key Primary Sources Widget > #§ 3101., RATE OF TAX. in Links"
    * I switch to last tab
    * I wait 5 seconds
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > Selected Link" should be visible
    * I remember text of "Contents Tab > Selected Link" as "selected"
    * I remember text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" as "Parent"
    * I remember text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" as "Child1"
    * I remember text of "Contents Tab > #1 of Expanded Second Child Node > Path Header > Label" as "Child2"
    * "{$IrcPath}" text should contain "{$selected}" text
    * "{$IrcPath}" text should contain "{$Parent}" text
    * "{$IrcPath}" text should contain "{$Child1}" text
    * "{$IrcPath}" text should contain "{$Child2}" text

  @CU-32456
  Scenario: Verify that correct category is displayed for Topic on IRC view
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle C—Employment Taxes [Secs. 3101-3512] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 21—FEDERAL INSURANCE CONTRIBUTIONS ACT [Secs. 3101-3128] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #Subchapter A—Tax on Employees [Secs. 3101-3102] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 3101. RATE OF TAX. in Node Titles"
    * "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links" should be visible
    * I remember number of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > IRC Links" as "links"
    * I remember random integer below "{$links}" as "index"
    * I remember text of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #{$index} of Categories" as "category"
    * I remember text of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #{$index} of IRC Links" as "title"
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #{$index} of IRC Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$title}" ignoring case
    * Text in collection of "Tax Topic Page > Topic Breadcrumbs" should contain "{$category}"

  @CU-32457
  Scenario: Verify that user returns to IRC view using Back button
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle C—Employment Taxes [Secs. 3101-3512] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 21—FEDERAL INSURANCE CONTRIBUTIONS ACT [Secs. 3101-3128] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #Subchapter A—Tax on Employees [Secs. 3101-3102] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 3101. RATE OF TAX. in Node Titles"
    * "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links"
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click browser back button
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By Topic"

  @CU-32458
  Scenario: Verify that sorting on IRC view works properly
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle C—Employment Taxes [Secs. 3101-3512] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 25—GENERAL PROVISIONS RELATING TO EMPLOYMENT TAXES [Secs. 3501-3512] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 3509. DETERMINATION OF EMPLOYER'S LIABILITY FOR CERTAIN EMPLOYMENT TAXES. in Node Titles"
    * "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links" should be visible
    * Order of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > IRC Links" should be alphabetical
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > Sorting Icon"
    * Order of "Tax Federal Topics List > IRC Tree Content > IRC Topics List > IRC Links" should be reverse alphabetical

  @logout
  @CU-32766
  Scenario Outline: Verify that "Expand All" works properly on Tax Federal List page
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * Count of "Tax Federal Topics List > Top Level Node > Topic Links" should be equal to "0"
    * I click "<icon>"
    * Count of "Tax Federal Topics List > Top Level Node > Topic Links" should be more than "0"
    * "Collapse All" should be enabled

    Examples:
      | icon       |
      | Expand All |
      | Arrow Down |

  @CU-32770
  Scenario Outline: Verify that "Collapse All" works properly on Tax Federal List page
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * I click "Expand All"
    * "Collapse All" should be clickable
    * "Expand All" should not be enabled
    * Count of "Tax Federal Topics List > Top Level Node > Topic Links" should be more than "0"
    * I click "<icon>"
    * Count of "Tax Federal Topics List > Top Level Node > Topic Links" should be equal to "0"
    * "Expand All" should be enabled

    Examples:
      | icon         |
      | Collapse All |
      | Arrow Up     |

  @CU-32773
  Scenario: Verify that both "Expand All" and "Collapse All" icons are available when when at least 1 topic is expanded/collapsed
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * I click "Tax Federal Topics List > #S CORPORATIONS in Top Level Node > Expand Button"
    * "Tax Federal Topics List > #S CORPORATIONS in Top Level Node > #1 of Container Titles" should be visible
    * "Expand All" should be enabled
    * "Collapse All" should be enabled


  @CU-33295
  Scenario: Verify that IRC link is not displayed on Federal Topic List Page for the user without subscription to IRC01
    * I am logged in as "tlpfedliq@wk.com" with "password" password
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle F—Procedure and Administration [Secs. 6001-7874] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 72—LICENSING AND REGISTRATION [Secs. 7001-7012] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #Subchapter B—Registration [Secs. 7011-7012] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 7011. REGISTRATION—PERSONS PAYING A SPECIAL TAX. in Node Titles"
    *  "Tax Federal Topics List > IRC Tree Content > IRC Topics List > See IRC Path" should not be visible

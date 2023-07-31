@critical_path
@mvl
@practical_content
Feature: Practical Content Share Search

  @CU-37024
  @logout
  Scenario: Share Practical Content Search Results after simple query
    * I am logged in as "practCont@wk.com" with "password" password
    #Perform Search and copy link
    * I am on "ALL CONTENT" PA
    * I perform search of "*" on practical content
    * I remember text of "Documents Number" as "num1"
    * I click "Share Search Button"
    * "Blank Info Popup" should be visible
    * I click "Blank Info Popup > X Close Button"
    * I remember clipboard content as "copyurl"
    #Logout and login as another user
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in as "practCont@wk.com" with "password" password
    * I open "{$copyurl}" url
    * I wait until page title is "$mainPageTitle"
    * "Search Results Panel" should be visible
    #Verify count of results
    * I remember text of "Documents Number" as "num2"
    * "{$num1}" text should be equal to "{$num2}" text

  @CU-37025
  @logout
  Scenario Outline: Share Results of Practical Content Search after several queries (same user)
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    #Perform Search and copy link
    * I perform search of "<query1>" on practical content
    * "Search Bar > Search Input" should be visible
    * I type "<query2>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Documents Number" as "num1"
    * I click "Share Search Button"
    * "Blank Info Popup" should be visible
    * I click "Blank Info Popup > X Close Button"
    * I remember clipboard content as "copyurl"
    #Logout and login as another user
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in as "practCont@wk.com" with "password" password
    * I open "{$copyurl}" url
    * I wait until page title is "$mainPageTitle"
    * "Search Results Panel" should be visible
    #Verify count of results and pilled queries
    * I remember text of "Documents Number" as "num2"
    * "{$num1}" text should be equal to "{$num2}" text
    * Text of "Search Bar > #1 of Search Pills" should be "<query1>"
    * Text of "Search Bar > #2 of Search Pills" should be "<query2>"

    Examples:
      | query1     | query2 |
      | government | Trump  |

  @logout
  @CU-37026
  Scenario: Share Practical Content Search Results with configured filters
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    #Perform Search
    * I perform search of "*" on practical content
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * "Practice Areas Filter > Select All Selected" should be visible
    #Configure PA filter
    * I click "Practice Areas Filter > Select All"
    * "Practice Areas Filter > Select All Selected" should not be visible
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "availableOpt"
    * I remember random integer below "{$availableOpt}" as "selectionPa"
    * I click "Practice Areas Filter > #{$selectionPa} of Not Selected Enabled Options"
    * I remember text of "Practice Areas Filter > #1 of Selected Enabled Options Label" as "labelPa"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I wait until "Loading Indicator" is gone
    #Configure PC filter
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I click "Practical Content Filter > Select All"
    * "Practical Content Filter > Select All Selected" should not be visible
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "availableOpt2"
    * I remember random integer below "{$availableOpt2}" as "selectionPc"
    * I click "Practical Content Filter > #{$selectionPc} of Not Selected Enabled Options"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should not be visible
    * I wait until "Loading Indicator" is gone
    * I remember text of "Practical Content Filter > Label" as "labelPc"
    #Remember number of results and share search link
    * I remember text of "Documents Number" as "num1"
    * I click "Share Search Button"
    * "Blank Info Popup" should be visible
    * I click "Blank Info Popup > X Close Button"
    * I remember clipboard content as "copyurl"
    #Logout and login as another user
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    * I wait until page title is "$loginPageTitle"
    * I am logged in as "practCont@wk.com" with "password" password
    * I open "{$copyurl}" url
    * I wait until page title is "$mainPageTitle"
    * "Search Results Panel" should be visible
    #Verify count of results aand filter labels
    * I remember text of "Documents Number" as "num2"
    * "{$num1}" text should be equal to "{$num2}" text
    * Text of "Practice Areas Filter > Label" should be "{$labelPa}"
    * Text of "Practical Content Filter > Label" should be "{$labelPc}"

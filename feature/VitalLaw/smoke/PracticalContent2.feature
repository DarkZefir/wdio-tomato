@smoke
@mvl
@practical_content
Feature: Practical Content

  @CU-35261
  @logout
  Scenario: Verify that user is able to change selections in 'Practice Areas' Filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    # Remembers number of PAs and calculates number of items in Practice Areas Filter
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    # Opens PAs filter
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * "Practice Areas Filter > Label" should be clickable
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * I remember number of "Practice Areas Filter > Selected Disabled Options" as "disabledOptions"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "{$subtract($PAs, 2)}"
    # Selects random PA to click
    * I click "Practice Areas Filter > Select All Selected CheckBox"
    * Text of "Practice Areas Filter > Label" should be "0 Practice Areas" ignoring case
    *  "Practice Areas Filter > Select All" should be visible
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "optionsToSelect"
    * I remember random integer below "{$optionsToSelect}" and above "1" as "selectedPA"
    * I remember text of "Practice Areas Filter > #{$selectedPA} of Not Selected Enabled Options" as "title"
    * I click "Practice Areas Filter > #{$selectedPA} of Not Selected Enabled Options"
    * "Practice Areas Filter > #1 of Selected Options" should be visible
    * "Practice Areas Filter > Select All Partially Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "1"
    * Text of "Practice Areas Filter > Label" should be "{$title}" ignoring case
    # Selects second random PA to click
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "optionsToSelect2"
    * I remember random integer below "{$optionsToSelect2}" and above "1" as "selectedPA2"
    * I click "Practice Areas Filter > #{$selectedPA2} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas" ignoring case
    # Selects All
    * I click "Practice Areas Filter > Select All Partially Selected CheckBox"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"

  @CU-35303
  @logout
  Scenario Outline: Verify that 'See All' link is not displayed in Practical Content Results Clusters if results for practical content types does not exceed 3
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "<term>" on practical content
    * Text of "#1 of Results Clusters > Hits Number" should be "(3)"
    * Count of "#1 of Results Clusters > Items" should be equal to "3"
    * "#1 of Results Clusters > See All" should not be visible
    * Text of "#2 of Results Clusters > Hits Number" should be "(1)"
    * Count of "#2 of Results Clusters > Items" should be equal to "1"
    * "#2 of Results Clusters > See All" should not be visible

    Examples:
      | term     |
      | treasure |

  @CU-35325
  @logout
  Scenario Outline: Verify that "See all" link is not displayed on "Guide Books"/"Answer Books" when 3 results and less
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "<term>" on practical content
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "2"
    * Text of "#1 of Results Clusters > Header Label" should contain "Guide Books" ignoring case
    * Text of "#2 of Results Clusters > Header Label" should contain "Answer Books" ignoring case
    * Text of "#1 of Results Clusters > Hits Number" should match "\(2\)|\(1\)|\(3\)"
    * Text of "#2 of Results Clusters > Hits Number" should match "\(2\)|\(1\)|\(3\)"
    * Count of "#1 of Results Clusters > Items" should be less than "4"
    * Count of "#2 of Results Clusters > Items" should be less than "4"
    * "#2 of Results Clusters > See All" should not be visible
    Examples:
      | term |
      | hike |

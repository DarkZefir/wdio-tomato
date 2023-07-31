@smoke
@mvl
@practical_content
Feature: Practical Content

  @CU-35450
  @logout
  Scenario: Verify that all practice areas except synthetic PAs are displayed in "Practice Areas" filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "ALL CONTENT" PA
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember text of "Practice Areas Box > Practice Area Links" as "practiceAreasNames"
    * I include "All Practice Areas" into "$practiceAreasNames"
    * I exclude "Tax - All" from "$practiceAreasNames"
    * I exclude "Securities - All" from "$practiceAreasNames"
    * I remember number of "Practice Areas Box > Practice Area Links" as "practiceAreasNum"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas" ignoring case
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * Count of "Practice Areas Filter > Options" should be equal to "{$subtract($practiceAreasNum, 1)}"
    * I remember text of "Practice Areas Filter > Options Label" as "practiceAreasFilterOptions"
    * "$practiceAreasNames" collection should be equal to "$practiceAreasFilterOptions" collection ignoring case ignoring punctuation marks ignoring whitespaces ignoring order

  @CU-36011
  @logout
  Scenario Outline: Verify that Answer Books/Guide Books/Forms can be added to My Practical Content Favorites Box
    * I am logged in
    * I am on "All Content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" matching "<boxName>" ignoring case as "box"
    * I remember number of "#{$box} of Content Boxes > Items" as "links"
    * I remember random integer below "{$links}" and above "1" as "rand"
    * I click "#{$box} of Content Boxes > #{$rand} of Items"
    * "Document Frame > Document Content" should be visible
    * I remember text of "Document Frame > Title" as "docTitle"
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box > #1 of Links" should be visible
    * I remember "title" attribute of "My Practical Content Favorites Box > #1 of Links" as "tooltip"
    * "{$tooltip}" text should contain "{$docTitle}" text ignoring whitespaces ignoring case
    Examples:
      | boxName      |
      | Guide Books  |
      | Forms        |
      | Answer Books |

  @CU-36012
  @logout
  Scenario: Verify that Favorized documents can be opened from My Practical Favorites Box
    * I am logged in as "practCont@wk.com" with "password" password
    * I add "6987bd8c7c431000b30c90b11c18cbab01" document to favorites
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box > #1 of Links" should be visible
    * I remember "title" attribute of "My Practical Content Favorites Box > #1 of Links" as "tooltip"
    * I click "My Practical Content Favorites Box > #1 of Links"
    * I click "Show Metadata"
    * I remember value of "search-title" metadata parameter as "searchTitle"
    * "{$searchTitle}" text should contain "{$tooltip}" text ignoring whitespaces ignoring case
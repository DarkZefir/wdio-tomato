@smoke
@mvl @vlcc
Feature: PracticalContentFavorites

  @CU-36056 @CU-36189
  @logout
  Scenario Outline: Verify that added Forms/Answer Books/Guide Books can be opened of PC Favorites overlay
    * I am logged in
    * I add "<Doc>" document to favorites
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box > See All Button" should be visible
    * I click "My Practical Content Favorites Box > See All Button"
    * "Favorites Popup" should be visible
    * I remember number of "Favorites Popup > Items" as "links"
    * I remember random integer below "{$links}" and above "1" as "random"
    * I remember text of "Favorites Popup > #{$random} of Item Names" as "name"
    * I click "Favorites Popup > #{$random} of Items"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I remember value of "search-title" metadata parameter as "searchTitle"
    * "{$searchTitle}" text should contain "{$name}" text ignoring whitespaces ignoring case

    Examples:
      | Doc                                     | doctype    |
      | 09013e2c83f3c5c0                        | guidebook  |
      | 151247967c0b100099b990b11c2ac4f1019     | answerbook |
      | sec01e5a061367c241000ae99d8d385ad16940b | simpleform |

  @CU-36093 @CU-36190
  @local
  Scenario Outline: Verify that user can add Forms/Answer Books/Guide Books to PC Favorites from SRL
    * I am logged in
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" matching "<boxName>" ignoring case as "box"
    * I remember number of "#{$box} of Content Boxes > Items" as "links"
    * I remember random integer below "{$links}" and above "1" as "random"
    * I remember text of "#{$box} of Content Boxes > #{$random} of Items" as "docTitle"
    * I am on "All Content" PA
    * I wait until "Loading Indicator" is gone
    * I perform search of "{$docTitle}"
    * "#1 of Documents" should be visible
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * "Add To Popup > Save And Close" should be enabled
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box" should be visible
    * "My Practical Content Favorites Box > #1 of Links" should be visible
    * I remember "title" attribute of "My Practical Content Favorites Box > #1 of Links" as "tooltip"
    * "{$tooltip}" text should contain "{$docTitle}" text

    Examples:
      | boxName      |
      | Guide Books  |
      | Forms        |
      | Answer Books |

@smoke
@mvl @vlcc
@practical_content
Feature: Practical Content

  @CU-36191
  @logout
  Scenario Outline: Verify that user can delete document from PC Favorites overlay
    * I am logged in as "practCont@wk.com" with "password" password
    * I add "<doc>" document to favorites
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box > #1 of Links" should be visible
    * I click "My Practical Content Favorites Box > See All Button"
    * "Favorites Popup" should be visible
    * I click "Favorites Popup > #1 of Item Checkboxes"
    * I click "Favorites Popup > Delete Button"
    * I click "Favorites Popup > Confirm Button"
    * I wait until "Loading Indicator" is gone
    * "Favorites Popup > No Results Message" should be visible
    * I click "Favorites Popup > X Close Button"
    * "Favorites Popup" should not be visible
    * "Search Bar > Search Input" should be visible
    * I open "<doc>" document
    * "Favorite Button Checked" should not be visible

    Examples:
      | doc                                |
      | 6987bd8c7c431000b30c90b11c18cbab01 |

  @CU-35303 @CU-35410
  @logout
  Scenario Outline: Verify that 'See All' link is not displayed in Practical Content Results Clusters if results for practical content types does not exceed 3
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "<term>" on practical content
    * Text of "#1 of Results Clusters > Hits Number" should be "<hintsText>"
    * Count of "#1 of Results Clusters > Items" should be equal to "<linksNumber>"
    * "#1 of Results Clusters > See All" should not be visible

    Examples:
      | term                                                | hintsText | linksNumber |
      | Bank Compliance Guide                               | (1)       | 1           |
      | Corporate Counsellor's Deskbook - Block and Epstein | (1)       | 1           |

  @CU-35288 @CU-35408
  @logout
  Scenario Outline: [VLCC] Verify that selection of PA reduces amount of available Content Boxes on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    #Remember number of all boxes, disabled boxes, enabled boxes
    * I remember number of "Content Boxes" as "boxes"
    # And I add "1" to "{$boxes}" and remember result as "filterPC"
    * I remember number of "Content Boxes > Disabled Title" as "disTitle1"
    * I remember number of "Content Boxes > Enabled Title" as "enTitle1"
    #Select specific Practice area
    * I click "Practice Areas Filter > Label"
    * I click "Practice Areas Filter > Select All CheckBox"
    * I click "Practice Areas Filter > #<PA> in Options"
    * I click "Practice Areas Filter > Label"
    * I wait until "Loading Indicator" is gone
    #Remember number of all boxes, disabled boxes, enabled boxes
    * I remember number of "Content Boxes > Disabled Title" as "disTitle2"
    * I remember text of "Content Boxes > Disabled Title" as "disTitlesText"
    * I remember number of "Content Boxes > Enabled Title" as "enTitle2"
    * I remember text of "Content Boxes > Enabled Title" as "enTitlesText"
    #Compare that number of enabled boxes is lower, number of disabled boxes is bigger
    * "{$disTitle2}" number should be more than "{$disTitle1}"
    * "{$enTitle2}" number should be less than "{$enTitle1}"
    * Count of "Content Boxes > No Results" should be equal to "{$disTitle2}"
    #Check if number of options in Content Filter Dropdown is correct
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "{$boxes}"
    * Text of "Practical Content Filter > Label" should be "All Practical Content"
    * Count of "Practical Content Filter > Selected Disabled Options" should be equal to "{$disTitle2}"
    # And I add "1" to "{$enTitle2}" and remember result as "enTitle2"
    * Count of "Practical Content Filter > Selected Enabled Options" should be equal to "{$add($enTitle2, 1)}"
    #Check if correct items are enabled/disabled
    * I remember text of "Practical Content Filter > Selected Disabled Options" as "disFilterText"
    * I remember text of "Practical Content Filter > Selected Enabled Options" as "enFilterText"
    * "{$enFilterText}" text should contain "{$enTitlesText}" text ignoring case
    * "{$disFilterText}" text should be equal to "{$disTitlesText}" text ignoring case

    Examples:
      | PA                      |
      | Cybersecurity & Privacy |
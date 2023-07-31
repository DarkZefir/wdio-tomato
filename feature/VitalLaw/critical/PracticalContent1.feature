@critical_path
@mvl
@practical_content
Feature: Practical Content

  @CU-35377
  @logout
  Scenario: Verify that user can expand/collapse results clusters on "Practical Content Results" page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clusters"
    * I remember random integer below "{$clusters}" as "randomcluster"
    * "#{$randomcluster} of Results Clusters > Collapse Icon" should be visible
    * Count of "#{$randomcluster} of Results Clusters > Items" should be more than "0"
    * I click "#{$randomcluster} of Results Clusters > Collapse Icon"
    * "#{$randomcluster} of Results Clusters > Collapse Icon" should not be visible
    * "#{$randomcluster} of Results Clusters > Expand Icon" should be visible
    * "#{$randomcluster} of Results Clusters > #1 of Items" should not be visible
    * I click "#{$randomcluster} of Results Clusters > Expand Icon"
    * "#{$randomcluster} of Results Clusters > Expand Icon" should not be visible
    * "#{$randomcluster} of Results Clusters > Collapse Icon" should be visible
    * "#{$randomcluster} of Results Clusters > #1 of Items" should be visible
    * Count of "#{$randomcluster} of Results Clusters > Items" should be more than "0"

  @CU-35380
  @logout
  Scenario: Verify that by click on "See all" link in a results cluster on "Practical Content Results" page user is redirected to a view of all results for applied term within a certain practical content type
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clusters"
    * I remember random integer below "{$clusters}" as "randomcluster"
    * I remember text of "#{$randomcluster} of Results Clusters > Header Title" as "title"
    * I click "#{$randomcluster} of Results Clusters > See All"
    * I wait until "Loading Indicator" is gone
    * Count of "Results Clusters" should be equal to "1"
    * "#1 of Results Clusters > Results Panel" should be visible
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * I remember text of "#1 of Results Clusters > Header Title" as "title1"
    * "{$title}" text should contain "{$title1}" text ignoring case

  @CU-35381
  @logout
  Scenario Outline: Verify that user is able to open a document from documents list view of Guide Books/Answer Books
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" exactly matching "<text>" as "index"
    * I click "#{$index} of Content Boxes > See All Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * "#1 of Results Clusters > Toggle Switch" should be visible
    * I click "#1 of Results Clusters > #2 of Labels"
    * I wait 1 seconds
    * "#1 of Results Clusters > Results Panel" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should contain "<text>" ignoring case
    * I remember number of "#1 of Results Clusters > Items" as "items"
    * I remember random integer below "{$items}" as "randomitem"
    * I click "#1 of Results Clusters > #{$randomitem} of Items"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I click browser back button
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "1"
    Examples:
      | text         |
      | GUIDE BOOKS  |
      | ANSWER BOOKS |

  @CU-35382
  @logout
  Scenario Outline: Verify that user is able to change selections in "Practical Content" filter being on "Practical Content Results" page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I perform search of "<term>" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$boxes}"
    * "Practical Content Filter" should be visible
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * "Practical Content Filter > Select All Selected" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "$boxes"
    * I click "Practical Content Filter > Select All"
    * "Practical Content Filter > Select All Selected" should not be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "0"
    * I remember index of "Practical Content Filter > Options Label" matching "<cluster1>" as "ch1"
    * I remember index of "Practical Content Filter > Options Label" matching "<cluster2>" as "ch2"
    * I click "Practical Content Filter > #{$ch1} of Options CheckBox"
    * I click "Practical Content Filter > #{$ch2} of Options CheckBox"
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * "Practical Content Filter > Select All Partially Selected" should be visible
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    *  I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should not be visible
    * I wait until "Loading Indicator" is gone
    * Count of "Results Clusters" should be equal to "2"
    * Text of "#1 of Results Clusters > Header Title" should contain "<cluster1>" ignoring case
    * Text of "#2 of Results Clusters > Header Title" should contain "<cluster2>" ignoring case
    Examples:
      | term | cluster1     | cluster2   |
      | *    | Smart Charts | SmartTasks |

  @CU-35384
  @logout
  Scenario: Verify that user is able to change selections in "Practice Areas" filter being on "Practical Content Results" page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * I click "Header > Practical Content Button"
    * "Search Bar" should be visible
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$boxes}"
    * "Practical Content Filter" should be visible
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "{$subtract($PAs, 2)}"
    * I click "Practice Areas Filter > Select All"
    * "Practice Areas Filter > Select All Selected" should not be visible
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "ch"
    * I click "Practice Areas Filter > #{$randomInt(1, $ch)} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "ch"
    * I click "Practice Areas Filter > #{$randomInt(1, $ch)} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "ch"
    * I click "Practice Areas Filter > #{$randomInt(1, $ch)} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "3"
    * "Practice Areas Filter > Select All Partially Selected" should be visible
    * Text of "Practice Areas Filter > Label" should be "3 Practice Areas"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Text of "Practical Content Filter > Label" should be "All Practical Content"
    * Count of "Practical Content Filter > Selected Options" should be equal to "{$boxes}"
    * I remember number of "Practical Content Filter > Selected Enabled Options" as "optPC"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should not be visible
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$subtract($optPC, 1)}"

  @CU-35387
  @logout
  Scenario Outline: Verify that search made within a content box on be rerun from "History" dropdown
    * I am logged in
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "contentBoxes"
    * I remember random integer below "{$contentBoxes}" as "randombox"
    * I type "<term>" in "#{$randombox} of Content Boxes > Search Input Field"
    * I click "#{$randombox} of Content Boxes > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember text of "#1 of Results Clusters > Header Title" as "clusterTitle"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "<term>"
    * I click "Header > History Dropdown > #1 of Items Title"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "<term>"
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "1"
    * Text of "#1 of Results Clusters > Header Title" should be "{$clusterTitle}" ignoring case
    Examples:
      | term |
      | law  |

  @CU-35388
  @logout
  Scenario: Verify that search made within a content box can be rerun from "History" overlay
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "contentBoxes"
    * I remember random integer below "{$contentBoxes}" as "randombox"
    * I type "*" in "#{$randombox} of Content Boxes > Search Input Field"
    * I click "#{$randombox} of Content Boxes > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember text of "#1 of Results Clusters > Header Title" as "clusterTitle"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "*"
    * I click "Header > History Dropdown > See All"
    * "History Popup" should be visible
    * "History Popup > #1 of Items" should be visible
    * Text of "History Popup > #1 of Items" should contain "*"
    * I click "History Popup > #1 of Items > Link"
    * I wait until "Loading Indicator" is gone
    * "Search Bar" should be visible
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * Count of "Results Clusters" should be equal to "1"
    * Text of "#1 of Results Clusters > Header Title" should be "{$clusterTitle}"

  @CU-35389
  @logout
  Scenario: Verify that history records search within all practical content with all filters applied
    * I am logged in
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes > Title" should be visible
    * "Practice Areas Filter" should be visible
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * I click "Practice Areas Filter > Select All CheckBox"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "toSelect"
    * I click "Practice Areas Filter > #{$randomInt(1, $toSelect)} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter > Not Selected Enabled Options" as "toSelect"
    * I click "Practice Areas Filter > #{$randomInt(1, $toSelect)} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * I click "Practice Areas Filter > Label"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I click "Practical Content Filter > Select All CheckBox"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "toSelect"
    * I click "Practical Content Filter > #{$randomInt(1, $toSelect)} of Not Selected Enabled Options"
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "toSelect"
    * I click "Practical Content Filter > #{$randomInt(1, $toSelect)} of Not Selected Enabled Options"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * I click "Practical Content Filter > Label"
    * I wait until "Loading Indicator" is gone
    * Count of "Content Boxes" should be equal to "2"
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "2"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * I wait until text of "Header > History Dropdown > #1 of Items Title" is not "Loading ..."
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "*"
    * I click "Header > History Dropdown > #1 of Items Title"
    * I wait until "Loading Indicator" is gone
    * "Search Bar" should be visible
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * Count of "Results Clusters" should be equal to "2"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"

  @CU-35390
  Scenario Outline: Verify that thesaurus is working properly while search within practical content
    * I am logged in
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "Practical Content Filter" should be visible
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I click "Practical Content Filter > Select All CheckBox"
    * I click "Practical Content Filter > #2 of Options"
    * Count of "Practical Content Filter > Selected Options" should be equal to "1"
    * I click "Practical Content Filter > Label"
    * I wait until "Loading Indicator" is gone
    * I perform search of "<term>" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember text of "#1 of Results Clusters > Results Panel" as "results1"
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Search Bar > Thesaurus Checkbox"
    * I type "<term>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should not be "{$results1}"
    Examples:
      | term     |
      | contract |

  @CU-36094
  @logout
  Scenario: Verify that not Practical Content documents are not displayed in PC Favorites box
    * I am logged in as "practCont@wk.com" with "password" password
    * I open "f66690427dca10009554000d3a8daaf401" document
    * "Document Frame > Document Content" should be visible
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "My Practical Content Favorites Box" should be visible
    * "My Practical Content Favorites Box > No Results" should be visible

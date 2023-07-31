@smoke
@mvl @vlcc
@practical_content
Feature: Practical Content

  @CU-35330 @CU-35414
  @logout
  Scenario Outline: Verify that user is able to open an off-platform Smart Chart/a Smart Task from Practical Content Results page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember number of "#<number> of Results Clusters > Items" as "clusterItems"
    * I click "#<number> of Results Clusters > #{$randomInt(1, $clusterItems)} of Items"
    * I should see "<text>" text on page
    Examples:
      | number | text         |
      | 1      | Smart Charts |
      | 2      | SmartTask    |

  @CU-35331 @CU-35415
  @logout
  Scenario Outline: Verify that user is able to open a Guide Book/Form/Answer Book from Practical Content Results page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember index of "Results Clusters > Header Title" matching "<title>" as "index"
    * Text of "#{$index} of Results Clusters > Header Title" should contain "<title>"
    * I remember number of "#{$index} of Results Clusters > Items" as "clusterItems"
    * I remember random integer below "{$clusterItems}" as "randomItem"
    * I remember text of "#{$index} of Results Clusters > #{$randomItem} of Items" as "linkText"
    * I click "#{$index} of Results Clusters > #{$randomItem} of Items"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I remember text of "DATitle" as "linkText2"
    * "{$linkText}" text should contain "{$linkText2}" text
    Examples:
      | title        |
      | GUIDE BOOKS  |
      | FORMS        |
      | ANSWER BOOKS |

  @CU-35332 @CU-35417
  @logout
  Scenario Outline: Verify that user is able to open a Calculator/Decision Tree from Practical Content Results page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember index of "Results Clusters > Header Title" matching "<title>" as "index"
    * I click "#{$index} of Results Clusters > See All"
    * "#1 of Results Clusters > #1 of Links" should be visible
    * I remember index of "#1 of Results Clusters > Links" exactly matching "<text>" as "index1"
    * I click "#1 of Results Clusters > #{$index1} of Links"
    * I should see "<onpage>" text on page
    Examples:
      | title          | text                               | onpage                           |
      | CALCULATORS    | Employee Auto Inclusion Calculator | Employee Auto Inclusion          |
      | DECISION TREES | COBRA Requirements Decision Tree   | COBRA Requirements Decision Tree |

  @CU-35333 @CU-35418
  @logout
  Scenario Outline: Verify that after opening a document from "Practical Content Results" page, click on browser "Back" button returns user to a previous page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clustersNumber"
    * Text of "#<number> of Results Clusters > Header Title" should contain "<title>" ignoring case
    * I remember number of "#<number> of Results Clusters > Items" as "clusterItems"
    * I remember random integer below "{$clusterItems}" as "randomItem"
    * I click "#<number> of Results Clusters > #{$randomItem} of Items"
    * I wait until "Loading Indicator" is gone
    * I click browser back button
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$clustersNumber}"
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * I click browser back button
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$clustersNumber}"
    Examples:
      | number | title |
      | 4      | Forms |

  @CU-35334 @CU-35419
  @logout
  Scenario: Verify that after user performs a search within/clicks "See All" in practical content box, click on browser "Back" button returns user to a "Practical Content" dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * "#{$randombox} of Content Boxes > Title" should be visible
    * I click "#{$randombox} of Content Boxes > See All Button"
    * "#1 of Results Clusters" should be visible
    * I click browser back button
    * I wait until "Loading Indicator" is gone
    * I type "*" in "#{$randombox} of Content Boxes > Search Input Field"
    * I click "#{$randombox} of Content Boxes > Search Button"
    * "#1 of Results Clusters" should be visible
    * I click browser back button
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$boxes}"

  @CU-35335 @CU-35420
  @logout
  Scenario: Verify that filter selections on "Practical Content" dashboard remain sticky within browser session
    * I am logged in as "practCont@wk.com" with "password" password
    # Due to the current behavior on stg, waiting is necessary
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    # Configure Practice Areas Filter (select any PAs and remember them)
    * I click "Practice Areas Filter > Label"
    * I click "Practice Areas Filter > Select All CheckBox"
    * I remember number of "Practice Areas Filter >  Not Selected Enabled Options" as "option1PA"
    * I remember random integer below "{$option1PA}" as "ch1PA"
    * I click "Practice Areas Filter > #{$ch1PA} of Not Selected Enabled Options"
    * I remember number of "Practice Areas Filter >  Not Selected Enabled Options" as "option2PA"
    * I remember random integer below "{$option2PA}" as "ch2PA"
    * I click "Practice Areas Filter > #{$ch2PA} of Not Selected Enabled Options"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * I click "Practice Areas Filter > Label"
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * I wait until "Loading Indicator" is gone
    # Configure Practical Content Filter (Select any content types and remember them)
    * I click "Practical Content Filter > Label"
    * I click "Practical Content Filter > Select All CheckBox"
    * I remember number of "Practical Content Filter >  Not Selected Enabled Options" as "option1PC"
    * I remember random integer below "{$option1PC}" as "ch1PC"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > #{$ch1PC} of Not Selected Enabled Options"
    * I remember number of "Practical Content Filter >  Not Selected Enabled Options" as "option2PC"
    * I remember random integer below "{$option2PC}" as "ch2PC"
    * I click "Practical Content Filter > #{$ch2PC} of Not Selected Enabled Options"
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"
    * Count of "Content Boxes" should be equal to "2"
    # Go to All Content and then back to Practical Content
    * I click "Header > Home"
    * I click "Header > Practical Content Button"
    # Verify that only 2 boxes are displayed
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "2"
    # Verify that filters parameters remained the same as you configured
    * I click "Practice Areas Filter > Label"
    * I wait until "Practice Areas Filter > #1 of Options" is visible
    * Text of "Practice Areas Filter > Label" should be "2 Practice Areas"
    * Count of "Practice Areas Filter > Selected Options" should be equal to "2"
    * I click "Practice Areas Filter > Label"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types"

  @CU-35386 @CU-35422
  @logout
  Scenario Outline: Verify that search made within Practical Content is saved to History
    * I am logged in
    # Due to the current behavior on stg, waiting is necessary
    * I perform search of "<term>" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clustersNumber"
    * I click "Header > Home"
    * I click "Header > History Dropdown"
    * Text of "Header > History Dropdown > #1 of Items Title" should contain "<term>"
    * I click "Header > History Dropdown > #1 of Items Title"
    * Text of "Search Bar > #1 of Search Pills" should be "<term>"
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$clustersNumber}"
    Examples:
      | term |
      | tax  |

  @CU-35329 @CU-35413
  @logout
  Scenario: Verify that user is able to see all results found after search for a definite type of practical content by click on 'See all' link in results cluster
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clusters"
    * I remember random integer below "{$clusters}" as "randomcluster"
    * "#{$randomcluster} of Results Clusters > Header Label" should be visible
    * I remember text of "#{$randomcluster} of Results Clusters > Header Label" as "title"
    * I click "#{$randomcluster} of Results Clusters > See All"
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "1"
    * "#1 of Results Clusters > Header Label" should be visible
    * I remember text of "#1 of Results Clusters > Header Label" as "title1"
    * "{$title}" text should contain "{$title1}" text
    * "#1 of Results Clusters > Results Panel" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should contain "results for "*""

  @CU-35946 @CU-35968
  @logout
  Scenario Outline: Verify displaying of Results Clusters on 'Practical Content Results' page (part5)
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I perform search of "*" on practical content
    * "#<number> of Results Clusters > Header Title" should be visible
    * Text of "#<number> of Results Clusters > Header Title" should contain "<headerTitle>" ignoring case
    * "#<number> of Results Clusters > See All" should be visible
    * Text of "#<number> of Results Clusters > See All" should be "See all"
    * "#<number> of Results Clusters > Collapse Icon" should be visible
    * "#<number> of Results Clusters > Hits Number" should be visible
    * "#<number> of Results Clusters > #1 of Items" should be visible
    * Count of "#<number> of Results Clusters > Items" should be equal to "3"
    Examples:
      | number | headerTitle |
      | 8      | CHECKLISTS  |

  @CU-35959 @CU-35969
  @logout
  Scenario: Verify that user is able to open a Checklist from Practical Content Results page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All Content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" matching "CHECKLISTS" as "index"
    * I click "#{$index} of Content Boxes > See All Button"
    * Text of "#1 of Results Clusters > Header Title" should be "CHECKLISTS"
    * I remember number of "#1 of Results Clusters > Items" as "range"
    * I remember random integer below "{$range}" as "selectedDoc"
    * I remember text of "#1 of Results Clusters > #{$selectedDoc} of Items" as "textFromSRL"
    * I click "#1 of Results Clusters > #{$selectedDoc} of Items"
    * I click "Show Metadata"
    * I remember value of "search-title" metadata parameter as "searchTitle"
    * "{$searchTitle}" text should contain "{$textFromSRL}" text ignoring whitespaces ignoring case ignoring punctuation marks

  @CU-36054 @CU-36187
  Scenario: Verify that My Practical Content Favorites overlay appears on See All
    * I am logged in
    * I add "6987bd8c7c431000b30c90b11c18cbab01" document to favorites
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "My Practical Content Favorites Box" should be visible
    * "My Practical Content Favorites Box > See All Button" should be visible
    * I remember number of "My Practical Content Favorites Box > Links" as "links"
    * I click "My Practical Content Favorites Box > See All Button"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > Title" should be "My Practical Content Favorites" ignoring case
    * Count of "Favorites Popup > Items" should be equal to "{$links}"
    * "Favorites Popup > Toolbar Buttons" should be visible
    * "Favorites Popup > Toolbar Buttons" should be enabled
    * "Favorites Popup > Toolbar Buttons > Download Button" should be visible
    * "Favorites Popup > Toolbar Buttons > Email Button" should be visible
    * "Favorites Popup > Toolbar Buttons > Print Button" should be visible
    * "Favorites Popup > Toolbar Buttons > Download Button" should not be enabled
    * "Favorites Popup > Toolbar Buttons > Email Button" should not be enabled
    * "Favorites Popup > Toolbar Buttons > Print Button" should not be enabled
    * "Favorites Popup > Close Button" should be visible
    * "Favorites Popup > Close Button" should be enabled
    * "Favorites Popup > X Close Button" should be visible
    * "Favorites Popup > X Close Button" should be enabled
    * "Favorites Popup > Delete Button" should be visible
    * "Favorites Popup > Delete Button" should not be enabled
    * I click "Favorites Popup > Close Button"
    * "Favorites Popup" should not be visible

  @CU-36055 @CU-36188
  Scenario Outline: Verify that added Forms/Answer Books/Guide Books are displayed on top of PC Favorites overlay
    * I am logged in
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "#<boxName> in Content Boxes > Items" as "links"
    * I remember random integer below "{$links}" and above "1" as "random"
    * I remember text of "#<boxName> in Content Boxes > #{$random} of Items" as "docTitle"
    * I click "#<boxName> in Content Boxes > #{$random} of Items"
    * "Document Frame > Document Content" should be visible
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I click "Header > Practical Content Button"
    * "My Practical Content Favorites Box > See All Button" should be visible
    * I click "My Practical Content Favorites Box > See All Button"
    * "Favorites Popup" should be visible
    * I remember text of "Favorites Popup > #1 of Item Names" as "name"
    * "{$name}" text should contain "{$docTitle}" text

    Examples:
      | boxName      |
      | Guide Books  |
      | Forms        |
      | Answer Books |

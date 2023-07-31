@critical_path
@mvl
Feature: CopyLink

  @CU-32364
  Scenario Outline: Verify UI of copy link to content popup
    * I am logged in
    # Go to Securities - All PA
    * I open base url with "#/home/Securities"
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of content containers
    * I remember number of "Content Box > Main Content Types" as "contentBoxes"
    * Count of "Content Box > Main Content Types > Header Copy Link" should be equal to "{$contentBoxes}"
    * I remember random integer below "{$contentBoxes}" as "random"
    # Remember the title of any content container and click on Copy Link button
    * I remember text of "Content Box > #{$random} of Main Content Types > Header Title" as "title"
    * I click "Content Box > #{$random} of Main Content Types > Header Copy Link"
    * "Copy Content Link Popup" should be visible
    # Verify that overlay with 'SAVE LINKS TO CONTENT' title and 'SECURITIES - ALL - SELECT <title> CONTENT' sub-title is displayed
    * Text of "Copy Content Link Popup > Title" should be "SAVE LINKS TO CONTENT"
    * "Copy Content Link Popup > Sub Title" should be visible
    * Text of "Copy Content Link Popup > Sub Title" should be "SECURITIES - ALL - SELECT {$title} CONTENT"
    # Verify that 'x Close', 'Cancel', 'Copy Selected Links to Clipboard' buttons are displayed
    * "Copy Content Link Popup > Close X Icon" should be visible
    * "Copy Content Link Popup > Cancel Button" should be visible
    * "Copy Content Link Popup > Copy Button" should be visible
    # Verify that 'Copy Selected Links to Clipboard' button is disabled
    * "Copy Content Link Popup > Copy Button" should not be enabled
    # Vefify that more that one node is displayed on the overlay
    * Count of "Copy Content Link Popup > Nodes" should be more than "1"
    # Click on the button from examples
    * I click "Copy Content Link Popup > <Button>"
    # Verify that the overlay is no longer displayed
    * "Copy Content Link Popup" should not be visible

    Examples:
      | Button        |
      | Close X Icon  |
      | Cancel Button |

  @CU-32370
  Scenario: Copy links to content: Verify that all Content groups and all pubs present in overlay
    * I am logged in
    # Go to 'Bankruptcy' PA
    * I am on "BANKRUPTCY" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of content containers
    * I remember number of "Content Box > Main Content Types" as "contentBoxes"
    * I remember random integer below "{$contentBoxes}" as "random"
    # Remember the titles of content boxes of any content container and click on Copy Link button
    * I remember text of "Content Box > #{$random} of Main Content Types > Content Types > Title" as "titles"
    * I click "Content Box > #{$random} of Main Content Types > Header Copy Link"
    * "Copy Content Link Popup" should be visible
    * "Copy Content Link Popup > #1 of Nodes" should be visible
    # Remember the titles of the nodes
    * I remember text of "Copy Content Link Popup > Nodes" as "nodes"
    # Verify that the titles of the content boxes are equal to the titles of nodes ignoring case
    * "$nodes" collection should be equal to "$titles" collection ignoring case ignoring order
    # Remember the number of nodes
    * I remember number of "Copy Content Link Popup > Nodes" as "nodesNum"
    * I remember random integer below "{$nodesNum}" as "randomNode"
    # Remember the title of any node and click on it
    * I remember text of "Copy Content Link Popup > #{$randomNode} of Nodes > Title" as "nodeTitle"
    * I click "Copy Content Link Popup > #{$randomNode} of Nodes > Title"
    * "Copy Content Link Popup > #1 of First Child Nodes" should be visible
    # Remember the title of first child node
    * I remember text of "Copy Content Link Popup > First Child Nodes" as "childNodes"
    # Click on 'Cancel' button
    * I click "Copy Content Link Popup > Cancel Button"
    * I remember index of "Content Box > #{$random} of Main Content Types > Content Types > Title" matching "{$nodeTitle}" ignoring case as "index"
    # Click on 'See All' button for any content box under selected content container
    * I click "Content Box > #{$random} of Main Content Types > #{$index} of Content Types > Title"
    * "See All Popup" should be visible
    # Remember the titles of the links
    * I remember text of "See All Popup > Links" as "links"
    # Verify that the titles of the child nodes from the previous overlay are equal to the titles of the links ignoring order
    * "$childNodes" collection should be equal to "$links" collection ignoring case ignoring order

  @CU-32368
  Scenario Outline: Copy links to content: Verify that copied data contains title and url
    * I am logged in
    # Open the PA from examples
    * I open base url with "<PA>"
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on Copy Link button in Header of the first Content container
    * I click "Content Box > #1 of Main Content Types > Header Copy Link"
    * "Copy Content Link Popup" should be visible
    * "Copy Content Link Popup > #1 of Nodes" should be visible
    # Remember the title of the node exactly matching the title from examples
    * I remember index of "Copy Content Link Popup > Nodes" exactly matching "<topNode>" as "index"
    # Click on the selected node
    * I click "Copy Content Link Popup > #{$index} of Nodes"
    # Click on the first child node of the selected node
    * I click "Copy Content Link Popup > #1 of First Child Nodes"
    # Select the second child node
    * I click "Copy Content Link Popup > #2 of First Child Nodes > Checkbox"
    # Verify that the number of selected nodes is equal to 1
    * Count of "Copy Content Link Popup > Selected Nodes" should be equal to "1"
    * "Copy Content Link Popup > Copy Button" should be clickable
    # Verify that 'Copy Selected Links to Clipboard' button is enabled
    * "Copy Content Link Popup > Copy Button" should be enabled
    # Remember the title of the selected sub-node and its length
    * I remember text of "Copy Content Link Popup > #1 of Selected Nodes> Title" as "title"
    * I remember "{$title}" string length as "titleLength"
    # Click on 'Copy Selected Links to Clipboard' button
    * I click "Copy Content Link Popup > Copy Button"
    * I remember clipboard content as "text"
    * I remember "{$text}" string length as "textLength"
    # Verify that the length of the copied link is less than 256
    * "{$subtract($textLength, $titleLength)}" number should be less than "256"
    * "{$text}" text should contain "{$title}" text

    Examples:
      | PA           | topNode                  |
      | #/home/Labor | Cases                    |
      | #/home/Labor | Treatises & Explanations |

  @CU-32369
  Scenario Outline: Copy links to content: Verify copied data when more than 1 link is copied
    * I am logged in
    # Open the PA from examples
    * I open base url with "<PA>"
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on <contentBox> link
    * I click "Content Box > #<contentBox> in Main Content Types > Header Copy Link"
    * "Copy Content Link Popup" should be visible
    * "Copy Content Link Popup > #1 of Nodes" should be visible
    # Click on the first node
    * I click "Copy Content Link Popup > #<topNode> in Nodes"
    # Remember the title of the node matching <firstTitle> from examples
    * I click "Copy Content Link Popup > #<firstTitle> in First Child Nodes"
    # Select the checkbox for the node matching <firstTitle> from examples
    * I click "Copy Content Link Popup > #<firstTitle> in First Child Nodes > Checkbox"
    # Select the checkbox for the node matching <secondTitle> from examples
    * I click "Copy Content Link Popup > #<secondTitle> in Second Child Nodes > Checkbox"
    # Verify that two nodes are selected
    * Count of "Copy Content Link Popup > Selected Nodes" should be equal to "2"
    * "Copy Content Link Popup > Copy Button" should be clickable
    * "Copy Content Link Popup > Copy Button" should be enabled
    # Remember the title of the first selected node
    * I remember text of "Copy Content Link Popup > #1 of Selected Nodes > Title" as "title1"
    * I remember "{$title1}" string length as "title1Length"
    # Remember the title of the second selected node
    * I remember text of "Copy Content Link Popup > #2 of Selected Nodes > Title" as "title2"
    * I remember "{$title2}" string length as "title2Length"
    # Click on 'Copy Selected Links to Clipboard'
    * I click "Copy Content Link Popup > Copy Button"
    # Verify that the length of the copied links without titles is less than 512
    * I remember clipboard content as "text"
    * I remember "{$text}" string length as "textLength"
    * "{$subtract($textLength, $title1Length, $title2Length)}" number should be less than "512"
    * "{$add($textLength, $title1Length, $title2Length)}" number should be less than "512"
    * "{$text}" text should contain "{$title1}" text
    * "{$text}" text should contain "{$title2}" text

    Examples:
      | PA           | contentBox | topNode                | firstTitle                           | secondTitle       |
      | #/home/Elder | ELDER LAW  | Elder Law Publications | ElderLaw Portfolio Series - Margolis | Table of Contents |

  @CU-32366
  Scenario: Copy links to content: Verify that hidden content groups are available in copy overlay
    * I am logged in
    # Go to Tax - International PA
    * I am on "TAX - INTERNATIONAL" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on Configuration icon
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Verify that the title of the overlay is 'Select Dashboard Content'
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Remember the number of items in the drop-down
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    # Click on any item in the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomInt(1, $dropdowntitles)} of Items"
    # Remember the title of the selected item
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown" as "title"
    # Select 'Do not display this group'
    * I click "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox"
    # Click on 'Save and Close'
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    # Verify that previously selected in the drop-down item is not displayed as a content box
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should not contain "{$title}" ignoring case
    # Click on 'Copy Link'
    *  I click "Content Box > #1 of Main Content Types > Header Copy Link"
    * "Copy Content Link Popup" should be visible
    * "Copy Content Link Popup > #1 of Nodes" should be visible
    # Verify that previously selected in the drop-down item is displayed
    * Text in collection of "Copy Content Link Popup > Nodes" should contain "{$title}" ignoring case

  @CU-33527
  @logout
  Scenario Outline: URL does not exceed 256 characters (TLP) #1
    # Login with the user from examples
    * I am logged in as "<user>" with "password" password
    # Open topic from examples
    * I open "<DocID>" topics document
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * "Toolbar Buttons > Copy Link Button" should be clickable
    # Click on 'Copy Link to Clipboard'
    * I click "Toolbar Buttons > Copy Link Button"
    * "Blank Info Popup" should be visible
    * I remember clipboard content as "copyurl"
    # Verify that the copied URL is less than 256 characters
    * "{$copyurl}" string should be less than "256" characters
    # Open the copied URL
    * I open "{$copyurl}" url
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    # Scroll down and click on 'Show Metadata'
    * I click "Show Metadata"
    * I wait 2 seconds
    * I remember value of "docID" metadata parameter as "docId"
    # Verify that docID in Metadata contains DocID from examples
    * "{$docId}" text should contain "<DocID>" text
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"

    Examples:
      | user              | DocID                               |
      | interlimit@wk.com | badda8cc7c931000845890b11c18cbab018 |
      | kitlonly@wk.com   | 27f64e087c9610008b7a90b11c18c90202  |

@smoke
@mvl @vlcc
@practical_content
Feature: Practical Content

  @CU-35066 @CU-35394
  @logout
  Scenario: Verify UI of 'Practical Content Results' page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "contentBoxes"
    * I perform search of "*" on practical content
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * "Search Bar > Search Delete" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Thesaurus Checkbox" should be visible
    * "Practice Areas Filter" should be visible
    * "Practical Content Filter" should be visible
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$contentBoxes}"

  @CU-35070 @CU-35395
  @logout
  Scenario Outline: Verify displaying of Results Clusters on 'Practical Content Results' page (part1)
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * Text of "#<number> of Results Clusters > Header Title" should contain "<headerTitle>" ignoring case
    * Text of "#<number> of Results Clusters > See All" should be "See all"
    * "#<number> of Results Clusters > Collapse Icon" should be visible
    * "#<number> of Results Clusters > Hits Number" should be visible
    * "#<number> of Results Clusters > #1 of Items" should be visible
    * Count of "#<number> of Results Clusters > Items" should be equal to "3"
    Examples:
      | number | headerTitle  |
      | 1      | SMART CHARTS |
      | 2      | SMARTTASKS   |

  @CU-35090 @CU-35396
  Scenario Outline: Verify displaying of Results Clusters on 'Practical Content Results' page (part2)
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * Text of "#<number> of Results Clusters > Header Title" should contain "<headerTitle>"
    * Text of "#<number> of Results Clusters > See All" should be "See all"
    * "#<number> of Results Clusters > Collapse Icon" should be visible
    * "#<number> of Results Clusters > Hits Number" should be visible
    * "#<number> of Results Clusters > #1 of Items" should be visible
    * Count of "#<number> of Results Clusters > Items" should be equal to "3"

    Examples:
      | number | headerTitle    |
      | 4      | FORMS          |
      | 5      | CALCULATORS    |
      | 6      | DECISION TREES |
      | 3      | GUIDE BOOKS    |
      | 7      | ANSWER BOOKS   |

  @CU-35113 @CU-35399
  @logout
  Scenario Outline: Verify that user is able to open an off-platform Smart Chart/a Smart Task from Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" exactly matching "<title>" as "index"
    * I remember number of "#{$index} of Content Boxes > Items" as "boxItems"
    * I remember random integer below "{$boxItems}" as "randomItem"
    * I click "#{$index} of Content Boxes > #{$randomItem} of Items"
    * I should see "<text>" text on page
    Examples:
      | title        | text         |
      | SMART CHARTS | Smart Charts |
      | SMARTTASKS   | SmartTask    |

  @CU-35117 @CU-35400
  @logout
  Scenario Outline: Verify that user is able to open a Guide Book/Form/Answer Book from Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" exactly matching "<title>" as "index"
    * I remember number of "#{$index} of Content Boxes > Items" as "boxItems"
    * I remember random integer below "{$boxItems}" as "randomItem"
    * I click "#{$index} of Content Boxes > #{$randomItem} of Items"
    * "Document Frame > Document Content" should be visible
    Examples:
      | title        |
      | GUIDE BOOKS  |
      | FORMS        |
      | ANSWER BOOKS |

  @CU-35120 @CU-35401
  @logout
  Scenario Outline: Verify that links for the same Calculators/Decision Trees from Dashboard and Results Panel lead to the same documents
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" exactly matching "<title>" as "index"
    * I remember number of "#{$index} of Content Boxes > Items" as "boxItems"
    * I remember random integer below "{$boxItems}" as "randomItem"
    * I remember text of "#{$index} of Content Boxes > #{$randomItem} of Items" as "text"
    * I remember "href" attribute of "#{$index} of Content Boxes > #{$randomItem} of Items" as "url"
    * I click "#{$index} of Content Boxes > See All Button"
    * "#1 of Results Clusters > #1 of Items" should be visible
    * I remember index of "#1 of Results Clusters > Links" exactly matching "{$text}" as "indexLink"
    * I remember "href" attribute of "#1 of Results Clusters > #{$indexLink} of Links" as "url1"
    * "{$url}" text should be equal to "{$url1}" text
    Examples:
      | title          |
      | CALCULATORS    |
      | DECISION TREES |

  @CU-35244 @CU-35402
  @logout
  Scenario: Verify that 'Notice' overlay is displayed when no options are selected in "Practice Area" filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Practice Areas Filter > Label"
    * I click "Practice Areas Filter > #1 of Options CheckBox"
    * I click "Practice Areas Filter > Label"
    * Text of "Notice Popup > Notice Title" should be "Notice" ignoring case
    * "Notice Popup > Notice Message" should be visible
    * Text of "Notice Popup > Notice Message" should be "No results for this practice area filter selection." ignoring case
    * "Notice Popup > Close Button" should be visible
    * "Notice Popup > X Button" should be visible

  @CU-35260 @CU-35403
  @logout
  Scenario: Verify that 'Notice' overlay is displayed when no options are selected in "Practical Content" filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * I click "Practical Content Filter > #1 of Options CheckBox"
    * I click "Practical Content Filter > Label"
    * Text of "Notice Popup > Notice Title" should be "Notice" ignoring case
    * "Notice Popup > Notice Message" should be visible
    * Text of "Notice Popup > Notice Message" should be "No results for this practical content filter selection." ignoring case
    * "Notice Popup > Close Button" should be visible
    * "Notice Popup > X Button" should be visible

  @CU-35272 @CU-35405
  @logout
  Scenario: Verify that user is able to change/apply selections in 'Practical Content' Filter on Practical Content Dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I remember number of "Content Boxes" as "boxes"
    * Text of "Practical Content Filter > Label" should be "All Practical Content" ignoring case
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > Select All Selected" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "{$boxes}"
    * "Practical Content Filter > #1 of Selected Disabled Options" should not be visible
    * I click "Practical Content Filter > Select All Selected CheckBox"
    * Text of "Practical Content Filter > Label" should be "0 Practical Content Types" ignoring case
    * "Practical Content Filter > Select All" should be visible
    * I remember random integer below "{$subtract($boxes, 1)}" as "randContentType"
    * I remember text of "Practical Content Filter > #{$randContentType} of Not Selected Enabled Options" as "content1"
    * I click "Practical Content Filter > #{$randContentType} of Not Selected Enabled Options"
    * "Practical Content Filter > #1 of Selected Options" should be visible
    * "Practical Content Filter > Select All Partially Selected" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "1"
    * Text of "Practical Content Filter > Label" should be "{$content1}" ignoring case
    * I click "Practical Content Filter > Label"
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "1"
    * Text of "#1 of Content Boxes > Title" should be "{$content1}" ignoring case
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I remember number of "Practical Content Filter > Not Selected Enabled Options" as "contentToSelect2"
    * I remember random integer below "{$contentToSelect2}" and above "{$randContentType}" as "randContentType2"
    * I remember text of "Practical Content Filter > #{$randContentType2} of Not Selected Enabled Options" as "content2"
    * I click "Practical Content Filter > #{$randContentType2} of Not Selected Enabled Options"
    * Count of "Practical Content Filter > Selected Options" should be equal to "2"
    * Text of "Practical Content Filter > Label" should be "2 Practical Content Types" ignoring case
    * I click "Practical Content Filter > Label"
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "2"
    * Text of "#1 of Content Boxes > Title" should be "{$content1}" ignoring case
    * Text of "#2 of Content Boxes > Title" should be "{$content2}" ignoring case

  @CU-35286 @CU-35407
  @logout
  Scenario: Verify that all types of practical content are displayed in "Practical Content" filter on "Practical Content" dashboard
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * Text of "Practical Content Filter > Label" should be "All Practical Content" ignoring case
    * I wait until "Loading Indicator" is gone
    * I click "Practical Content Filter > Label"
    * Text of "Practical Content Filter > #1 of Options" should be "All Practical Content"
    * Text of "Practical Content Filter > #2 of Options" should contain "Smart Charts"
    * Text of "Practical Content Filter > #3 of Options" should contain "SmartTasks"
    * Text of "Practical Content Filter > #4 of Options" should contain "Guide Books"
    * Text of "Practical Content Filter > #5 of Options" should contain "Forms"
    * Text of "Practical Content Filter > #6 of Options" should contain "Calculators"
    * Text of "Practical Content Filter > #7 of Options" should contain "Decision Trees"
    * Text of "Practical Content Filter > #8 of Options" should contain "Answer Books"
    * Text of "Practical Content Filter > #9 of Options" should contain "Checklists"

  @CU-35287 @CU-35406
  @logout
  Scenario Outline: Verify that disabled content boxes are displayed on "Practical Content" Dashboard when selected Practice Area does not contain correspondent type(s) of Practical Content
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "Practice Areas Filter" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * I click "Practice Areas Filter > Select All CheckBox"
    * I click "Practice Areas Filter > #<chName> in Options"
    * Text of "Practice Areas Filter > Label" should contain "<chName>" ignoring case
    * I click "Practice Areas Filter > Label"
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$boxes}"
    * "#2 of Content Boxes > Title" should not be enabled
    * "#2 of Content Boxes > Search Input Field" should not be enabled
    * "#2 of Content Boxes > Search Button" should not be enabled
    * "#2 of Content Boxes > See All Button" should not be visible
    * "#2 of Content Boxes > No Results" should be visible
    * Text of "#2 of Content Boxes > No Results" should contain "<text1>"
    * "#4 of Content Boxes > Title" should not be enabled
    * "#4 of Content Boxes > Search Input Field" should not be enabled
    * "#4 of Content Boxes > Search Button" should not be enabled
    * "#4 of Content Boxes > See All Button" should not be visible
    * "#4 of Content Boxes > No Results" should be visible
    * Text of "#4 of Content Boxes > No Results" should be "<text2>"

    Examples:
      | chName                     | text1                                     | text2                                |
      | Banking | No SmartTasks for selected practice areas | No Forms for selected practice areas |

  @CU-35289 @CU-35409
  @logout
  Scenario Outline: Verify that after applying selection of one practical content type in "Practical Content" filter only Practice Areas containing this type of practical content remains enabled in "Practice Areas" filter
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * I remember number of "Practice Areas Filter > Selected Disabled Options" as "disabledNum"
    * I remember number of "Practice Areas Filter > Selected Enabled Options" as "enabledNum"
    * I click "Practice Areas Filter > Label"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * I remember index of "Practical Content Filter > Options" matching "<type>" as "index"
    * I click "Practical Content Filter > Select All CheckBox"
    * I click "Practical Content Filter > #{$index} of Options CheckBox"
    * Count of "Practical Content Filter > Selected Options" should be equal to "1"
    * I click "Practical Content Filter > Label"
    * I wait until "Loading Indicator" is gone
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > Select All Selected" should be visible
    * Count of "Practice Areas Filter > Selected Disabled Options" should be more than "{$disabledNum}"
    * Count of "Practice Areas Filter > Selected Enabled Options" should be less than "{$enabledNum}"

    Examples:
      | type        |
      | Calculators |

  @CU-35101 @CU-35412
  @logout
  Scenario: Verify that user is able to see all items for a definite Practical Content type by click on 'See All' button in content box
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * "#{$randombox} of Content Boxes > Title" should be visible
    * I remember text of "#{$randombox} of Content Boxes > Title" as "title"
    * I click "#{$randombox} of Content Boxes > See All Button"
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "1"
    * "#1 of Results Clusters > Header" should be visible
    * Text of "#1 of Results Clusters > Header Label" should be "{$title}"
    * "#1 of Results Clusters > Results Panel" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should contain "results for "*""

  @CU-35057 @CU-35060
  @logout
  Scenario Outline: Verify that approptiate content boxes are displayed on 'Practical Content' dashboard for user with full subscription(part1)
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * Text of "#<number> of Content Boxes > Title" should be "<boxTitle>"
    * Text of "#<number> of Content Boxes > Notification" should be "<notificationText>"
    * "#<number> of Content Boxes > Search Input Field" should be visible
    * Placeholder text for "#<number> of Content Boxes > Search Input Field" should be "<placeholderText>"
    * Count of "#<number> of Content Boxes > Items" should be equal to "3"
    * "#<number> of Content Boxes > See All Button" should be visible

    Examples:
      | number | boxTitle     | notificationText                                                                                              | placeholderText            |
      | 1      | SMART CHARTS | Multi-jurisdictional surveys or comprehensive answers on a given topic based upon your selections of interest | Search within Smart Charts |
      | 2      | SMARTTASKS   | Guided workflow tools, supplemented by expert content, to complete a particular task                          | Search within SmartTasks   |
      | 3      | GUIDE BOOKS  | Provide practical tips and insights on how to be compliant related to a topic                                 | Search within Guide Books  |
      | 4      | FORMS        | Common sample forms or agreements with expert commentary when available                                       | Search within Forms        |
      | 5      | CALCULATORS    | Workflow tools that provide step-by-step calculations for a topic                                                                        | Search within Calculators    |
      | 6      | DECISION TREES | Workflow tools that require answers to questions at each step and guide one through completion resulting in a finished task or an answer | Search within Decision Trees |
      | 7      | ANSWER BOOKS   | Written in a Q & A format, providing straightforward answers to compliance related topics                                                | Search within Answer Books   |
      | 8      | CHECKLISTS     | Topics to consider or task-based list of items required                                                                                  | Search within Checklists     |
@smoke
@mvl @vlcc @px
@ipa
@contents_panel
Feature: Contents Panel

  @CU-31780 @CU-32387 @CU-33122
  Scenario Outline: Verify that next document in contents tree is opened in Read view on clicking 'Next document' button in Utility bar
    * I am logged in
    # Open <docId> document
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember text of "Selected Link" as "docTitle1"
    * I remember text of "Contents Tab > Selected Link" as "docTitle1"
    # Verify that doc's title displayed in Read view contains "{$docTitle1}" ("Selected Link" text)
    * Text of "Document Frame > Title" should contain "$docTitle1" ignoring case ignoring whitespaces
    # Verify that the following the next node after "Selected Link" in "Contents" panel is collapsed
    * "Contents Tab > #1 of Expanded Third Child Node" should not be visible
    # Click on "Next Document" button in Toolbar
    * I click "Toolbar > Next Document Button"
    * I wait until "Loading Indicator" is gone
    # Verify that the node after initially selected link in "Contents" panel is expanded and First of its documents is displayed Selected
    * Text of "Contents Tab > Selected Link" should not be "$docTitle1"
    # Remember text of currently "Selected Link" in "Contents" panel as "docTitle2"
    * I remember text of "Contents Tab > Selected Link" as "docTitle2"
    # Verify that document's title displayed in Read view contain remembered "{$docTitle2}"
    * Text of "Document Frame > Title" should contain "$docTitle2" ignoring case ignoring whitespaces
    # Check that text of "{$docTitle1}" and "{$docTitle2}" are different
    * "$docTitle1" text should not be equal to "$docTitle2" text

    Examples:
      | docId                                   |
      | mtg01ad8000f47db910008b8b000d3a8b5a8e04 |

  @CU-31781 @CU-32388 @CU-33123
  Scenario Outline: Verify that previous document in contents tree is opened in Read view on clicking 'Previous document' button in Utility bar
    * I am logged in
    # Open "<docId>" document
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember text of "Selected Link" in Contents Panel as "docTitle1"
    * I remember text of "Contents Tab > Selected Link" as "docTitle1"
    # Remember label text of First Expanded Child Node of First level
    * I remember text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" as "nodeLabel1"
    # Verify that doc's title in Read View contains text of "Selected Link" in "Contents" panel
    * Text of "Document Frame > Title" should contain "$docTitle1" ignoring case ignoring whitespaces
    # Click "Revious Document" button in Toolbar
    * I click "Toolbar > Previous Document Button"
    * I wait until "Loading Indicator" is gone
    * Text of "Contents Tab > Selected Link" should not be "$docTitle1"
    # Remember text of changed "Selected Link" as "docTitle2"
    * I remember text of "Contents Tab > Selected Link" as "docTitle2"
    # Remember label text of First Expanded Child Node of First level as "nodeLabel2"
    * I remember text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" as "nodeLabel2"
    # Verify that doc's title in Read View contains "{$docTitle2}"
    * Text of "Document Frame > Title" should contain "$docTitle2" ignoring case ignoring whitespaces
    # Verify that initially remembered "{$docTitle1}" text  is different from currently displayed "{$docTitle2}" text of "Selected Link"
    * "$docTitle1" text should not be equal to "$docTitle2" text
    # Verify that initially remembered "{$nodeLabel1}" text is different from currently displayed "{$nodeLabel2}" text of First Expanded Child Node of First Level
    * "$nodeLabel1" text should not be equal to "$nodeLabel2" text

    Examples:
      | docId                                   |
      | mtg011e4752607e051000ba74000d3a8abb4e02 |

  @CU-31655 @CU-32391 @CU-33126
  Scenario Outline: Verify that when UCM document is opened from Search results List 'Contents' panel is expanded
    * I am logged in
    # Search for <daId> from examples
    * I perform search of "<daId>"
    # Open found document in Read View
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Remember text of document selected in Contents Panel as "docTitle"
    * I remember text of "Contents Tab > Selected Link" as "docTitle"
    # Verify that all level nodes that that conatain First document of UCM publication are expanded and highlighted
    * "Contents Tab > #1 of Expanded Parent Node > Path Header" should be visible
    * "Contents Tab > #1 of Expanded First Child Node > Path Header" should be visible
    * Text of "Contents Tab > #1 of Expanded First Child Node > #1 of Links" should contain "{$docTitle}" ignoring case ignoring whitespaces
    # Verify that title of the document in Read View is the same as title of document selected in Contents panel ("{$docTitle}")
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | daId             |
      | 09013e2c844f416d |

  @CU-31760 @CU-32396 @CU-33135
  Scenario Outline: Verify that user is able to collapse expanded nodes in 'Contents' panel
    * I am logged in
    # Search for <docId> document from examples
    * I perform search of "<docId>"
    # Click First Document in "Results" Page
    * I click "#1 of Documents"
    # Verify that document is opened in "Read" view
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Click "Collapse" button of #1 of Expanded Child Node of Second level
    * I click "Contents Tab > #1 of Expanded Second Child Node > Expand Button"
    # Check that Links under #1 of Expanded Child Node of Second level is not visible anymore
    * "Contents Tab > #1 of Expanded Second Child Node" should not be visible
    # Check that Link(s) under #1 of Expanded Child Node of First level is(are) visible
    * "Contents Tab > #1 of Expanded First Child Node > #1 of Links" should be visible
    # "Collapse" button of #1 of Expanded Child Node of First level
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #1 of Expanded First Child Node > Expand Button"
    # Check that Link(s) under #1 of Expanded Child Node of First level is(are) not visible
    * "Contents Tab > #1 of Expanded First Child Node" should not be visible
    # Check that First Child Nodes are Collapses and their Headers are visible
    * "Contents Tab > #1 of Collapsed First Child Node > Header" should be visible
    # Click "Collapse" button of Expanded Parent Node
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #1 of Expanded Parent Node > Expand Button"
    # Verify that Collapsed Child Nodes are not visible anymore
    * "Contents Tab > #1 of Collapsed First Child Node" should not be visible

    Examples:
      | docId            |
      | 09013e2c844f4178 |

  @CU-31759 @CU-32405 @CU-33140
  Scenario Outline: Verify that user is able to navigate to a necessary document by expanding publication nodes in 'Contents' panel
    * I am logged in
    # Open <docId> document from examples
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember text of Selected link as "docTitle1"
    * I remember text of "Contents Tab > Selected Link" as "docTitle1"
    # Verify that document's title opened in Read View contains remembered "{$docTitle1}"
    * Text of "Document Frame > Title" should contain "{$docTitle1}" ignoring case ignoring whitespaces
    # Click "Expand" button in First Collapsed Parent Node
    * I click "Contents Tab > #1 of Collapsed Parent Node > Header > Expand Button"
    * I wait until "Loading Indicator" is gone
    # Click on "Expand" button of remembered Collapsed First Child Node
    * I click "Contents Tab > #<ChildNode> in Collapsed First Child Node > Header > Expand Button"
    * "Contents Tab > #<ChildNode> in Expanded First Child Node > #1 of Links" should be visible
    # Remember text of First link displayed within just expanded First Child Node as "docTitle2"
    * I remember text of "Contents Tab > #<ChildNode> in Expanded First Child Node > #1 of Links" as "docTitle2"
    * I move mouse over "Contents Tab > Root Title"
    # Click First link within Expanded First Child Node
    * I click "Contents Tab > #<ChildNode> in Expanded First Child Node > #1 of Links"
    * I wait until "Loading Indicator" is gone
    # Verify that clicked link is now selected and text of Selected Link contains remembered "{$docTitle2}"
    * Text of "Contents Tab > Selected Link" should contain "{$docTitle2}" ignoring case ignoring whitespaces
    * "Document Frame > Title" should be visible
    # Verify that document's title text is also change and now contains "{$docTitle2}" text
    * Text of "Document Frame > Title" should contain "{$docTitle2}" ignoring case ignoring whitespaces
    Examples:
      | docId            | ChildNode                                        |
      | 09013e2c844f416d | Part 16—Equal Access to Justice Act: Regulations |

  @CU-31653 @CU-32406 @CU-33141
  Scenario Outline: Verify that 'Contents' panel is expanded when user opens a document from Search Result list
    * I am logged in
    # Perform search for <docId> from examples
    * I perform search of "<docId>"
    # Open found document in Read View
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Verify that text of document selected in Contents Panel is the same as title in Read View
    * I remember text of "Contents Tab > Selected Link" as "docTitle"
    * Text of "Document Frame > Title" should be "{$docTitle}" ignoring whitespaces
    # Verify that selected document in Contents Panel has background color of #3385ac
    * Background color of "Contents Tab > Selected Link" should be "#3385ac"
    # Verify that Contents Panel is expanded
    * Count of "Contents Tab > Expanded Parent Node" should be more than "0"

    Examples:
      | docId            |
      | 09013e2c844f9e13 |

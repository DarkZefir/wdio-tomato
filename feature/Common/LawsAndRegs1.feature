@smoke
@mvl @vlcc
@LawsAndRegs
Feature: LawsAndRegs1

  @CU-39780 @CU-41806
  @local
  Scenario Outline: Check count of title path elements for Laws&Regulations documents (USC, SS, SR)
    * I am logged in
    #Open any Laws&Regs documents
    * I open "<doc>" document
    * "Document Frame > Document Path" should be visible
    #Verify that document path elements have 1st parts of expanded nodes
    * I click "Document Frame > #1 of Document Path Nodes"
    * I remember number of "Contents Tab > Active Path Nodes > Collapse Button" as "nodesToc"
    * Count of "Document Frame > Document Path Nodes" should be equal to "{$nodesToc}"
    * I remember text of "Document Frame > #1 of Document Path Nodes" as "textLabelPath1"
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "{$textLabelPath1}" ignoring case ignoring whitespaces
    * I remember text of "Document Frame > #2 of Document Path Nodes" as "textLabelPath2"
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "{$textLabelPath2}" ignoring case ignoring whitespaces
    * I remember text of "Document Frame > #3 of Document Path Nodes" as "textLabelPath3"
    * Text of "Contents Tab > #1 of Expanded Second Child Node > Path Header > Label" should contain "{$textLabelPath3}" ignoring case ignoring whitespaces
    * I remember text of "Document Frame > #4 of Document Path Nodes" as "textLabelPath4"
    * Text of "Contents Tab > #1 of Expanded Third Child Node > Path Header > Label" should contain "{$textLabelPath4}" ignoring case ignoring whitespaces
    * "Document Frame > #5 of Document Path Nodes" should not be visible

    Examples:
      | doc                                         |
      | us-law-89ec5e2e5fe14070b99f201e4637c286-v1  |
      | us-regs-d60533e9e1edc0c73bbc1c90b32ec30f-v1 |
      | or-law-e1d4392a1e6bc46348b332c58dafe14c-v1  |
      | de-regs-d7e505220d50f3444f9545d0cfc6e499-v1 |

  @CU-39781 @CU-41807
  @local
  Scenario Outline: Check that ToC scrolled to selected from document path node and it's displayed at the top of ToC
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents" should be visible
    #Open first document
    * I click "#1 of Search Result Items > Link"
    #Verify that clicking on document path elements returns appropriate ToC node in focus
    * "Contents Tab" should be visible
    * "Document Frame > Document Path" should be visible
    * I scroll "Contents Tab > Content" element down "1080" pixels
    * I remember number of "Contents Tab > Active Path Nodes > Collapse Button" as "numOfnodesToc"
    * I remember random integer below "{$numOfnodesToc}" as "linkToClick"
    * I click "Document Frame > #{$linkToClick} of Document Path Nodes"
    * "Contents Tab > Selected Link" should be visible

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 |

  @CU-41475 @CU-41797
  Scenario Outline: Footnotes box is displayed for Laws&Regs documents
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Footnote Body Anchors" should be visible
    * I remember number of "Document Frame > Footnote Body Anchors" as "anchors"
    # Scroll To the bottom
    * I scroll to the bottom
    # Verify that Footnotes box is collapsed
    * "Document Frame > Footnotes Header" should be visible
    * "Document Frame > #1 of Footnote Descriptions" should not be visible
    # Expand Footnotes box (click on header)
    * I click "Document Frame > Footnotes Header"
    * I scroll to the bottom
    # Verify that Footnotes box was expanded and Notes Refs and Descriptions are visible
    * "Document Frame > #1 of Footnote Descriptions" should be visible
    * I remember number of "Document Frame > Footnote Refs" as "refs"
    * I remember number of "Document Frame > Footnote Descriptions" as "descriptions"
    * "{$refs}" number should be equal to "{$anchors}"
    * "{$descriptions}" number should be equal to "{$anchors}"

    Examples:
      | doc                                        |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 |


  @CU-41476 @CU-41946
  Scenario Outline: Left Footnotes Panel is displayed for Laws&Regs documents
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Footnote Body Anchors" should be visible
    * I remember number of "Document Frame > Footnote Body Anchors" as "anchors"
    # Verify that Footnotes button is visible to the left from ToC panel
    * "Tab Triggers > Footnotes" should be visible
    # Click Footnotes button to the left from ToC panel
    * I click "Tab Triggers > Footnotes"
    # Verify that Left Footnotes Panel is visible and Notes refs and descriptions are displayed
    * "Footnotes Tab" should be visible
    * I remember number of "Footnotes Tab Refs" as "refs"
    * I remember number of "Footnotes Tab Descriptions" as "descriptions"
    * "{$refs}" number should be equal to "{$anchors}"
    * "{$descriptions}" number should be equal to "{$anchors}"

    Examples:
      | doc                                        |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 |


  @CU-41477 @CU-41947
  Scenario Outline: Left Footnotes Panel is opened when click on Note Ref in Laws&Regs documents
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Footnote Body Anchors" should be visible
    * I remember number of "Document Frame > Footnote Body Anchors" as "anchors"
    # Click on any Note anchor displayed in the document body
    * I click "Document Frame > #{$randomInt(1, $anchors)} of Footnote Body Anchors"
    # Verify that Left Footnotes Panel is visible and Notes refs and descriptions are displayed
    * "Footnotes Tab" should be visible
    * I remember number of "Footnotes Tab Refs" as "refs"
    * I remember number of "Footnotes Tab Descriptions" as "descriptions"
    * "{$refs}" number should be equal to "{$anchors}"
    * "{$descriptions}" number should be equal to "{$anchors}"

    Examples:
      | doc                                        |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 |


  @CU-40842 @CU-41949
  Scenario Outline: Searches performed from L&R dashboard are displayed in session navigator, have appropriate format & can be opened
    * I am logged in
    # Perform a search from L&R
    * I perform search of "<searchTerm>" on Laws & Regulations
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Go to another than current search page
    * I click "Header > Laws And Regulations Button"
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    # Check the presence & order of previous search
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: <searchTerm>" ignoring case
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "{$resultsNumber} RESULTS"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"

    Examples:
      | searchTerm |
      | milk       |


  @CU-40843 @CU-41950
  Scenario Outline: Searches performed from L&R dashboard are displayed in history, have appropriate format & can be opened
    * I am logged in
    # Perform a search from L&R
    * I perform search of "<searchTerm>" on Laws & Regulations
    * "Results Toolbar > Hit Count" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Go to another than current search page
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check>" should contain "SEARCH: <searchTerm>" ignoring case
    # Open 1st item from history
    * I click "<Check>"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"

    Examples:
      | searchTerm | Click                        | Check                                         |
      | milk       | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | goat       | History Box > See All Button | History Popup > #1 of Items > Link            |
      | car        | Header > Home                | History Box > #1 of Links                     |


  @CU-40844 @CU-41951
  Scenario Outline: Docs opened from L&R dashboard Code boxes are displayed in session navigator, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * "#<Box> of Code Boxes" should be visible
    # Open doc from USC/CFR Code Box
    * I click "#<Box> of Code Boxes > #{$randomInt(1, 7)} of Item Links"
    * "Document Frame > Document Content" should be visible
    # Click Show metadata
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should be visible
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID" for L&R
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #LAWS & REGULATIONS in Resourses List Items > Expand"
    * "Session Navigator > #LAWS & REGULATIONS in Resourses List Items > Events Panel > #1 of Event" should be visible
    # Remember the title of the doc in session navigator
    * I remember text of "Session Navigator > #LAWS & REGULATIONS in Resourses List Items > Events Panel > #1 of Event > Title" as "title"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #LAWS & REGULATIONS in Resourses List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I wait 3 seconds
    * I scroll to the bottom
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should be visible
    * "Metadata Loading Indicator" should not be visible
    # Compare docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search of previously opened doc
    * I perform search of "{$docID}"
    # Compare search title of the doc with title in session navigator
    * Text of "#1 of Documents > Document Title" should be "{$title}" ignoring case

    Examples:
      | Box |
      | 1   |
      | 2   |

  @CU-40845 @CU-41952
  Scenario Outline: Docs opened from L&R dashboard State boxes are displayed in session navigator, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Click SS/SR tab
    * I scroll to the bottom
    * I click "State Box > #<Tab> of Tab Buttons"
    * I remember number of "State Box > Items" as "LinksNumber"
    # Open doc from SS/SR Box
    * I click "State Box > #{$randomInt(1, $LinksNumber)} of Item Links"
    * "Document Frame > Document Content" should be visible
    * "Document Loading Indicator" should not be visible
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should be visible
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID" for L&R
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    # Remember the title of the doc in session navigator
    * I remember text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" as "title"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * "Document Frame > Document Content" should be visible
    * "Document Loading Indicator" should not be visible
    * I scroll to the bottom
    * I wait 5 seconds
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should be visible
    * "Metadata Loading Indicator" should not be visible
    # Compare docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search of previously opened doc
    * I perform search of "{$docID}"
    # Compare search title of the doc with title in session navigator
    * Text of "#1 of Documents > Document Title" should be "{$title}" ignoring case

    Examples:
      | Tab |
      | 1   |
      | 2   |

  @CU-40846 @CU-41953
  Scenario Outline: Docs opened from L&R dashboard Code boxes are displayed in history, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Open doc from USC/CFR Code Box
    * I click "#<Box> of Code Boxes > #{$randomInt(1, 7)} of Item Links"
    * "Document Frame > Document Content" should be visible
    * I wait until "Loading Indicator" is gone
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID" for L&R
    # Go to another than current doc page
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check>" should be visible
    # Remember the title of the doc in history
    * I remember "title" attribute of "<Check>" as "title"
    # Open 1st item from history
    * I click "<Check>"
    * "Document Frame > Document Content" should be visible
    * I wait until "Loading Indicator" is gone
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Compare docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search of previously opened doc
    * I perform search of "{$docID}"
    # Compare search title of the doc with title in history
    * Text of "#1 of Documents > Document Title" should be "{$title}" ignoring case

    Examples:
      | Box | searchTerm                                 | Click                        | Check                                         |
      | 1   | co-law-83975176251ba59745071fee6e7af812-v1 | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 1   | happiness                                  | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 1   | throne                                     | Header > Home                | History Box > #1 of Links                     |
      | 2   | co-law-83975176251ba59745071fee6e7af812-v1 | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 2   | happiness                                  | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 2   | throne                                     | Header > Home                | History Box > #1 of Links                     |

  @CU-40847 @CU-41954
  Scenario Outline: Docs opened from L&R dashboard State boxes are displayed in history, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Click SS/SR tab
    * I scroll to the bottom
    * I click "State Box > #<Tab> of Tab Buttons"
    * I remember number of "State Box > Items" as "LinksNumber"
    # Open doc from SS/SR Box
    * I click "State Box > #{$randomInt(1, $LinksNumber)} of Item Links"
    * "Document Frame > Document Content" should be visible
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID" for L&R
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Click history at the header
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    # Remember the title of the doc in history
    * I remember "title" attribute of "Header > History Dropdown > #1 of Items Title" as "title"
    # Open history popup
    * I click "Header > History Dropdown > See All"
    * "History Popup > #1 of Items" should be visible
    # Compare title with title in history dropdown
    * Text of "History Popup > #1 of Items > Link" should contain "{$title}" ignoring case
    # Open 1st item from history
    * I click "History Popup > #1 of Items > Link"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    # Click Show metadata
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Compare docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search of previously opened doc
    * I perform search of "{$docID}"
    # Compare search title of the doc with title in history
    * Text of "#1 of Documents > Document Title" should be "{$title}" ignoring case

    Examples:
      | Tab |
      | 1   |
      | 2   |

@critical_path
@mvl
Feature: Contents Panel 2

  @CU-33731
  Scenario Outline: Verify 'Contents' panel is expanded in contents tree and after click on 'Previous Document' button
    * I am logged in
    # Open doc from examples
    * I open "<docId>" document
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text1"
    # Click on 'Previous Document' button
    * "Toolbar > Previous Document Button" should be clickable
    * I click "Toolbar > Previous Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text2"
    # Verify that the titles of the selected nodes do not match
    * "{$text1}" text should not contain "{$text2}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | docId            |
      | 09013e2c844d883c |

  @CU-33732
  @local
  Scenario Outline: Verify 'Contents' panel is expanded in contents tree and after click on 'Next Search Result' button
    * I am logged in
    # Perform search of docs from examples
    * I perform search of "<docIds>"
    * "#1 of Documents" should be visible
    # Click on the first doc in SRL
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text1"
    # Verify that the first expanded parent node is highlighted with grey (#d6d5d5)
    * Background color of "Contents Tab > #1 of Expanded Parent Node > Path Header" should be "#d6d5d5"
    # Click on 'Next Results' button
    * I click "Toolbar > Next Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Path Header" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text2"
    # Verify that the first expanded parent node is highlighted with grey (#d6d5d5)
    * Background color of "Contents Tab > #1 of Expanded Parent Node > Path Header" should be "#d6d5d5"
    # Verify that the titles of the selected nodes do not match
    * "{$text1}" text should not contain "{$text2}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | docIds                               |
      | 09013e2c844d883c OR 09013e2c825fedb6 |

  @CU-33733
  @local
  Scenario Outline: Verify 'Contents' panel is expanded in contents tree and highlight is updated after click on 'Previous Search Result' button
    * I am logged in
    # Perform search of docs from examples
    * I perform search of "<docIds>"
    * "#2 of Documents" should be visible
    # Click on the second doc in SRL
    * I click "#2 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text1"
    # Verify that the first expanded parent node is highlighted with grey (#d6d5d5)
    * Background color of "Contents Tab > #1 of Expanded Parent Node > Path Header" should be "#d6d5d5"
    # Click on 'Previous Results' button
    * I click "Toolbar > Previous Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Path Header" should be visible
    # Remember the title of the selected node
    * I remember text of "Contents Tab > Selected Link" as "text2"
    # Verify that the first expanded parent node is highlighted with grey (#d6d5d5)
    * Background color of "Contents Tab > #1 of Expanded Parent Node > Path Header" should be "#d6d5d5"
    # Verify that the titles of the selected nodes do not match
    * "{$text1}" text should not contain "{$text2}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | docIds                               |
      | 09013e2c844d883c OR 09013e2c825fedb6 |

  @CU-33734
  Scenario: Verify 'Contents' panel is expanded only to the document title after expanding nodes and click on 'Next Document' button
    * I am logged in
    # Open '09013e2c844d88ed' doc
    * I open "09013e2c844d88ed" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Click on 'Next Document' button
    * I click "Toolbar > Next Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I wait until text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" is "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded parent node is 'FAMILY AND MEDICAL LEAVE ACT OF 1993'
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded child node is 'TITLE I—GENERAL REQUIREMENTS FOR LEAVE'
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "TITLE I—GENERAL REQUIREMENTS FOR LEAVE"
    # Verify that the selected node is 'Sec. 102. [29 U.S.C. 2612]. Leave Requirement'
    * Text of "Contents Tab > Selected Link" should contain "Sec. 102. [29 U.S.C. 2612]. Leave Requirement"
    # Verify that only one parent node is expanded
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "1"

  @CU-33735
  Scenario: Verify 'Contents' panel is expanded only to the document title after expanding nodes and click on 'Previous Document' button
    * I am logged in
    # Open '09013e2c844d88ee' doc
    * I open "09013e2c844d88ee" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Click on 'Previous Document' button
    * I click "Toolbar > Previous Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I wait until text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" is "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded parent node is 'FAMILY AND MEDICAL LEAVE ACT OF 1993'
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded child node is 'TITLE I—GENERAL REQUIREMENTS FOR LEAVE'
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "TITLE I—GENERAL REQUIREMENTS FOR LEAVE"
    # Verify that the selected node is 'Sec. 101. [29 U.S.C. 2611]. Definitions'
    * Text of "Contents Tab > Selected Link" should contain "Sec. 101. [29 U.S.C. 2611]. Definitions"
    # Verify that only one parent node is expanded
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "1"

  @CU-33736
  @local
  Scenario: Verify 'Contents' panel is expanded only to the document title after expanding nodes and click on 'Next Search Result' button
    * I am logged in
    # Perform search for '09013e2c844d88ed OR 09013e2c844d88ee'
    * I perform search of "09013e2c844d88ed OR 09013e2c844d88ee"
    * "#1 of Documents" should be visible
    # Click on the first doc in SRL
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Click on 'Next Results' button
    * I click "Toolbar > Next Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I wait until text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" is "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded parent node is 'FAMILY AND MEDICAL LEAVE ACT OF 1993'
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded child node is 'TITLE I—GENERAL REQUIREMENTS FOR LEAVE'
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "TITLE I—GENERAL REQUIREMENTS FOR LEAVE"
    # Verify that the selected node is 'Sec. 102. [29 U.S.C. 2612]. Leave Requirement'
    * Text of "Contents Tab > Selected Link" should contain "Sec. 102. [29 U.S.C. 2612]. Leave Requirement"
    # Verify that only one parent node is expanded
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "1"

  @CU-33737
  @local
  Scenario: Verify 'Contents' panel is expanded only to the document title after expanding nodes and click on 'Previous Search Result' button
    * I am logged in
    # Perform search for '09013e2c844d88ed OR 09013e2c844d88ee'
    * I perform search of "09013e2c844d88ed OR 09013e2c844d88ee"
    * "#2 of Documents" should be visible
    # Click on the second doc in SRL
    * I click "#2 of Documents"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    # Click on 'Previous Results' button
    * I click "Toolbar > Previous Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should be visible
    * I wait until text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" is "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded parent node is 'FAMILY AND MEDICAL LEAVE ACT OF 1993'
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "FAMILY AND MEDICAL LEAVE ACT OF 1993"
    # Verify that the first expanded child node is 'TITLE I—GENERAL REQUIREMENTS FOR LEAVE'
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "TITLE I—GENERAL REQUIREMENTS FOR LEAVE"
    # Verify that the selected node is 'Sec. 101. [29 U.S.C. 2611]. Definitions'
    * Text of "Contents Tab > Selected Link" should contain "Sec. 101. [29 U.S.C. 2611]. Definitions"
    # Verify that only one parent node is expanded
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "1"

  @CU-31768
  Scenario: Verify that more documents become visible in 'Contents' panel after user clicks on 'See More' button
    * I am logged in
    # Perform search for 'ust0212d0593c7cbf1000a16dd8d385ad169401' doc
    * I perform search of "ust0212d0593c7cbf1000a16dd8d385ad169401"
    * "#1 of Documents" should be visible
    # Click on the first doc in SRL
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Document Links" should be visible
    # Verify that the number of links in TOC is equal to 100
    * Count of "Contents Tab > Document Links" should be equal to "100"
    * I scroll "Contents Tab" element down "15000" pixels
    * "Contents Tab > See More" should be visible
    # Click on See More button at the bottom of the TOC
    * I click "Contents Tab > See More"
    * I wait 3 seconds
    # Verify that the number of links in TOC is more than 100
    * Count of "Contents Tab > Document Links" should be more than "100"

  @CU-37202
  Scenario Outline: Verify that when user opens a document from 'Notes & Highlights' overlay "Contents" panel is displayed expanded to document's level
    * I am logged in
    # Open doc from examples
    * I open "<docId>" document
    # Remember the title of the doc
    * I remember text of "Document Frame > Title" as "docTitle"
    * "Document Frame > Document Content" should be visible
    # Highlight the part of text in the third paragraph
    * I trigger inline menu on "Document Frame > #3 of Document Paragraphs"
    # Remember the selected text
    * I remember selected text as "selectedText"
    * "#1 of Inline Widget Items" should be visible
    # Click on Highlight in the menu that appeared
    * I click "#HIGHLIGHT in Inline Widget Items"
    * "#1 of Notes Highlights" should be visible
    # Remember the text of the highlight
    * I remember text of "#1 of Notes Highlights" as "noteHighlight"
    # Go to Home page
    * I click "Header > Home"
    # Click on Notes&Highlights in Saved Items drop-down in Header
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Notes & Highlights in Items"
    * "Notes And Highlights Popup" should be visible
    * "Notes And Highlights Popup > #1 of Item Titles" should be visible
    # Click on the first item in Notes&Highlights overlay
    * I click "Notes And Highlights Popup > #1 of Item Titles"
    * "Document Frame > Title" should be visible
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that DocID in metadata is equal to docID from examples
    * I remember value of "docID" metadata parameter as "metadataID"
    * "{$metadataID}" text should be equal to "<docId>" text ignoring case
    Examples:
      | docId                              |
      | 631d32367c2710008cfb90b11c18c90203 |

  @CU-37203
  Scenario Outline: Verify that when user opens a document from SRL in New Tab, 'Contents' tab is displayed expanded
    * I am logged in
    # Perform search for '631d32367c2710008cfb90b11c18c90203'
    * I perform search of "<docId>"
    # Select 'Open In New Window' checkbox
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Click on the first doc in SRL
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    # Verify that doc is opened in a new tab
    * I switch to last tab
    * "Document Frame > Title" should be visible
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "metadataID"
    # Verify that docID in metadata is equal to docId from examples
    * "{$metadataID}" text should be equal to "<docId>" text ignoring case

    Examples:
      | docId                              |
      | 631d32367c2710008cfb90b11c18c90203 |

  @CU-37204
  Scenario: Verify that when user opens a document and clicks 'New Window' icon, 'Contents' tab is displayed expanded
    * I am logged in
    * "Header > Titles Button" should be visible
    # Click on Titles in Header
    * I click "Header > Titles Button"
    * "Titles Popup > Search Input" should be visible
    # Perform search for 'Medical Devices: Laws and Regulations'
    * I type "Medical Devices: Laws and Regulations" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    # Click on the first link in SRL
    * I click "Titles Popup > #Medical Devices: Laws and Regulations in Publications Links"
    * I wait until "Loading Indicator" is gone
    * I wait until "Loading Indicator" is gone
    * "Toolbar > View In New Window" should be visible
    # Click on 'View In New Window' button
    * I click "Toolbar > View In New Window"
    # Verify that the doc is opened in a new tab
    * I switch to last tab
    * "Document Frame > Title" should be visible
    # Verify that the selected node and the first expanded parent node are visible
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

  @CU-37205
  Scenario Outline: Verify 'Contents' panel is expanded when user reaches the document by URL
    * I am logged in
    # Open '631d32367c2710008cfb90b11c18c90203' doc
    * I open "<docId>" document
    * "Document Frame > Title" should be visible
    # Verify that the selected node and the first expanded parent node are visible
    * "Contents Tab > Selected Link" should be visible
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "metadataID"
    # Verify that docID in metadata is equal to docId from examples
    * "{$metadataID}" text should be equal to "<docId>" text ignoring case
    Examples:
      | docId                              |
      | 631d32367c2710008cfb90b11c18c90203 |



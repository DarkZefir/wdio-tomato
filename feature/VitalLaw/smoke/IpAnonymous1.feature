@smoke
@mvl
@ipa_only
Feature: IP Anonymous

  @CU-37770
  Scenario: Verify UI elements of On Platform Smart Charts Template for IP Anonymous User
    * I am logged in
    * I open base url with "#/topics/browse/st/TaxStateAndLocal"
    * "Tax State Topics List > #1 of Box Titles" should be visible
    * I click "Tax State Topics List > #Property Factor in Box Titles"
    * "Tax Topic Page > Smart Charts Widget" should be visible
    * I click "Tax Topic Page > Smart Charts Widget > #Property Factor in Box Links"
    * Text of "Session Navigator > Session Navigator Tab" should be "TAX - STATE & LOCAL"
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within Tax - State & Local"
    * "Search Bar > Advanced Search" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Help Icon" should be visible
    * "Search Bar > Citation Search Builder Button" should be visible
    * "Utility Bar" should be visible
    * "Utility Bar > Config Button" should be visible
    * "Utility Bar > Expand Icon" should be visible
    * "Utility Bar > Collapse Icon" should be visible
    * "Utility Bar > Rows Icon" should be visible
    * "Utility Bar > Columns Icon" should be visible
    * "Utility Bar > Calendar Icon" should be visible
    * "Utility Bar > Favorites Button" should not be visible
    * "Utility Bar > Print Icon" should be visible
    * "Utility Bar > Download Icon" should be visible
    * Count of "Results Nodes" should be more than "1"
    * "#1 of Results Nodes > #1 of Headers" should be visible
    * Count of "#1 of Results Nodes > Headers" should be equal to "5"
    * I remember text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" as "leaftitle"
    * Text of "#1 of Results Nodes > #1 of Headers" should be "JURISDICTION"
    * Text of "#1 of Results Nodes > #2 of Headers" should be "{$leaftitle}" ignoring case
    * Text of "#1 of Results Nodes > #3 of Headers" should be "COMMENT"
    * Text of "#1 of Results Nodes > #4 of Headers" should be "CITATION"
    * Text of "#1 of Results Nodes > #5 of Headers" should be "CCH EXPLANATION"
    * I remember number of "Results Nodes" as "resultsNodesCount"
    * I remember number of "Results Nodes > Info Icon" as "infoIconCount"
    * "{$resultsNodesCount}" number should be equal to "{$infoIconCount}"

  @CU-37774
  Scenario: Verify that boxes 'Favorites Box' is not displayed on 'All Content' page for IP Anonymous user
    * I am logged in
    * I open base url with "#/home/AllContent"
    * "Favorites Box" should not be visible

  @CU-37775
  Scenario: Verify that 'My History Box' is not displayed on All Content page for IP Anonymous user
    * I am logged in
    * I open base url with "#/home/AllContent"
    * "History Box" should not be visible

  @CU-37776
  Scenario: Verify UI of 'Practical Content' Dashboard for IP Anonymous User
    * I am logged in
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    #Go to Practical Content page
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "Practice Areas Filter" should be visible
    #Check that Practice Areas Filter is displayed
    * Text of "Practice Areas Filter > Label" should be "All Practice Areas"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    #Check that all practice areas excepts synthetic are displayed in Practice Areas Filter
    * Count of "Practice Areas Filter > Options" should be equal to "{$subtract($PAs, 1)}"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I remember number of "Content Boxes" as "boxes"
    * "Practical Content Filter" should be visible
    * Text of "Practical Content Filter > Label" should be "All Practical Content"
    #Check that Practical Content filter has all practical content types
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Options" should be equal to "{$add($boxes, 1)}"
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should not be visible
    #Check that search bar is visible and has appropriate placeholder text, search button and thesaurus checkbox
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within Practical Content"
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Thesaurus Checkbox" should be visible
    #Check that My Practical Content Favorites Box is not displayed
    * "My Practical Content Favorites Box" should not be visible
    #Check that footer is displayed as well as Copyright text, Terms of use and Privacy&Cookies links
    * "Footer" should be visible
    * "Footer > Copyright" should be visible
    * Text of "Footer > Copyright" should be "© 2022 CCH Incorporated and its affiliates and licensors. All rights reserved."
    * "Footer > Terms Of Use" should be visible
    * "Footer > Privacy And Cookies" should be visible

  @CU-37777
  Scenario: Verify Inline Widget for IP Anonymous user
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "merger"
    * I click "#2 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I trigger inline menu on "Document Frame > #2 of Document Paragraphs"
    * "Inline Widget" should be visible
    * Text in collection of "Inline Widget Items" should not contain "ADD NOTE"
    * Text in collection of "Inline Widget Items" should not contain "HIGHLIGHT"
    * Text in collection of "Inline Widget Items" should contain "PRINT"
    * Text in collection of "Inline Widget Items" should contain "COPY"

  @CU-37826
  Scenario: Verify UI of 'Email' overlay opened on SRL for IP Anonymous user
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "case"
    * "Results Toolbar > Toolbar Buttons" should be visible
    * "Results Toolbar > Toolbar Buttons > Email Button" should be visible
    * I click "#1 of Documents > Checkbox"
    * I click "Results Toolbar > Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should be ""
    * "Email Popup > Email Subject Label" should be visible
    * "Email Popup > #1 of Error Messages" should be visible
    * Text of "Email Popup > #1 of Error Messages" should be "The email address is empty."
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "Anonymous User  has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Include Attachment Label" should be visible
    * Text of "Email Popup > Include Attachment Label" should be "Include Attachment"
    * "Email Popup > Include Dropdown" should be visible
    * "Email Popup > Include Dropdown > Label" should be visible
    * Text of "Email Popup > Include Dropdown > Label" should be "COMPLETE DOCUMENTS"
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should not be visible
    * "Email Popup > Include Notes And Highlights Label" should not be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should not be visible
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should not be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-37828
  Scenario: Verify UI of 'Email' overlay opened from document's Read View reached from dashboard for IP Anonymous user
    * I am logged in
    * I open "6a7976007db41000ac84000d3a8daaf402" document
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should be ""
    * "Email Popup > Email Subject Label" should be visible
    * "Email Popup > #1 of Error Messages" should be visible
    * Text of "Email Popup > #1 of Error Messages" should be "The email address is empty."
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "Anonymous User  has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Include Attachment Label" should not be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should not be visible
    * "Email Popup > Include Notes And Highlights Label" should not be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should not be visible
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * "Email Popup > Email Button" should be visible
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should not be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

  @CU-37831
  Scenario Outline: Verify UI of 'Email' overlay opened on Tax Topic Page for IP Anonymous user
    * I am logged in
    * I open "<id>" topics document
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should be ""
    * "Email Popup > Email Subject Label" should be visible
    * "Email Popup > #1 of Error Messages" should be visible
    * Text of "Email Popup > #1 of Error Messages" should be "The email address is empty."
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "Anonymous User  has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should not be visible
    * "Email Popup > Include Notes And Highlights Label" should not be visible
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should not be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible
    Examples:
      | id                                       |
      | tppc018dcd37347cb21000b76190b11c18cbab01 |

  @CU-37832
  Scenario: Verify UI of 'Email' overlay opened from document's Read View opened from Search Results List for IP Anonymous user
    * I am logged in
    * I perform search of "9b82e9747c9d1000af1fd8d385ad1694030"
    * I click "#1 of Documents"
    * "Toolbar Buttons" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * I click "Toolbar Buttons > Email Button"
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should be ""
    * "Email Popup > Email Subject Label" should be visible
    * "Email Popup > #1 of Error Messages" should be visible
    * Text of "Email Popup > #1 of Error Messages" should be "The email address is empty."
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "Anonymous User  has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Include Attachment Label" should not be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should be visible
    * Text of "Email Popup > Options Label" should be "Options"
    * "Email Popup > Include Notes And Highlights Label" should not be visible
    * "Email Popup > Include Notes And Highlights Checkbox" should not be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should not be selected
    * Text of "Email Popup > Include Search Term Highlights Label" should be "Include search term highlights"
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * "Email Popup > Email Button" should be visible
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should not be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

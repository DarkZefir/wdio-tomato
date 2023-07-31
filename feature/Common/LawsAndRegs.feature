@smoke
@mvl @vlcc
@LawsAndRegs
Feature: LawsAndRegs

  @CU-35181 @CU-40583
  Scenario: Verify CSH of 'Laws & Regulations' Dashboard
    * I am logged in
    * I am on "Securities - Federal & International" PA
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Code Boxes" should be visible
    * I get csh data for "Laws & Regulations" and save it as "LR"
    * "Code Boxes" should match "$LR" csh data

  @CU-35184 @CU-41791
  Scenario Outline: Verify that Correct document can be opened from USC and CFR boxes on 'Laws & Regulations'
    * I am logged in
    * I click "Header > Laws And Regulations Button"
    * "#1 of Code Boxes" should be visible
    * I remember number of "<Index> > Items" as "numOfItems"
    * I remember random integer below "{$numOfItems}" as "linkToClick"
    * I remember text of "<Index> > #{$linkToClick} of Items" as "title"
    * I click "<Index> > #{$linkToClick} of Item Links"
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * Text of "Contents Tab > #1 of Expanded Parent Node" should contain "{$title}" ignoring case ignoring whitespaces
    * Text of "DA Title" should be "<DocTitle>"

    Examples:
      | Index            | DocTitle                    |
      | #1 of Code Boxes | United States Code          |
      | #2 of Code Boxes | Code of Federal Regulations |

  @CU-35185 @CU-41792
  Scenario: Verify that User can switch between State Statutes/State Regulations tabs on 'Laws & Regulations'
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * I wait until "Loading Indicator" is gone
    * "State Box > #1 of Tab Buttons" should be visible
    * Text of "State Box > Active Tab Title" should be "State Statutes"
    * I click "State Box > #2 of Tab Buttons"
    * Text of "State Box > Active Tab" should contain "State Regulations"

  @CU-35186 @CU-41793
  Scenario: Verify that Correct document can be opened from State Statutes/State Regulations tabs on 'Laws & Regulations '
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    * I remember number of "State Box > Tab Buttons" as "numOfTabs"
    * I remember random integer below "{$numOfTabs}" as "TabToClick"
    * I remember text of "State Box > #{$TabToClick} of Tab Buttons" as "TabTitle"
    * I click "State Box > #{$TabToClick} of Tab Buttons"
    * Text of "State Box > Active Tab" should contain "{$TabTitle}"
    * I remember number of "State Box > Items" as "numOfItems"
    * I remember random integer below "{$numOfItems}" as "linkToClick"
    * I remember text of "State Box > #{$linkToClick} of Item Links" as "State"
    * I click "State Box > #{$linkToClick} of Item Links"
    * "DA Title" should be visible
    * Text of "DA Title" should contain "{$State}" ignoring case ignoring whitespaces
    * "Search Bar > Document Breadcrumbs" should be visible
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Laws & Regulations > {$TabTitle} > {$State}"

  @CU-42790 @CU-42809
  Scenario: Verify UI of Expanded Topical Canned Search Dropdown  on Laws & Regs
    * I am logged in
    # Go to Laws & Regs
    * I open base url with "#/home/PrimarySource"
    * I verify canned search json info
    * "State Box" should be visible
    # Verify that Curated Search dropdown is not expanded by default
    * "Search Bar > Curated Widget" should not be visible
    # Click on CS dropdown
    * I click "Search Bar > Curated Search Dropdown"
    # Verify that Curated Search widget appeared, has two sections: parent - with topics, and child - empty by default
    * "Search Bar > Curated Widget" should be visible
    * "Search Bar > Curated Widget > #1 of Parent Topics" should be visible
    * Order of "Search Bar > Curated Widget > Parent Topics" should be alphabetical
    * "Search Bar > Curated Widget > #1 of Child Topics" should not be visible
    * "Search Bar > Curated Widget > No Curated Search Icon" should be visible
    * "Search Bar > Curated Widget > No Curated Search Label" should be visible
    * Text of "Search Bar > Curated Widget > No Curated Search Label" should be "Please select a Curated Topic in order to see available content options"
    # Click random parent node
    * I remember number of "Search Bar > Curated Widget > Parent Topics" as "parentNum"
    * I remember random integer below "{$parentNum}" as "parentToClick"
    * I remember text of "Search Bar > Curated Widget > #{$parentToClick} of Parent Topics" as "parentTitle"
    * I click "Search Bar > Curated Widget > #{$parentToClick} of Parent Topics"
    # Verify that child topics appeared in the child sections and child section title equals to selected parent topic
    * "Search Bar > Curated Widget > Child Section Header" should be visible
    * Text of "Search Bar > Curated Widget > Child Section Header" should be "{$parentTitle}"
    * Text of "Search Bar > Curated Search Dropdown Placeholder" should be "{$parentTitle}"
    * "Search Bar > Curated Widget > #1 of Child Topics" should be visible
    * Order of "Search Bar > Curated Widget > Child Topics" should be alphabetical

  @CU-42791 @CU-42810
  Scenario: Topical Canned Search can be run from Laws & Regs
    * I am logged in
    # Go to L&R
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    # Expand Topical Canned Search dropdiwn
    * I click "Search Bar > Curated Search Dropdown"
    * "Search Bar > Curated Widget" should be visible
    # Click random parent topic link
    * I remember number of "Search Bar > Curated Widget > Parent Topics" as "parentNum"
    * I remember random integer below "{$parentNum}" as "parentToClick"
    * I click "Search Bar > Curated Widget > #{$parentToClick} of Parent Topics"
    * "Search Bar > Curated Widget > #1 of Child Topics" should be visible
    # Click random child link
    * I remember number of "Search Bar > Curated Widget > Child Topics" as "childNum"
    * I remember random integer below "{$childNum}" as "childToClick"
    * I remember text of "Search Bar > Curated Widget > #{$childToClick} of Child Topics" as "cannedTitle"
    * I click "Search Bar > Curated Widget > #{$childToClick} of Child Topics"
    # Verify that search was run and SRL with results is displayed for particular search
    * "#1 of Documents" should be visible
    * I get canned search value for "{$cannedTitle}" and remember as "searchTerm"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$searchTerm}" ignoring case
    * "Results Toolbar > Auto Correction Header" should not be visible

  @CU-42792 @CU-42811
  Scenario Outline: Topical Canned Search can be rerun from History/Session Navigator
    * I am logged in
    # Go to L&R
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    # Expand Topical Canned Search dropdown
    * I click "Search Bar > Curated Search Dropdown"
    * "Search Bar > Curated Widget" should be visible
    # Click random parent topic link
    * I remember number of "Search Bar > Curated Widget > Parent Topics" as "parentNum"
    * I remember random integer below "{$parentNum}" as "parentToClick"
    * I click "Search Bar > Curated Widget > #{$parentToClick} of Parent Topics"
    * "Search Bar > Curated Widget > #1 of Child Topics" should be visible
    # Click random child link
    * I remember number of "Search Bar > Curated Widget > Child Topics" as "childNum"
    * I remember random integer below "{$childNum}" as "childToClick"
    * I remember text of "Search Bar > Curated Widget > #{$childToClick} of Child Topics" as "cannedTitle"
    * I click "Search Bar > Curated Widget > #{$childToClick} of Child Topics"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "result"
    # Go to All Content and run last search displayed in History/Sesion Navigator
    * I am on "ALL CONTENT" PA
    * I click "<firstClick>"
    * I click "<secondClick>"
    * "<waitFor>" should be visible
    * "<lastClick>" should be clickable
    * I click "<lastClick>"
    * I wait until "Loading Indicator" is gone
    # Check that search was run, the same number of results is displayed
    * "Results Toolbar" should be visible
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$result}"

    Examples:
      | firstClick                                | secondClick                                              | waitFor                                                                     | lastClick                                                                   |
      | Session Navigator > Session Navigator Tab | Session Navigator  > #1 of Resourses List Items > Expand | Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event | Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event |
      | Header > History Dropdown                 | Header > History Dropdown > See All                      | History Popup > #1 of Items                                                 | History Popup > #1 of Items                                                 |


  @CU-35603 @CU-41798
  Scenario: Verify that 'Law & Regulations' tab is available for user with subscription
    * I am logged in
    * I click "Header > Laws And Regulations  Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Code Boxes" should be visible
    * "#2 of Code Boxes" should be visible
    * "State Box > #1 of Tab Buttons" should be visible
    * "State Box > #2 of Tab Buttons" should be visible

  @CU-35656 @CU-41800
  Scenario: Search panel UI verification on 'Laws & Regulations' - field, button, filters dropdowns, curated search dropdown, advanced search link, help icon
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "Search Bar > Search Label" should be visible
    * Text of "Search Bar > Search Label" should be "Search for"
    * "Search Bar > Jurisdiction Dropdown" should be visible
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "Jurisdiction"
    * "Search Bar > Jurisdiction Dropdown > Arrow Down" should be visible
    * "Search Bar > Document Type Dropdown" should be visible
    * Text of "Search Bar > Document Type Dropdown > Placeholder" should be "Document Type"
    * "Search Bar > Document Type Dropdown > Arrow Down" should be visible
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Enter search term, section number, or citation"
    * "Search Bar > Help Icon" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Curated Search Label" should be visible
    * Text of "Search Bar > Curated Search Label" should be "Explore Curated Topic Search"
    * "Search Bar > Curated Search Dropdown Placeholder" should be visible
    * Text of "Search Bar > Curated Search Dropdown Placeholder" should be "Select a Curated Topic"
    * "Search Bar > Curated Search Dropdown" should be visible
    * "Search Bar > Advanced Search" should be visible

  @CU-35657 @CU-41801
  Scenario: Verify that Search works correctly from 'Laws & Regulations'
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "Search Bar > Search Input" should be visible
    * I perform search of "procedures"
    * Count of "Search Result Items" should be equal to "25"
    * Count of "Search Result Items > Link" should be equal to "25"

  @CU-35658 @CU-41802
  Scenario: Pre-search filters popup UI verification 'Laws & Regulations'
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * Text of "Advanced Search Popup > Search Title" should be "Laws & Regulations" ignoring case
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * Count of "Advanced Search Popup > Presearch Filters" should be equal to "5"
    * Text in collection of "Advanced Search Popup > Presearch Filters" should contain "SELECT FILTERS"
    * Text in collection of "Advanced Search Popup > Presearch Filters" should contain "SELECT UNITED STATES CODE CONTENT"
    * Text in collection of "Advanced Search Popup > Presearch Filters" should contain "SELECT CODE OF FEDERAL REGULATIONS CONTENT"
    * Text in collection of "Advanced Search Popup > Presearch Filters" should contain "SELECT STATE STATUTES CONTENT"
    * Text in collection of "Advanced Search Popup > Presearch Filters" should contain "SELECT STATE REGULATIONS CONTENT"
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > Title"
    * "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > #1 of Presearch Filter Titles" should be visible
    * I should see the following lines in "Advanced Search Popup > Presearch Filters > Presearch Filter Titles":
      | Document Type |
      | Jurisdiction  |
    * I click "Advanced Search Popup > X Close Button"
    * "Advanced Search Popup" should not be visible

  @CU-39778 @CU-41804
  Scenario Outline: Document path is displayed for State Statutes and State Regulations documents on Laws&Regulations page
    * I am logged in
    #Open any document from State boxes on Laws&Regs
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * I click "State Box > #<Index> of Tab Buttons"
    * I remember number of "State Box > Items" as "numOfItems"
    * I click "State Box > #{$randomInt(1, $numOfItems)} of Item Links"
    #Verify that document path is displayed
    * "Document Frame > Document Content" should be visible
    * "Document Frame > Document Path" should be visible

    Examples:
      | Index |
      | 1     |
      | 2     |

  @CU-39779 @CU-41805
  Scenario Outline: Document path is displayed for USC and CFR documents on Laws&Regulations page
    * I am logged in
    #Open any document from Federal boxes on Laws&Regs
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * "#<Index> of Code Boxes" should be visible
    * I remember number of "#<Index> of Code Boxes > Items" as "numOfItems"
    * I click "#<Index> of Code Boxes > #{$randomInt(1, $numOfItems)} of Item Links"
    #Verify that document path is displayed
    * "Document Frame > Document Content" should be visible
    * "Document Frame > Document Path" should be visible

    Examples:
      | Index |
      | 1     |
      | 2     |

  @CU-42746 @CU-42747
  Scenario: L&R dashboard jurisdiction filter dropdown UI verification
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Check that dropdown had arrow pointed down
    * "Search Bar > Jurisdiction Dropdown > Arrow Down" should be visible
    * "Search Bar > Jurisdiction Dropdown > Arrow Up" should not be visible
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * "Search Bar > Jurisdiction Dropdown > #1 of Items" should be visible
    # Check that dropdown had arrow pointed up
    * "Search Bar > Jurisdiction Dropdown > Arrow Down" should not be visible
    * "Search Bar > Jurisdiction Dropdown > Arrow Up" should be visible
    # Verify items number (52)
    * Count of "Search Bar > Jurisdiction Dropdown > Item Checkboxes" should be equal to "52"
    # Verify items values
    * "Search Bar > Jurisdiction Dropdown > Items" should be displayed for all states starting with Federal

  @CU-42748 @CU-42749
  Scenario: L&R dashboard document type filter dropdown UI verification
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Check that dropdown had arrow pointed down
    * "Search Bar > Document Type Dropdown > Arrow Down" should be visible
    * "Search Bar > Document Type Dropdown > Arrow Up" should not be visible
    # Click Document Type filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * "Search Bar > Document Type Dropdown > #1 of Items" should be visible
    # Check that dropdown had arrow pointed up
    * "Search Bar > Document Type Dropdown > Arrow Down" should not be visible
    * "Search Bar > Document Type Dropdown > Arrow Up" should be visible
    # Verify items number (2)
    * Count of "Search Bar > Document Type Dropdown > Items" should be equal to "2"
    # Verify items values
    * I should see the following lines in "Search Bar > Document Type Dropdown > Items":
      | Statutes    |
      | Regulations |

  @CU-42750 @CU-42751
  Scenario: L&R dashboard search field returns into default state after entering search term and clear it
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Verify that Search field is in default state
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Enter search term, section number, or citation"
    * "Search Bar > Search Button Laws And Regs Check" should not be enabled
    * "Search Bar > Search Delete" should not be visible
    # Check that Curated search dropdown is enabled
    * "Search Bar > Curated Search Dropdown" should be enabled
    # Check that future versions button is enabled
    * "Search Bar > Future Versions Button" should be enabled
    # Type any searh term in search field
    * I type "tax" in "Search Bar > Search Input"
    * I wait 3 seconds
    # Check that state of search field was changed
    * Value in "Search Bar > Search Input" should be "tax"
    * "Search Bar > Search Button Laws And Regs Check" should be enabled
    * "Search Bar > Search Delete" should be visible
    # Check that Curated search dropdown is disabled
    * "Search Bar > Curated Search Dropdown" should not be enabled
    # Check that future versions button is disabled
    * "Search Bar > Future Versions Button" should not be enabled
    # Clear search field
    * I click "Search Bar > Search Delete"
    # Verify that Search field is in default state
    * "Search Bar > Search Input" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Enter search term, section number, or citation"
    * "Search Bar > Search Button Laws And Regs Check" should not be enabled
    * "Search Bar > Search Delete" should not be visible
    # Check that Curated search dropdown is enabled
    * "Search Bar > Curated Search Dropdown" should be enabled
    # Check that future versions button is enabled
    * "Search Bar > Future Versions Button" should be enabled

  @CU-39908 @CU-41808
  @local
  Scenario Outline: Verify that next document from Search Results List is opened after click on 'Next search result' button in Utility bar for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<docId>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Open the second doc from SRL
    * I click "#2 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Remember the node in TOC and title of the doc
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click on browser back button
    * I click browser back button
    * "#1 of Documents" should be visible
    # Open the first doc from SRL
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    * "Toolbar > Next Results Button" should be visible
    # Click on the Next Results button in Results navigation in the toolbar
    * I click "Toolbar > Next Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    # Verify that the current node in TOC and doc title are equal to those which were remembered
    * Text of "Contents Tab > Selected Link" should be "{$selectedLink}"
    * Text of "Contents Tab > Selected Link" should contain "{$selectedLink}" ignoring case ignoring whitespaces
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | docId                                                                                      |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1 OR us-law-30f954589158233af83c14936021c877-v1   |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 OR us-regs-7294133763760f12f9cc1c2a3e462dd3-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1 OR ny-law-50ef2fbb44f0a7b4aec0a32742c06817-v1   |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 OR mi-regs-652e3bcffb56d609bb76714eadbe2a4f-v1 |

  @CU-39909 @CU-41809
  @local
  Scenario Outline: Verify that previous document from Search Results List is opened after click on 'Previous search result' button in Utility bar for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<docId>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Open the first doc from SRL
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Remember the node in TOC and title of the doc
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click on browser back button
    * I click browser back button
    * "#2 of Documents" should be visible
    # Open the second doc from SRL
    * I click "#2 of Documents"
    * "Contents Tab > Selected Link" should be visible
    * "Toolbar > Previous Results Button" should be visible
    # Click on the Previous results button in Results navigation in the toolbar
    * I click "Toolbar > Previous Results Button"
    # And "Loading Indicator" should be visible
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    # Verify that the current node in TOC and doc title are equal to those which were remembered
    * Text of "Contents Tab > Selected Link" should be "{$selectedLink}"
    * Text of "Contents Tab > Selected Link" should contain "{$selectedLink}" ignoring case ignoring whitespaces
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | docId                                                                                      |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1 OR us-law-30f954589158233af83c14936021c877-v1   |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 OR us-regs-7294133763760f12f9cc1c2a3e462dd3-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1 OR ny-law-50ef2fbb44f0a7b4aec0a32742c06817-v1   |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 OR mi-regs-652e3bcffb56d609bb76714eadbe2a4f-v1 |

  @CU-40059 @CU-41810
  Scenario Outline: Verify that document is opened in a new tab clicking on 'Open in New Window' icon in Read View for Laws&Regulations
    * I am logged in
    # Open the doc
    * I open "<doc>" document
    * I wait until "Loading Indicator" is gone
    # Remember the node in TOC and title of the doc
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    * I remember text of "Document Frame > Title" as "docTitle"
    * "Toolbar > View In New Window" should be visible
    # Click on 'Open in New Window' button in the toolbar
    * I click "Toolbar > View In New Window"
    # Verify that doc is opened in a new tab
    * I switch to last tab
    * "Document Frame > Title" should be visible
    * "Contents Tab > Selected Link" should be visible
    # Verify that the current node in TOC and doc title are equal to those which were remembered
    * Text of "Contents Tab > Selected Link" should contain "{$selectedLink}" ignoring case ignoring whitespaces
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 |

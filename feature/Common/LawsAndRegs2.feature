@smoke
@mvl @vlcc
@LawsAndRegs
Feature: LawsAndRegs

  @CU-40060 @CU-41811
  Scenario Outline: Verify that document is opened in a new tab clicking on 'Open in New Window' from SRL for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Select 'Open in New tab'checkbox in the toolbar
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Remember the title of the doc from SRL and number of browser tabs
    * I remember text of "#1 of Documents > Document Title" as "title"
    * I remember number of browser tabs
    # Open the firt doc from SRL
    * I click "#1 of Documents"
    # Verify that new tab is opened
    * I switch to new tab
    * "Document Frame > Title" should be visible
    * I remember text of "Document Frame > Title" as "readTitle"
    # Verify that current doc title is equal to the one which was remembered
    * "readTitle" text should contain "title" text ignoring whitespaces ignoring case

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 |

  @CU-40361 @CU-41831
  Scenario Outline: User can return back to original search via Search Results link on SRL for Laws&Regulations
    * I am logged in
    # Perform search from LawsAndRegs
    * I perform search of "<term1>" on Laws & Regulations
    # Check number of results
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    # Perform search within
    * I perform search of "<term2>"
    # Check that Search Results link is displayed
    * "Search Bar > Search Results" should be visible
    # Check that if user clicks on just Search Results link only First term search results are displayed
    * I click "Search Bar > Search Results"
    * "#1 of Documents" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills" should be "<term1>"
    Examples:
      | term1 | term2 |
      | kiwi  | vine  |

  @CU-40264 @CU-41821
  Scenario Outline: Verify that next document is opened clicking on 'Next Document' button in Contents panel in the toolbar for Laws&Regulations
    * I am logged in
    # Open the document
    * I open "<doc>" document
    * "Contents Tab > Selected Link" should be visible
    # Remember the text of TOC node and doc title
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click on Next Document button in the toolbar
    * I click "Toolbar > Next Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > Selected Link" should be visible
    * "Document Frame > Title" should be visible
    # Remember the text of TOC node and doc title
    * I remember text of "Contents Tab > Selected Link" as "selectedLink1"
    * I remember text of "Document Frame > Title" as "docTitle1"
    * I wait until "Loading Indicator" is gone
    # Verify that the text of TOC node and title of the first doc does not contain text of TOC node and title of the second doc
    * "{$selectedLink}" text should not contain "{$selectedLink1}" text
    * "{$docTitle}" text should not contain "{$docTitle1}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | hi-law-1850067db434a36d07802a2607426f5b-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |

  @CU-40266 @CU-41822
  Scenario Outline: Verify that previous document is opened clicking on 'Previous Document' button in Contents panel in the toolbar for Laws&Regulations
    * I am logged in
    # Open the document
    * I open "<doc>" document
    * "Contents Tab > Selected Link" should be visible
    # Remember the text of TOC node and doc title
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click on Previous Document button in the toolbar
    * I click "Toolbar > Previous Document Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Contents Tab > Selected Link" should be visible
    * "Document Frame > Title" should be visible
    # Remember the text of TOC node and doc title
    * I remember text of "Contents Tab > Selected Link" as "selectedLink1"
    * I remember text of "Document Frame > Title" as "docTitle1"
    * I wait until "Loading Indicator" is gone
    # Verify that the text of TOC node and title of the first doc does not contain text of TOC node and title of the second doc
    * "{$selectedLink}" text should not contain "{$selectedLink1}" text
    * "{$docTitle}" text should not contain "{$docTitle1}" text
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible

    Examples:
      | doc                                         |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | hi-law-1850067db434a36d07802a2607426f5b-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |

  @CU-40362 @CU-41823
  Scenario Outline: User can navigate to particular state of performed search via Search Results button on Laws&Regulations SRL
    * I am logged in
    # Perform search from LawsAndRegs
    * I perform search of "<term1>" on Laws & Regulations
    # Perform search within
    * I perform search of "<term2>"
    # Check that Search Results link is displayed
    * "Search Bar > Search Results" should be visible
    # Perform search within
    * I perform search of "<term3>"
    # Check number of results
    * I remember text of "Results Toolbar > Hit Count" as "hitCount"
    # Check that Search Results link has dropdown now
    * "Search Bar > Search Results Dropdown" should be visible
    * I perform search of "<term4>"
    * I wait until "Loading Indicator" is gone
    # Expand Search Results link dropdown
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #1 of Items" should be visible
    # Click the last item in Search Results dropdown
    * I remember number of "Search Bar > Search Results Dropdown > Items" as "itemsNumber"
    * I click "Search Bar > Search Results Dropdown > #{$itemsNumber} of Items"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I remember number of "Search Bar > Search Pills" as "pillsNumber"
    # Check that last search pill text equals to the 3rd of performed search terms
    * Text of "Search Bar > #{$pillsNumber} of Search Pills" should be "<term3>"
    # Check that correct number of results is displayed
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount}"
    Examples:
      | term1 | term2 | term3    | term4 |
      | kiwi  | vine  | benefits | land  |

  @CU-40364 @CU-41824
  Scenario Outline: User can return back to original search via Search Results link from Read View for Laws&Regulations
    * I am logged in
    #Perform search from LawsAndRegs
    * I perform search of "<term>" on Laws & Regulations
    #Check number of results
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "#1 of Documents"
    * "Document Frame > Title" should be visible
    #Check that if user clicks on just Search Results link (not from dropdown) only First term search results are displayed
    * I click "Search Bar > Search Results"
    * "#1 of Documents" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills" should be "<term>"
    Examples:
      | term   |
      | avatar |

  @CU-40365 @CU-41825
  Scenario Outline: User can navigate to particular state of performed search via Search Results button on Read View for Laws&Regulations
    * I am logged in
    #Perform search from LawsAndRegs
    * I perform search of "<term1>" on Laws & Regulations
    #Perform search within
    * I perform search of "<term2>"
    #Check that Search Results link is displayed
    * "Search Bar > Search Results" should be visible
    #Perform search within
    * I perform search of "<term3>"
    #Check number of results
    * I remember text of "Results Toolbar > Hit Count" as "hitCount"
    * I click "#1 of Documents"
    #Check that Search Results link has dropdown now
    * "Document Frame > Title" should be visible
    * "Search Bar > Search Results Dropdown > Expand Button" should be visible
    #Expand Search Results link dropdown
    * I click "Search Bar > Search Results Dropdown > Expand Button"
    * "Search Bar > Search Results Dropdown > #3 of Items" should be visible
    #Click the last item in Search Results dropdown
    * I remember number of "Search Bar > Search Results Dropdown > Items" as "itemsNumber"
    * I click "Search Bar > Search Results Dropdown > #{$itemsNumber} of Items"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * I remember number of "Search Bar > Search Pills" as "pillsNumber"
    #Check that last search pill text equals to the 3rd of performed search terms
    * Text of "Search Bar > #{$pillsNumber} of Search Pills" should be "<term3>"
    #Check that correct number of results is displayed
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount}"
    Examples:
      | term1 | term2 | term3    |
      | kiwi  | vine  | benefits |

  @CU-40366 @CU-41826
  Scenario Outline: Laws&Regulations Search Results link leads to SRL when user opens another document via Results/Content navigation arrows
    * I am logged in
    #Perform search from LawsAndRegs
    * I perform search of "<term>" on Laws & Regulations
    #Check number of results
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "#1 of Documents"
    #Click Results/Content navigation arrows
    * "Document Frame > Title" should be visible
    * I click "<navigationToClick>"
    * I wait until "Loading Indicator" is gone
    #Check that if user clicks on Search Results link only 1st term search results are displayed
    * I click "Search Bar > Search Results"
    * "#1 of Documents" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$hitCount1}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills" should be "<term>"
    Examples:
      | term   | navigationToClick              |
      | avatar | Toolbar > Next Results Button  |
      | avatar | Toolbar > Next Document Button |

  @CU-40596 @CU-41827
  Scenario: Search from Laws&Regs SRL can be saved and rerun
    * I am logged in
    # Perform search on L&R
    * I perform search of "carrot" on Laws & Regulations
    * I remember text of "Results Toolbar > Hit Count" as "result"
    # Save this search
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "CU-40596" in "Save This Search Popup > Input"
    * I remember text of "Save This Search Popup > Input" as "Searchtitle"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * I wait until "Loading Indicator" is gone
    * "Save This Search Popup" should not be visible
    * I click "Header > Home"
    * "Practice Areas Box" should be visible
    # Rerun saved search
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * I click "Saved Searches Popup > #1 of Items > Name"
    # Verify that search was rerun and L&R SRL is displayed with remember number of results
    * "#1 of Documents" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$result}"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Pre Search Selections Group" should be "Pre-Search Selections Practice Area: Laws & Regulations" ignoring whitespaces ignoring punctuation marks

  @CU-40605 @CU-41828
  @logout
  Scenario: Laws&Regs search can be shared
    * I am logged in
    # Perform search on L&R
    * I perform search of "carrot" on Laws & Regulations
    * I remember text of "Results Toolbar > Hit Count" as "result"
    # Click Share this search
    * I click "Results Toolbar > Share This Search Button"
    * "Notice Popup" should be visible
    * "Notice Popup" should not be visible
    * I remember clipboard content as "url"
    # Logout
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    # Login as another user with L&R subscription
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    # Open copied url
    * I open "{$url}" url
    # Verify that L&R SRL is displayed with appropriate results
    * "#1 of Documents" should be visible
    * Text of "Results Toolbar > Hit Count" should be "{$result}"

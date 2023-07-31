@critical_path
@mvl
@LawsAndRegs
Feature: LawsAndRegs

  @CU-35189
  Scenario Outline: Verify that user can perform search within State USC/CFR on 'Laws & Regulations' via magnifier icon
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    * I remember number of "<Index> > Items" as "numOfItems"
    * I remember random integer below "{$numOfItems}" as "linkToClick"
    * I remember text of "<Index> > #{$linkToClick} of Items" as "linkTitle"
    * I scroll "<Index> > #{$linkToClick} of Item Links" to center of the window
    * I move mouse over "<Index> > #{$linkToClick} of Item Links"
    * "<Index> > #{$linkToClick} of Item Quick Select Icons" should be visible
    * I click "<Index> > #{$linkToClick} of Item Quick Select Icons"
    * Text of "Advanced Search Popup > Search Title" should be "LAWS & REGULATIONS"
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * "Advanced Search Popup > Selected Filters Box > #1 of Items" should be visible
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "1"
    * I remember text of "Advanced Search Popup > Selected Filters Box > #1 of Items Title" as "filterText"
    * "{$linkTitle}" text should contain "{$filterText}" text ignoring punctuation marks
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible
    * I click "Advanced Search Popup > X Close Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Index            |
      | #1 of Code Boxes |
      | #2 of Code Boxes |

  @CU-35191
  Scenario Outline: Verify that user can perform search within State Statutes/State Regulations on 'Laws & Regulations' via magnifier icon
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    * I click "State Box > <Index> of Tab Buttons"
    * I remember number of "State Box > Tab Buttons" as "numOfTabs"
    * I remember random integer below "{$numOfTabs}" as "TabToClick"
    * I remember text of "State Box > #{$TabToClick} of Tab Buttons" as "TabTitle"
    * I click "State Box > #{$TabToClick} of Tab Buttons"
    * Text of "State Box > Active Tab" should contain "{$TabTitle}"
    * I remember number of "State Box > Items" as "numOfItems"
    * I remember random integer below "{$numOfItems}" as "linkToClick"
    * I scroll "State Box > #{$linkToClick} of Items" to center of the window
    * I move mouse over "State Box > #{$linkToClick} of Items"
    * I remember text of "State Box > #{$linkToClick} of Item Links" as "linkTitle"
    * "State Box > #{$linkToClick} of Item Quick Select Icons" should be visible
    * I click "State Box > #{$linkToClick} of Item Quick Select Icons"
    * Text of "Advanced Search Popup > Search Title" should be "LAWS & REGULATIONS"
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    * "Advanced Search Popup > Selected Filters Box > #1 of Items" should be visible
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "1"
    * Text of "Advanced Search Popup > Selected Filters Box > #1 of Items Title" should be "{$linkTitle}" ignoring case
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible
    * I click "Advanced Search Popup > Cancel Button"
    * "Advanced Search Popup" should not be visible

    Examples:
      | Index | Filter            |
      | #1    | State Statutes    |
      | #2    | State Regulations |

  @CU-35661
  Scenario: Verify that Correct document can be opened from State Statutes/State Regulations tabs on 'Laws & Regulations' (via state abbreviation)
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
    * I click "State Box > #{$linkToClick} of Item Tags"
    * "DA Title" should be visible
    * Text of "DA Title" should contain "{$State}" ignoring case ignoring whitespaces
    * "Search Bar > Document Breadcrumbs" should be visible
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Laws & Regulations > {$TabTitle} > {$State}"

  @CU-43146
  Scenario: Global search is rerun correctly from Recent searches list on L&R dashboard (pre-,post Global search filters applied)
    * I am logged in
    * I disable thesaurus
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform advanced search with filters
    * I perform search of "tax" with the following presearch filters:
      | SELECT FILTERS > Document Type > Laws |
    * "#JURISDICTION in Filter Groups > Label" should be visible
    # Select 'New York' Jurisdiction filter
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"
    * "#{$jurisdiction} of Filter Groups > #1 of Show Subtypes" should be clickable
    * I click "#{$jurisdiction} of Filter Groups > #1 of Show Subtypes"
    * I click "#{$jurisdiction} of Filter Groups > #New York in Filter Items"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click on search input
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    # Check that recent searches contain previous search
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be more than "0"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "tax"
    # Click previous search in recent searches cluster
    * I click "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    # Check search term
    * Text of "Search Bar > #1 of Search Pills > Text" should be "tax"
    * Each element of "Highlighted Phrases" should contain "tax" ignoring case
    # Check that pre-search filters are not applied
    * "Search Bar >  #1 of PreSearch Filters" should not be visible

  @CU-43147
  Scenario: Recent Searches are displayed when search input is cleared on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click on search input
    * I click "Search Bar > Search Input"
    # Check recent searches cluster
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" as "suggestion"
    * I remember text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Time" as "time"
    # Type 'new' in search input
    * I type "new" in "Search Bar > Search Input"
    # Check 'Titles' cluster
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    # Click remove search button
    * I click "Search Bar > Search Delete"
    # Click on search input
    * I click "Search Bar > Search Input"
    # Check recent searches cluster
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * "Search Bar > Search Suggestions > Titles Cluster" should not be visible
    # Check that there is previous search
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should be "{$suggestion}"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Time" should be "{$time}"

  @CU-43148
  Scenario Outline: Document can be opened by selecting suggestion with keyboard from Titles Cluster on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Type search term in search input
    * I type "<term>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    # Check that there is titles cluster
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    # Choose 1st title with keyboard
    * I send sequence of keys "ArrowDown" to element "Search Bar > Search Input"
    * I remember text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > Text" as "suggestion"
    * I send sequence of keys "Enter" to element "Search Bar > Search Input"
    # Check that appropriate title was opened
    * Text of "DA Title" should be "{$suggestion}" ignoring case ignoring whitespaces
    * "Problem Encountered Popup" should not be visible

    Examples:
      | term     |
      | Virginia |

  @CU-43149
  Scenario: Search suggestions can be closed by clicking outside on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click on search input
    * I click "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    # Check that there is recent searches cluster
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    # Click outside
    * I click "Header > User Menu"
    # Check that search suggestions is not visible
    * "Search Bar > Search Suggestions" should not be visible
    # Type 'law' in search input
    * I type "law" in "Search Bar > Search Input"
    # Check that there is titles cluster
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * "Search Bar > Search Suggestions > Titles Cluster" should be visible
    # Click outside
    * I click "Header > User Menu"
    # Check that search suggestions is not visible
    * "Search Bar > Search Suggestions" should not be visible
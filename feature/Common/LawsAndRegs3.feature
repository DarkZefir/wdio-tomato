@smoke
@mvl @vlcc
@LawsAndRegs
Feature: LawsAndRegs3

  @CU-42778 @CU-42779
  Scenario: Standard no results screen is displayed when user performs search with applied filters on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * I click "Search Bar > Jurisdiction Dropdown"
    * "Search Bar > Jurisdiction Dropdown > #1 of Items" should be visible
    # Select random item from the dropdown
    * I remember number of "Search Bar > Jurisdiction Dropdown > Items" as "number"
    * I click "Search Bar > Jurisdiction Dropdown > #{$randomInt(1, $number)} of Items"
    # Click Doctype filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * "Search Bar > Document Type Dropdown > #1 of Items" should be visible
    # Select random item from the dropdown
    * I remember number of "Search Bar > Document Type Dropdown > Items" as "number"
    * I click "Search Bar > Document Type Dropdown > #{$randomInt(1, $number)} of Items"
    # Type searh term that will return no results in search field
    * I perform search of "kjdsfjkdsnfkj" on Laws & Regulations
    # Check that no results screen is displayed
    * "No Results Text" should be visible
    * Text of "No Results Text" should be "There are no results for your query."

  @CU-42780 @CU-42781
  Scenario: Filters from L&R are applied as pre search filters after search
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * "Search Bar > Jurisdiction Dropdown > #1 of Items" should be visible
    # Select random item from the dropdown
    * I remember number of "Search Bar > Jurisdiction Dropdown > Items" as "number"
    * I remember random integer below "{$number}" as "index"
    * I remember text of "Search Bar > Jurisdiction Dropdown > #{$index} of Items" as "filter"
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Click Doctype filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * "Search Bar > Document Type Dropdown > #1 of Items" should be visible
    # Select 2 items from the dropdown
    * I click "Search Bar > Document Type Dropdown > #1 of Items"
    * I click "Search Bar > Document Type Dropdown > #2 of Items"
    # Type search term in search field
    * I perform search of "cat" on Laws & Regulations
    # Check that appropriate presearch filters are applied
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "3"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "{$filter}"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Laws"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Rules and Regulations"

  @CU-42756 @CU-42757
  Scenario: L&R dashboard Jurisdiction filter placeholder changes its value when item is selected #1
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * "Search Bar > Jurisdiction Dropdown > #1 of Items" should be visible
    * I verify Placeholders for Jurisdiction on Laws&Regs starting with Federal

  @CU-42772 @CU-42773
  Scenario: Options in Sorting Menu on L&R results page verification
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform a search
    * I perform search of "cat"
    * I wait until "Loading Indicator" is gone
    # Default sorting value should be Relevance
    * "Sorting Menu" should be visible
    * Text of "Sorting Menu Button" should be "RELEVANCE"
    # Click Sorting menu
    * I click "Sorting Menu Button"
    * "#1 of Sorting Menu Items" should be visible
    # Verify sorting values
    * I should see the following lines in "Sorting Menu Items":
      | Relevance     |
      | Document Type |

  @CU-42758 @CU-42759
  Scenario: Options in Sorting Menu on L&R results page when clicking 'Show All Future Versions' button verification
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click 'Show All Future Versions'
    * I click "Search Bar > Future Versions Button"
    * I wait until "Loading Indicator" is gone
    # Default sorting value should be by effective date
    * "Sorting Menu" should be visible
    * Text of "Sorting Menu Button" should be "EFFECTIVE DATE"
    # Click Sorting menu
    * I click "Sorting Menu Button"
    # Verify sorting values
    * I should see the following lines in "Sorting Menu Items":
      | Relevance      |
      | Effective Date |
      | Document Type  |

  @CU-42760 @CU-42761
  Scenario Outline: Sorting option can be changed on L&R results page
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform a search
    * I perform search of "cat"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * "Sorting Menu" should be visible
    # Click Sorting menu
    * I click "Sorting Menu Button"
    * I click "#<sortingType> in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"

    Examples:
      | sortingType   | expectedValue |
      | Relevance     | RELEVANCE     |
      | Document Type | DOCUMENT TYPE |

  @CU-42762 @CU-42763
  Scenario Outline: Sorting option can be changed on L&R results page when clicking 'Show All Future Versions' button
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click 'Show All Future Versions'
    * I click "Search Bar > Future Versions Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * "Sorting Menu" should be visible
    # Click Sorting menu
    * I click "Sorting Menu Button"
    * "#1 of Sorting Menu Items" should be visible
    * I click "#<sortingType> in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"

    Examples:
      | sortingType    | expectedValue  |
      | Relevance      | RELEVANCE      |
      | Effective Date | EFFECTIVE DATE |
      | Document Type  | DOCUMENT TYPE  |

  @CU-42764 @CU-42765
  Scenario: Sorting option changes its value when switching on/off show future versions toggle
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform a search
    * I perform search of "cat"
    * I wait until "Loading Indicator" is gone
    # Switch on show future versions toggle
    * I click "Future Versions Only Toggle Off"
    * "Future Versions Only Toggle On" should be visible
    * I wait until "Loading Indicator" is gone
    # Check that sorting order is by effective date
    * Text of "Sorting Menu Button" should be "EFFECTIVE DATE"
    # Switch off show future versions toggle
    * I click "Future Versions Only Toggle On"
    * "Future Versions Only Toggle Off" should be visible
    * I wait until "Loading Indicator" is gone
    # Check that sorting order is by relevance
    * Text of "Sorting Menu Button" should be "RELEVANCE"

  @CU-43056 @CU-43057
  Scenario Outline: Verify that selected sorting type persists during session on L&R dashboard
    * I am logged in
    # Perform a search
    * I perform search of "cat" on Laws & Regulations
    * I wait until "Loading Indicator" is gone
    * "Sorting Menu" should be visible
    # Click Sorting menu
    * I click "Sorting Menu Button"
    * I click "#<sortingType> in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    * Text of "Sorting Menu Button" should be "<expectedValue>"
    # Click Home
    * I click "Header > Home"
    # Perform a search
    * I perform search of "dog" on Laws & Regulations
    * I wait until "Loading Indicator" is gone
    * "Sorting Menu" should be visible
    * Text of "Sorting Menu Button" should be "<expectedValue>"

    Examples:
      | sortingType   | expectedValue |
      | Relevance     | RELEVANCE     |
      | Document Type | DOCUMENT TYPE |

  @CU-43058 @CU-43059
  Scenario: Verify DocType sorting on L&R results page
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform a search
    * I perform search of "cat"
    * I wait until "Loading Indicator" is gone
    * "Sorting Menu" should be visible
    # Click Sorting menu
    * I click "Sorting Menu Button"
    # Select Document Type Sort option
    * I click "#Document Type in Sorting Menu Items"
    * I wait until "Loading Indicator" is gone
    # Verify Doc Type sorting
    * Text of "Sorting Menu Button" should be "DOCUMENT TYPE"
    * Count of "Cluster" should be more than "1"
    * I remember number of "Cluster" as "clusters"
    * Count of "Cluster > Cluster Header" should be equal to "{$clusters}"
    * Count of "Cluster > Documents" should be more than "{$clusters}"
    * "Other Document Types Hint" should be visible

  @CU-42768 @CU-42769
  Scenario Outline: L&R dashboard Document Type filter placeholder changes its value when item is selected #1
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Document Type filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * I wait until "Loading Indicator" is gone
    * I remember index of "Search Bar > Document Type Dropdown > Items" exactly matching "<name>" as "index"
    # Select item from the dropdown
    * I click "Search Bar > Document Type Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Document Type Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Document Type Dropdown > Placeholder" should be "<name>"

    Examples:
      | name        |
      | Statutes    |
      | Regulations |

  @CU-42770 @CU-42771
  Scenario: L&R dashboard Document Type filter placeholder changes its value when item is selected #2
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Document Type filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * I wait until "Loading Indicator" is gone
    * I remember index of "Search Bar > Document Type Dropdown > Items" exactly matching "Statutes" as "index"
    # Select item from the dropdown
    * I click "Search Bar > Document Type Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Document Type Dropdown > #{$index} of Item Checkboxes" should be selected
    * I remember index of "Search Bar > Document Type Dropdown > Items" exactly matching "Regulations" as "index"
    # Select item from the dropdown
    * I click "Search Bar > Document Type Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Document Type Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Document Type Dropdown > Placeholder" should be "Statutes + 1"

  @CU-42774 @CU-42775
  Scenario: Search term is moved to the advanced search, filters are not on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    # Select random item from the dropdown
    * I remember number of "Search Bar > Jurisdiction Dropdown > Items" as "number"
    * I click "Search Bar > Jurisdiction Dropdown > #{$randomInt(1, $number)} of Items"
    # Click Doctype filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    # Select random item from the dropdown
    * I remember number of "Search Bar > Document Type Dropdown > Items" as "number"
    * I click "Search Bar > Document Type Dropdown > #{$randomInt(1, $number)} of Items"
    # Type any searh term in search field
    * I type "tax" in "Search Bar > Search Input"
    # Click Advanced Search
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup > Presearch Panel" should be visible
    # Check that filters are not moved to advanced search
    * "Advanced Search Popup > Selected Filters Box" should not be visible
    # Check that search term is moved to advanced search
    * Value in "Advanced Search Popup > Search Input" should be "tax"

  @CU-42776 @CU-42777
  Scenario: Filters are not sticky on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    # Select random item from the dropdown
    * I remember number of "Search Bar > Jurisdiction Dropdown > Items" as "number"
    * I click "Search Bar > Jurisdiction Dropdown > #{$randomInt(1, $number)} of Items"
    # Click Doctype filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    # Select random item from the dropdown
    * I remember number of "Search Bar > Document Type Dropdown > Items" as "number"
    * I click "Search Bar > Document Type Dropdown > #{$randomInt(1, $number)} of Items"
    # Click Home button
    * I click "Header > Home"
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Check that filters are in default state
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "Jurisdiction"
    * Text of "Search Bar > Document Type Dropdown > Placeholder" should be "Document Type"

  @CU-43140 @CU-43150
  Scenario: UI of search suggestions clusters on L&R dashboard verification
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Type 'law' in search bar
    * I type "law" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster" should be visible
    # Verify search suggestions clusters
    * "Search Bar > Search Suggestions > Most Relevant Cluster" should not be visible
    * "Search Bar > Search Suggestions > QandA Cluster" should not be visible
    * "Search Bar > Search Suggestions > Citations Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"

  @CU-43141 @CU-43151
  Scenario: Verify UI and basic functionality of Recent Searches on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Perform searches
    * I perform search of "term"
    * Text of "Search Bar > #1 of Search Pills" should be "term"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "tax"
    * Text of "Search Bar > #1 of Search Pills" should be "tax"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "bank"
    * Text of "Search Bar > #1 of Search Pills" should be "bank"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "system"
    * Text of "Search Bar > #1 of Search Pills" should be "system"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "news"
    * Text of "Search Bar > #1 of Search Pills" should be "news"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "train"
    * Text of "Search Bar > #1 of Search Pills" should be "train"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "election"
    * Text of "Search Bar > #1 of Search Pills" should be "election"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "way"
    * Text of "Search Bar > #1 of Search Pills" should be "way"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "format"
    * Text of "Search Bar > #1 of Search Pills" should be "format"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    * I perform search of "support"
    * Text of "Search Bar > #1 of Search Pills" should be "support"
    * "Search Bar > #1 of Search Pills > Edit" should be visible
    * I click "Search Bar > #1 of Search Pills > Remove"
    * "Search Bar > #1 of Search Pills" should not be visible
    * I wait until "Loading Indicator" is gone
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click search input
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    # Check recent searches cluster
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be equal to "10"
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions > Time" should be equal to "10"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > Cluster Title" should be "Recent Searches"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #10 of Suggestions > Text" should contain "term"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #9 of Suggestions > Text" should contain "tax"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #8 of Suggestions > Text" should contain "bank"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #7 of Suggestions > Text" should contain "system"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #6 of Suggestions > Text" should contain "news"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #5 of Suggestions > Text" should contain "train"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #4 of Suggestions > Text" should contain "election"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #3 of Suggestions > Text" should contain "way"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #2 of Suggestions > Text" should contain "format"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "support"

  @CU-43142 @CU-43152
  Scenario: Search is present in Recent searches list on top position on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    * I disable thesaurus
    # Perform a search
    * I perform search of "test search"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > #1 of Search Pills > Text" should be "test search"
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Click search input
    * I type "" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions" should be visible
    * Count of "Search Bar > Search Suggestions > Recent Searches Cluster > Suggestions" should be more than "0"
    * Text of "Search Bar > Search Suggestions > Recent Searches Cluster > #1 of Suggestions > Text" should contain "test search"

  @CU-43143 @CU-43153
  Scenario Outline: Verify UI and basic functionality of Titles Cluster on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Type search term on the search input
    * I type "<term1>" in "Search Bar > Search Input"
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    # Check titles cluster
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should contain "<term1>" ignoring case
    # Type 1 more term into search input
    * I type " <term2>" in "Search Bar > Search Input"
    # Check titles cluster
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions > #2 of Text Highlights" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "2"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term1>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<term2>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should match "(<term1>|<term2>)" ignoring case

    Examples:
      | term1 | term2   |
      | code  | alabama |

  @CU-43144 @CU-43154
  Scenario Outline: Titles Cluster appears for 3rd letter in the input on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Type 1st letter into search input
    * I type "<letter1>" in "Search Bar > Search Input"
    * I wait 1 seconds
    # Check that clusters are not visible
    * "Search Bar > Search Suggestions" should not be visible
    # Type 2nd letter into search input
    * I type "<letter2>" in "Search Bar > Search Input"
    * I wait 1 seconds
    # Check that clusters are not visible
    * "Search Bar > Search Suggestions" should not be visible
    # Type 3rd letter into search input
    * I type "<letter3>" in "Search Bar > Search Input"
    # Check titles cluster
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * "Search Bar > Search Suggestions > Recent Searches Cluster" should not be visible
    * Count of "Search Bar > Search Suggestions > Titles Cluster > Suggestions" should be equal to "5"
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text" should contain "<letter1><letter2><letter3>" ignoring case
    * Each element of "Search Bar > Search Suggestions > Titles Cluster > Suggestions > Text Highlights" should contain "<letter1><letter2><letter3>" ignoring case

    Examples:
      | letter1 | letter2 | letter3 |
      | c       | o       | d       |

  @CU-43145 @CU-43155
  Scenario Outline: User can open document by clicking on suggestion from Titles Cluster which corresponds title in 'Titles' overlay on L&R dashboard
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    # Type search term into search field
    * I type "<title>" in "Search Bar > Search Input"
    # Check titles cluster
    * "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be visible
    * Text of "Search Bar > Search Suggestions > Titles Cluster > Cluster Title" should be "Titles"
    * Text of "Search Bar > Search Suggestions > Titles Cluster > #1 of Suggestions" should be "<title>"
    # Click appropriate title
    * I click "Search Bar > Search Suggestions > Titles Cluster > #<title> in Suggestions"
    # Check that appropriate title was opened
    * "Notice Popup" should not be visible
    * Text of "DA Title" should be "<title>" ignoring case ignoring whitespaces
    * "Problem Encountered Popup" should not be visible
    Examples:
      | title             |
      | Virginia Statutes |

  @CU-43060 @CU-43061
  Scenario: Verify Future Versions SRL View on Laws And Regs
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "#1 of Code Boxes" should be visible
    * "Search Bar > Future Versions Button" should be visible
    * Text of "Search Bar > Future Versions Button" should be "SHOW ALL FUTURE VERSIONS"
    * I click "Search Bar > Future Versions Button"
    * "#1 of Documents" should be visible
    * I remember number of "Documents > Effective Date" as "effectiveDates"
    * I remember number of "Documents" as "docsNum"
    * I remember text of "#1 of Documents > Effective Date" as "effDate"
    * "{$effectiveDates}" number should be equal to "{$docsNum}"
    * "{$effDate}" Effective date should be after current date
    * Text of "Sorting Menu Button" should be "EFFECTIVE DATE"
    * "Future Versions Only On Label" should be visible
    * Text of "Future Versions Only On Label" should be "Show future versions ON"
    * "Future Versions Only Toggle On" should be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup > Future Versions Section" should be visible
    * Text of "Search Information Popup > Future Versions Section Title" should be "Only Future Versions"
    * "Search Information Popup > Future Versions Section Flag" should be visible
    * Text of "Search Information Popup > Future Versions Section Flag" should be "Active"

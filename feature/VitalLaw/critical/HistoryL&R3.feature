@critical_path
@mvl
Feature: History

  @CU-40831
  @notParallel @logout
  Scenario Outline: Saved searches are displayed in history, have appropriate format & can be opened
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    # Open Saved Searches list
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    # Remember Saved Search Name. Open Saved Search Information Popup
    * "Saved Searches Popup > #1 of Items" should be visible
    * I remember index of "Saved Searches Popup > Items > Name" matching "<ssName>" as "linkIndex"
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Info Icon"
    * "Saved Search Information Popup" should be visible
    # Remember Saved Search query. Run Saved search
    * I remember text of "Saved Search Information Popup > Search Queries" as "searchQuery"
    * I click "Saved Search Information Popup > X Close Button"
    * "Saved Search Information Popup" should not be visible
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Name"
    * "Search Bar > #1 of Search Pills" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Go to another than current search page
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Wait>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check>" should contain "SAVED SEARCH: <ssName>" ignoring case
    # Open 1st item from history
    * I click "<Check>"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$searchQuery}"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"

    Examples:
      | ssName        | Click                        | Wait                                          | Check                                         |
      | goat for L&R  | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title | Header > History Dropdown > #1 of Items Title |
      | car for L&R   | History Box > See All Button | History Popup                                 | History Popup > #1 of Items > Link            |
      | human for L&R | Header > Home                | History Box                                   | History Box > #1 of Links                     |

  @CU-40832
  @notParallel @logout
  Scenario Outline: Shared searches & saved searches are displayed in history, have appropriate format & can be opened
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    # Open Saved Searches list
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    # Remember Saved Search Name. Open Saved Search Information Popup
    * "Saved Searches Popup > #1 of Items" should be visible
    * I remember index of "Saved Searches Popup > Items > Name" matching "<ssName>" as "linkIndex"
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Info Icon"
    * "Saved Search Information Popup" should be visible
    # Remember Saved Search query. Run Saved search
    * I remember text of "Saved Search Information Popup > Search Queries" as "searchTerm1"
    * I click "Saved Search Information Popup > X Close Button"
    * "Saved Search Information Popup" should not be visible
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Name"
    * "Search Bar > #1 of Search Pills" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber1"
    # Click Share This Search button
    * I click "Results Toolbar > Share This Search Button"
    * "Notice Popup" should be visible
    * "Notice Popup" should not be visible
    # Remember copied link
    * I remember clipboard content as "url1"
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search
    * I perform search of "<searchTerm2>"
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber2"
    # Click Share This Search button
    * I click "Results Toolbar > Share This Search Button"
    * "Notice Popup" should be visible
    * "Notice Popup" should not be visible
    # Remember copied link
    * I remember clipboard content as "url2"
    # Go to another than current search page
    * I click "Header > Laws And Regulations Button"
    # Open saved search using link
    * I open "{$url1}" url
    * "Search Bar > #1 of Search Pills" should be visible
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$searchTerm1}"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber1}"
    # Go to another than current search page
    * I click "Header > Laws And Regulations Button"
    # Open regular search using link
    * I open "{$url2}" url
    * "Search Bar > #1 of Search Pills" should be visible
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm2>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber2}"
    # Go to another than current search page
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check1>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check1>" should contain "SEARCH: <searchTerm2>" ignoring case
    * Text of "<Check2>" should contain "SEARCH: {$searchTerm1}" ignoring case
    * Text of "<Check3>" should contain "SEARCH: <searchTerm2>" ignoring case
    * Text of "<Check4>" should contain "SAVED SEARCH: <ssName>" ignoring case
    # Open 2nd item from history
    * I click "<Check2>"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "{$searchTerm1}"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber1}"

    Examples:
      | searchTerm2 | ssName        | Click                        | Check1                                        | Check2                                        | Check3                                        | Check4                                        |
      | milk        | goat for L&R  | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title | Header > History Dropdown > #2 of Items Title | Header > History Dropdown > #3 of Items Title | Header > History Dropdown > #4 of Items Title |
      | job         | car for L&R   | History Box > See All Button | History Popup > #1 of Items > Link            | History Popup > #2 of Items > Link            | History Popup > #3 of Items > Link            | History Popup > #4 of Items > Link            |
      | person      | human for L&R | Header > Home                | History Box > #1 of Links                     | History Box > #2 of Links                     | History Box > #3 of Links                     | History Box > #4 of Links                     |

  @CU-40833
  Scenario Outline: Docs opened from SRL are displayed in history, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Perform a search
    * I perform search of "<searchTerm>"
    # Remember search title of the doc from SRL
    * I remember text of "#1 of Documents > Document Title" as "title"
    # Open doc from SRL
    * I click "#1 of Documents > Document Title"
    * "Document Frame > Document Content" should be visible
    # Click Show metadata
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID" for L&R
    # Go to another than current doc page
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check>" should contain "{$title}" ignoring case
    # Open 1st item from history
    * I click "<Check>"
    # Click Show metadata
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text

    Examples:
      | searchTerm | Click                        | Check                                         |
      | carrot     | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | happiness  | History Box > See All Button | History Popup > #1 of Items > Link            |
      | throne     | Header > Home                | History Box > #1 of Links                     |

@critical_path
@mvl
Feature: Session Navigator

  @CU-40837
  Scenario Outline: Searches performed from L&R Code boxes from dashboard with quick search button are displayed in session navigator, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * I remember random integer below "7" as "RandomLink"
    * I move mouse over "#<Box> of Code Boxes > #{$RandomLink} of Item Links"
    # Remember title of the appropriate link
    * I remember text of "#<Box> of Code Boxes > #{$RandomLink} of Item Links" as "Title"
    * "#<Box> of Code Boxes > #{$RandomLink} of Item Quick Select Icons" should be visible
    # Click quick search button from USC/CFR Code Box
    * I click "#<Box> of Code Boxes > #{$RandomLink} of Item Quick Select Icons"
    * "Advanced Search Popup > Selected Filters Box > #1 of Items" should be visible
    # Search for the search term
    * I type "<searchTerm>" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * "Search Bar > #1 of Search Pills" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Go to another than current search page
    * I click "Header > Laws And Regulations Button"
    * "Session Navigator > Session Navigator Tab" should be visible
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    * I wait 3 seconds
    # Check the presence & order of previous search
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: <searchTerm>" ignoring case
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "{$resultsNumber} RESULTS"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"
    * Text of "Search Bar > #1 of PreSearch Filters > Filter Name" should contain "{$Title}"

    Examples:
      | Box | searchTerm |
      | 1   | tax        |
      | 2   | tax        |

  @CU-40838
  Scenario Outline: Searches performed from L&R State boxes from dashboard with quick search button are displayed in session navigator, have appropriate format & can be opened
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Click SS/SR tab
    * I scroll to the bottom
    * I click "State Box > #<Tab> of Tab Buttons"
    * I remember number of "State Box > Items" as "LinksNumber"
    # Remember title of the appropriate link
    * I remember random integer below "{$LinksNumber}" as "RandomLink"
    * I move mouse over "State Box > #{$RandomLink} of Items"
    * I remember text of "State Box > #{$RandomLink} of Item Links" as "Title"
    * "State Box > #{$RandomLink} of Item Quick Select Icons" should be visible
    # Click the quick search icon
    * I click "State Box > #{$RandomLink} of Item Quick Select Icons"
    * "Advanced Search Popup > Selected Filters Box > #1 of Items" should be visible
    # Search for the search term
    * I type "<searchTerm>" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * "Search Bar > #1 of Search Pills" should be visible
    # Remember number of results
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Go to another than current search page
    * I click "Header > Laws And Regulations Button"
    * "Session Navigator > Session Navigator Tab" should be visible
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    * I wait 3 seconds
    # Check the presence & order of previous search
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: <searchTerm>" ignoring case
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "{$resultsNumber} RESULTS"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"
    * Text of "Search Bar > #1 of PreSearch Filters > Filter Name" should contain "{$Title}"

    Examples:
      | Tab | searchTerm |
      | 1   | tax        |
      | 2   | tax        |

  @CU-40841
  Scenario Outline: Docs opened from SRL are displayed in session navigator, have appropriate format & can be opened
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
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    * I wait 3 seconds
    # Compare search title of the doc with title in session navigator
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should be "{$title}" ignoring case
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    # Click Show metadata
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Remember docID
    * I remember "value" of "dcterms:identifier" metadata parameter as "docID2" for L&R
    * "{$docID}" text should contain "{$docID2}" text

    Examples:
      | searchTerm |
      | happiness  |

@critical_path
@mvl
Feature: History

  @CU-40829
  Scenario Outline: Searches performed from L&R Code boxes from dashboard with quick search button are displayed in history, have appropriate format & can be opened
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
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check>" should contain "SEARCH: <searchTerm>" ignoring case
    # Open First item from history
    * I click "<Check>"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"

    Examples:
      | Box | searchTerm | Click                        | Check                                         |
      | 1   | milk       | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 1   | goat       | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 1   | car        | Header > Home                | History Box > #1 of Links                     |
      | 2   | person     | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 2   | human      | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 2   | tax        | Header > Home                | History Box > #1 of Links                     |

  @CU-40830
  Scenario Outline: Searches performed from L&R State boxes from dashboard with quick search button are displayed in history, have appropriate format & can be opened
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
    * I click "Header > Home"
    # Open appropriate history
    * I click "<Click>"
    * "<Check>" should be visible
    # Check the presence & order of previous search
    * Text of "<Check>" should contain "SEARCH: <searchTerm>" ignoring case
    # Open First item from history
    * I click "<Check>"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<searchTerm>"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"

    Examples:
      | Tab | searchTerm | Click                        | Check                                         |
      | 1   | milk       | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 1   | goat       | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 1   | car        | Header > Home                | History Box > #1 of Links                     |
      | 2   | person     | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | 2   | human      | History Box > See All Button | History Popup > #1 of Items > Link            |
      | 2   | tax        | Header > Home                | History Box > #1 of Links                     |

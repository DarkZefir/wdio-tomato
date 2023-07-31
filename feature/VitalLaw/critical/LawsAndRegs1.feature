@critical_path
@mvl
Feature: LawsAndRegs

  @CU-42742
  Scenario: Search with L&R dashboard filters is logged to session navigator and can be rerun from it
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * I wait 3 seconds
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
    # Type searh term in search field
    * I type "cat" in "Search Bar > Search Input"
    * I wait 3 seconds
    # Click search button
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Click Home button
    * I click "Header > Home"
    # Open Session Navigator > L&R
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #1 of Resourses List Items > Expand"
    * "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event" should be visible
    * I wait 3 seconds
    # Check the presence & order of previous search
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "SEARCH: cat" ignoring case
    * Text of "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event > Title" should contain "{$resultsNumber} RESULTS"
    # Open 1st item from session navigator > L&R
    * I click "Session Navigator > #1 of Resourses List Items > Events Panel > #1 of Event"
    * "Search Bar > #1 of Search Pills" should be visible
    # Check that appropriate search is opened
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "cat"
    * Text of "Results Toolbar > Hit Count" should contain "{$resultsNumber}"
    # Check that appropriate postsearch filters are applied
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "3"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "{$filter}"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Laws"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Rules and Regulations"

  @CU-42744
  Scenario Outline: Search with L&R dashboard filters is logged to history and can be rerun from it
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * I wait 3 seconds
    # Select random item from the dropdown
    * I remember number of "Search Bar > Jurisdiction Dropdown > Items" as "number"
    * I remember random integer below "{$number}" as "index"
    * I remember text of "Search Bar > Jurisdiction Dropdown > #{$index} of Items" as "filter"
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Click Doctype filters dropdown
    * I click "Search Bar > Document Type Dropdown"
    * I wait 3 seconds
    # Select 2 items from the dropdown
    * I click "Search Bar > Document Type Dropdown > #1 of Items"
    * I click "Search Bar > Document Type Dropdown > #2 of Items"
    # Type searh term in search field
    * I type "<searchTerm>" in "Search Bar > Search Input"
    * I wait 3 seconds
    # Click search button
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "resultsNumber"
    # Click Home button
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
    # Check that appropriate postsearch filters are applied
    * Count of "Search Bar > PostSearch Filters > Filter Name" should be equal to "3"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "{$filter}"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Laws"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Rules and Regulations"

    Examples:
      | searchTerm | Click                        | Check                                         |
      | milk       | Header > History Dropdown    | Header > History Dropdown > #1 of Items Title |
      | goat       | History Box > See All Button | History Popup > #1 of Items > Link            |
      | car        | Header > Home                | History Box > #1 of Links                     |

  @CU-42766
  Scenario: L&R dashboard Jurisdiction filter placeholder changes its value when item is selected #2
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    # Click Jurisdiction filters dropdown
    * I click "Search Bar > Jurisdiction Dropdown"
    * I wait 3 seconds
    * I remember index of "Search Bar > Jurisdiction Dropdown > Items" exactly matching "Washington" as "index"
    # Select appropriate item from the dropdown
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Jurisdiction Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "WA"
    * I remember index of "Search Bar > Jurisdiction Dropdown > Items" exactly matching "California" as "index"
    # Select appropriate item from the dropdown
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Jurisdiction Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "CA, WA"
    * I remember index of "Search Bar > Jurisdiction Dropdown > Items" exactly matching "Wyoming" as "index"
    # Select appropriate item from the dropdown
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Jurisdiction Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "CA, WA, WY"
    * I remember index of "Search Bar > Jurisdiction Dropdown > Items" exactly matching "Federal" as "index"
    # Select appropriate item from the dropdown
    * I click "Search Bar > Jurisdiction Dropdown > #{$index} of Items"
    # Check that checkbox is checked
    * "Search Bar > Jurisdiction Dropdown > #{$index} of Item Checkboxes" should be selected
    # Check that jurisdiction placeholder has appropriate text
    * Text of "Search Bar > Jurisdiction Dropdown > Placeholder" should be "FED, CA, WA + 1"
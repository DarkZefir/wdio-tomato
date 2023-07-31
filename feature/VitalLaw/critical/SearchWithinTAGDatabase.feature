@critical_path
@mvl
Feature: Search Withing TAG Database

  @CU-31808
  Scenario Outline: Verify that correct number of selected Topics is displayed in 'Search or Browse within TAG FAQ database' widget
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * I click "Search Within Tag Box > Topics Dropdown > Button"
    * "Search Within Tag Box > Topics Dropdown > Select All" should be visible
    * I click "Search Within Tag Box > Topics Dropdown > Select All Checkbox"
    * "Notice Popup" should be visible
    * I click "Notice Popup > X Close Button"
    * "Notice Popup" should not be visible
    * "Search Within Tag Box > Topics Dropdown > Select All Input" should not be selected
    * "Search Within Tag Box > Topics Dropdown > #1 of Items" should be visible
    * I click first "<number>" elements of "Search Within Tag Box > Topics Dropdown > Items Checkbox"
    * Text of "Search Within Tag Box > Topics Dropdown > Button" should be "<text>"

    Examples:
      | number | text               |
      | 10     | 10 Topics Selected |
      | 1      | 1 Topic Selected   |

  @CU-31809
  Scenario: Verify that user cannot perform search in 'Search or Browse within TAG FAQ database' when all topics are deselected
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * "Search Within Tag Box > Search Input" should be visible
    * I type "tax" in "Search Within Tag Box > Search Input"
    * "Search Within Tag Box > Search Button" should be clickable
    * "Search Within Tag Box > Search Button" should be enabled
    * I click "Search Within Tag Box > Header"
    * I click "Search Within Tag Box > Topics Dropdown > Button"
    * "Search Within Tag Box > Topics Dropdown > Select All" should be visible
    * I click "Search Within Tag Box > Topics Dropdown > Select All Checkbox"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Notice Message" should be "Please select at least one topic"
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * "Search Within Tag Box > Search Button" should not be enabled

  @CU-31810
  Scenario: Verify that selected in 'Search or Browse within TAG FAQ database' Topic Filters are displayed on SRL (some topics)
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * "Search Within Tag Box > Search Input" should be visible
    * I type "tax" in "Search Within Tag Box > Search Input"
    * "Search Within Tag Box > Search Button" should be clickable
    * "Search Within Tag Box > Search Button" should be enabled
    * I click "Search Within Tag Box > Header"
    * I click "Search Within Tag Box > Topics Dropdown > Button"
    * "Search Within Tag Box > Topics Dropdown > Select All" should be visible
    * I click "Search Within Tag Box > Topics Dropdown > Select All Checkbox"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Notice Message" should be "Please select at least one topic"
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible
    * I click first "15" elements of "Search Within Tag Box > Topics Dropdown > Items Checkbox"
    * I remember text of first "15" number of "Search Within Tag Box > Topics Dropdown > Items Label" elements as "selectedTopics"
    * I scroll to the top
    * I click "Search Within Tag Box > Search Button"
    * "Search Bar > #1 of PostSearch Filters > Filter Name" should be visible
    * I click "Search Bar > Selected Filters Toggle Collapsed"
    * I remember text of "Search Bar > PostSearch Filters > Filter Name" as "pilsTexts"
    * "$selectedTopics" collection should be equal to "$pilsTexts" collection ignoring order
    * I remember text of "Filter Groups > Selected Items Label" as "selectedFilters"
    * "$selectedTopics" collection should be equal to "$selectedFilters" collection ignoring order

  @CU-31811
  Scenario: Verify that selected in 'Search or Browse within TAG FAQ database' Topic Filters are displayed on SRL
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * "Search Within Tag Box > Search Input" should be visible
    * I type "tax" in "Search Within Tag Box > Search Input"
    * "Search Within Tag Box > Search Button" should be clickable
    * "Search Within Tag Box > Search Button" should be enabled
    * I click "Search Within Tag Box > Header"
    * I click "Search Within Tag Box > Topics Dropdown > Button"
    * "Search Within Tag Box > Topics Dropdown > Select All" should be visible
    * I remember text of "Search Within Tag Box > Topics Dropdown > Items Label" as "selectedTopics"
    * I click "Search Within Tag Box > Search Button"
    * "Search Bar > #1 of PostSearch Filters > Filter Name" should be visible
    * I click "Search Bar > Selected Filters Toggle Collapsed"
    * I remember text of "Search Bar > PostSearch Filters > Filter Name" as "pilsTexts"
    * "$selectedTopics" collection should be equal to "$pilsTexts" collection ignoring order
    * I remember text of "Filter Groups > Selected Items Label" as "selectedFilters"
    * "$selectedTopics" collection should be equal to "$selectedFilters" collection ignoring order

  @CU-31813
  Scenario: Verify 'Select filters' block in Advanced Search Scope on 'TAG' PA
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * I click "Advanced Search Popup > #SELECT FILTERS in Presearch Filters > Title"
    * "Advanced Search Popup > #1 of Presearch Filters > #1 of Presearch Filter Titles" should be visible
    * I should see the following lines in "Advanced Search Popup > Presearch Filters > Presearch Filter Titles":
      | Document Type |
      | Court         |
      | Jurisdiction  |
      | Issuing Body  |
      | Date          |
      | Topic         |

  @CU-31814
  Scenario: Verify that 'Browse Within the Topics' link from 'TAG' PA leads to Document read view
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * "Search Within Tag Box" should be visible
    * I click "Search Within Tag Box > Browse Within The Topics Link"
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > Title" should be "Welcome to TAG's Question & Answer database"

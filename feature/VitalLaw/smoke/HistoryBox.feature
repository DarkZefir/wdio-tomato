@smoke
@mvl
@history_box
Feature: History box


  @CU-35854
  Scenario: Verify My History box on All Content page
    * I am logged in
    * "History Box" should be visible
    * Text of "History Box > Title" should be "My History" ignoring case
    * Count of "History Box > Links" should be more than "0"
    * "History Box > See All Button" should be visible


  @CU-35855
  Scenario: Verify History popup from History box on All Content
    * I am logged in
    *  "History Box" should be visible
    * I click "History Box > See All Button"
    * "History Popup" should be visible


  @CU-35858
  Scenario Outline: Verify that Search is present in History box on top position
    * I am logged in
    * I perform search of "<DocID>"
    * I am on "All Content" PA
    * I wait until "Loading Indicator" is gone
    * "History Box > #1 of Links" should be visible
    * Text of "History Box > #1 of Links" should contain "SEARCH: <DocID>" ignoring case

    Examples:
      | DocID                 |
      | pir0109013e2c83d8fb85 |


  @CU-35859
  Scenario Outline: Verify that opened document is present in History box on top position
    * I am logged in
    * I open "<docId>" document
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Title" should be visible
    * I remember text of "Search Bar > Search Title" as "title"
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * "History Box > #1 of Links" should be visible
    * Text of "History Box > #1 of Links" should contain "{$title}" ignoring case

    Examples:
      | docId                              |
      | b18954787dbb10009b76000d3a8daaf401 |


  @CU-35857
  Scenario Outline: Verify that user can rerun documents/topic from History box
    * I am logged in
    * I open base url with "<URL>"
    * "<way1>" should be visible
    * I remember text of "<way2>" as "title"
    * I wait 3 seconds
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * "History Box" should be visible
    * "History Box > #1 of Links" should be visible
    * I remember text of "History Box > #1 of Links" as "link"
    * I click "History Box > #1 of Links"
    * I wait until "Loading Indicator" is gone
    * "<way2>" should be visible
    * Text of "<way2>" should be "{$title}"

    Examples:
      | URL                                                           | way1                               | way2                         |
      | #/topics/TaxFederal/tppc01864f59987c661000912a90b11c18c90201b | Tax Topic Page > Table Of Contents | Tax Topic Page > Topic Title |
      | #/read/6a7976007db41000ac84000d3a8daaf402                     | Contents Tab > Root Title          | DA Title                     |


  @CU-35897
  Scenario Outline: Verify that user can rerun TAG FAQ Database/Sample Forms search from History box
    * I am logged in
    * I am on "<pa>" PA
    * I wait until "Loading Indicator" is gone
    * I type "<query>" in "<searchField>"
    * "<button>" should be clickable
    * I click "<button>"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "<searchTitle>"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * "History Box" should be visible
    * "History Box > #1 of Links" should be visible
    * I click "History Box > #1 of Links"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar > Search Title" should be "<searchTitle>"
    * Text of "Results Toolbar > Hit Count" should contain "{$hitCount1}"

    Examples:
      | pa                     | query   | searchField                          | button                           | searchTitle   |
      | Labor & Employment Law | cookies | Sample Forms Box > Search Term Input | Sample Forms Box > Search Button | Sample Forms: |
      # | TECHNICAL ANSWER GROUP - TAG | law     | Search Within TAG Box > Search Input | Search Within TAG Box > Search Button | TAG FAQ DATABASE: |

  @CU-35856
  @logout
  Scenario: Verify that user can rerun Saved search from History box
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    #Opens Saved Searches list
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    #Remembers Saved Search Name. Opens Saved Search Information Popup
    * "Saved Searches Popup > #1 of Items" should be visible
    * I remember index of "Saved Searches Popup > Items > Name" matching "CU-32325" as "linkIndex"
    * I remember text of "Saved Searches Popup > #{$linkIndex} of Items > Name" as "ssName"
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Info Icon"
    * "Saved Search Information Popup" should be visible
    #Remembers Saved Search query. Runs Saved search
    * I remember text of "Saved Search Information Popup > Search Queries" as "searchQuery"
    * I click "Saved Search Information Popup > X Close Button"
    * "Saved Search Information Popup" should not be visible
    * I click "Saved Searches Popup > #{$linkIndex} of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    #Goes to All Content
    * "Results Toolbar > Hit Count" should be visible
    * I click "Header > Home"
    #Reruns Saved Search from History box
    * "History Box > #1 of Links" should be visible
    * Text of "History Box > #1 of Links" should be "SAVED SEARCH: {$ssName}"
    * I click "History Box > #1 of Links"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "{$searchQuery}"

@smoke
@mvl
@Laws&Regs
Feature: Laws & Regs Future Versions only SRL

  @CU-43188
  Scenario: Verify Future Versions disable SRL View on Laws And Regs
    * I am logged in
    * I perform search of "*" on Laws & Regulations
    * "#1 of Documents" should be visible
    * I remember number of "Documents > Effective Date" as "effectiveDates"
    * "{$effectiveDates}" number should be equal to "0"
    * Text of "Sorting Menu Button" should be "RELEVANCE"
    * "Future Versions Only Off Label" should be visible
    * Text of "Future Versions Only Off Label" should be "Show future versions OFF"
    * "Future Versions Only Toggle Off" should be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup > Search Queries" should be visible
    * "Search Information Popup > Future Versions Section" should not be visible

  @CU-43189
  Scenario: Verify that future versions toggle can be switched
    * I am logged in
    * I perform search of "*" on Laws & Regulations
    * "#1 of Documents" should be visible
    * "Future Versions Only Toggle Off" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "noFutVers"
    * I click "Future Versions Only Toggle Off"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "futVers"
    * "Future Versions Only Toggle On" should be visible
    * "{$futVers}" number should be less than "{$noFutVers}"

  @CU-43190
  Scenario Outline: Verify that topical canned search dropdown and future version button are disabled * input in search field
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    * I type "sdfsdfsdfsdf" in "Search Bar > Search Input"
    * "<elementToVerify>" should not be enabled
    * I click "<elementToVerify>"
    * "Feature Not Available Popup" should be visible
    * Text of "Feature Not Available Popup > Title" should be "FEATURE NOT AVAILABLE"
    * Text of "Feature Not Available Popup > Message" should be "This feature is not available from the dashboard for use with search terms, or the jurisdiction or document type filters. Please remove those selections from your search to use this feature."

    Examples:
      | elementToVerify                      |
      | Search Bar > Curated Search Dropdown |
      | Search Bar > Future Versions Button  |

  @CU-43191
  Scenario Outline: Verify that topical canned search dropdown and future version button are disabled * pre-search filters selected
    * I am logged in
    * I open base url with "#/home/PrimarySource"
    * "State Box" should be visible
    * I click "Search Bar > <filter> Dropdown"
    * "Search Bar > <filter> Dropdown > #1 of Items" should be visible
    * I remember number of "Search Bar > <filter> Dropdown > Items" as "number"
    * I remember random integer below "{$number}" as "index"
    * I click "Search Bar > <filter> Dropdown > #{$index} of Items"
    * I click "Search Bar > <filter> Dropdown"
    * "<elementToVerify>" should not be enabled
    * I click "<elementToVerify>"
    * "Feature Not Available Popup" should be visible
    * Text of "Feature Not Available Popup > Title" should be "FEATURE NOT AVAILABLE"
    * Text of "Feature Not Available Popup > Message" should be "This feature is not available from the dashboard for use with search terms, or the jurisdiction or document type filters. Please remove those selections from your search to use this feature."

    Examples:
      | filter        | elementToVerify                      |
      | Jurisdiction  | Search Bar > Curated Search Dropdown |
      | Document Type | Search Bar > Future Versions Button  |
      | Jurisdiction  | Search Bar > Curated Search Dropdown |
      | Document Type | Search Bar > Future Versions Button  |

  @CU-43192
  Scenario: Verify that notification popup is displayed * 0 Future Versions are not available for search query
    * I am logged in
    * I perform search of "Apollo" on Laws & Regulations
    * "#1 of Documents" should be visible
    * "Future Versions Toggle" should not be enabled
    * I click "Future Versions Only Toggle Off"
    * "Feature Not Available Popup" should be visible
    * Text of "Feature Not Available Popup > Title" should be "FEATURE NOT AVAILABLE"
    * Text of "Feature Not Available Popup > Message" should be "There are no future versions that match your search."

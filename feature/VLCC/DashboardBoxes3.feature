@smoke
@vlcc
@dashboard_boxes
Feature: Dashboard Boxes 3

  @CU-38808
  Scenario Outline: [VLCC] Verify opening of Topic List pages from Bankruptcy PA
    * I am logged in
    * I am on "Bankruptcy" PA
    * "Essentials Box" should be visible
    * "Essentials Box > Topics Link" should be visible
    * Text of "Essentials Box > Topics Link" should be "<linkText>" ignoring case
    * I click "Essentials Box > Topics Link"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<pageTitle>"

    Examples:
      | linkText                                   | pageTitle             |
      | BROWSE BANKRUPTCY CONTENT CURATED BY TOPIC | BANKRUPTCY ESSENTIALS |

  @CU-38809
  Scenario: [VLCC] Verify opening of topics from Bankruptcy Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/bke/Bankruptcy"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"
    * I wait until "Loading Indicator" is gone
    * I remember number of "Tax State Topics List > Topic Links" as "links"
    * I remember random integer below "{$links}" as "randomLink"
    * I remember text of "Tax State Topics List > #{$randomLink} of Topic Links" as "chosenTopic"
    * I click "Tax State Topics List > #{$randomLink} of Topic Links"
    * "Tax Topic Page" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$chosenTopic}" ignoring case ignoring punctuation marks
    * I click browser back button
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"

  @CU-38810
  Scenario: [VLCC] Verify UI elements of Bankruptcy Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/bke/Bankruptcy"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"
    * "Topics List Search Icon" should be visible
    * "Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."

  @CU-38811
  Scenario Outline: [VLCC] Verify that user is able to navigate to correct SRL by click on 'Search Results' on TLP doc opened from SRL after performing a Search within Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * I perform search of "<Search Term>"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search1"
    * I click "#3 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Results" should be visible
    * I click "Search Bar > Search Results"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "search2"
    * "{$search1}" number should be equal to "{$search2}"
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Text of "Search Bar > #1 of Search Pills > Text" should be "<Search Term>"

    Examples:
      | URL                            | List Title            | Search Term |
      | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | bank        |

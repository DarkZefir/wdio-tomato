@smoke
@mvl
@ipa
@search_within_tag_database
Feature: Search Withing TAG Database

  @CU-31815
  Scenario: Verify that 'Search or Browse within TAG FAQ database' content group is displayed on "TAG' PA
    * I am logged in
    * I am on "Technical Answer Group - TAG" PA
    * Text of "Search Within Tag Box > Label" should be "Search Term"
    * "Search Within Tag Box > Search Input" should be visible
    * Placeholder text for "Search Within Tag Box > Search Input" should be "Search Within TAG FAQ Database"
    * "Search Within Tag Box > Search Button" should be visible
    * Text of "Search Within Tag Box > Topics Dropdown > Button" should be "All Topics"
    * Text of "Search Within Tag Box > Browse Within The Topics Link" should be "Browse Within The Topics"
    * "Search Within Tag Box > Separator" should be visible
    * Text of "Search Within Tag Box > Separator" should be "- OR -"

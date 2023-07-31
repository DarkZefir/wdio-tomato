@smoke
@mvl
@ipa
@quick_reference_by_country
Feature: Quick Reference by Country

  @CU-31829
  Scenario: Verify UI elements of Quick Reference by Country List page
    * I am logged in
    * I open base url with "#/topics/browse/kitl/kluwertaxlaw/AT"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "QUICK REFERENCE BY COUNTRY"
    * "Topics List Search Icon" should be visible
    * "Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."
    * "Tax International Topics List Country > Topics Tree Container" should be visible
    * Text of "Tax International Topics List Country > Dropdown" should be "AUSTRIA"
    * Count of "Tax International Topics List Country > Box Titles" should be more than "0"
    * Count of "Tax International Topics List Country > Topic Links" should be more than "0"

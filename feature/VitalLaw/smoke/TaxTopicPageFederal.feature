@smoke
@mvl
@tax_topic_page_federal
Feature: Tax Topic Page Federal

  @CU-31508
  Scenario: Verify UI elements of Top Level Federal Topic Page
    * I am logged in
    * I open "tppc018dcd37347cb21000b76190b11c18cbab01" topics document
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * "Toolbar Buttons" should be visible
    * "Tax Topic Page > Favorite Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar > View In New Window" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Author Widget" should be visible
    * "Tax Topic Page > Recommended Topics Widget" should be visible
    * "Tax Topic Page > Overview Widget" should be visible
    * "Tax Topic Page > Citations Widget" should be visible

  @CU-31518
  Scenario: Verify UI elements of Bottom Level Federal Topic Page
    * I am logged in
    * I open "tppc015e8557467c6b1000943dd8d385ad169405" topics document
    * "Tax Topic Page > Topic Breadcrumbs" should be visible
    * "Toolbar Buttons" should be visible
    * "Tax Topic Page > Favorite Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar > View In New Window" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Author Widget" should be visible
    * "Tax Topic Page > Author Widget > #1 of Photo" should be visible
    * "Tax Topic Page > Author Widget > #1 of Name" should be visible
    * "Tax Topic Page > Recommended Topics Widget" should be visible
    * "Tax Topic Page > Overview Widget" should be visible
    * "Tax Topic Page > Key Primary Sources Widget" should be visible
    * "Tax Topic Page > Client Letters Widget" should be visible
    * "Tax Topic Page > Practice Aids Widget" should be visible
    * "Tax Topic Page > Forms Widget" should be visible
    * "Tax Topic Page > IRS Publications Widget" should be visible
    * "Tax Topic Page > Citations Widget" should be visible

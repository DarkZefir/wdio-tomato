@smoke
@mvl @vlcc
@document_view
Feature: Document View

  @CU-28996 @CU-32297
  Scenario: Verify elements of a toolbar panel for document opened from dashboard
    * I am logged in
    # Open document in Read View from dashboard
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    * "Document Frame > Document Content" should be visible
    # Verify that the following elements are displayed in doc's Toolbar on "Read" page
    * "Favorite Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * "Toolbar > Next Document Button" should be visible

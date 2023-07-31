@smoke
@mvl @vlcc @px
@document_view
Feature: Document View

  @CU-28991 @CU-32290 @CU-32941
  @ipa
  Scenario: Verify document content is displayed in reading pane
    * I am logged in
    * I open "lfl0109013e2c8457beb0 " document
    # Verify that Document Content is displayed when doc is opened in Read View
    * "Document Frame > Document Content" should be visible

  @CU-28993 @CU-32291 @CU-32952
  @ipa
  Scenario: Verify document title is displayed on reading pane
    * I am logged in
    * I open "lfl0109013e2c8457beb0" document
    * "Document Frame > Document Content" should be visible
    # Verify that Document's Title is displayed when doc is opened in Read View
    * "Document Frame > Title" should be visible

  @CU-28998 @CU-32298 @CU-32954
  Scenario: Verify elements of a toolbar panel for document opened from SRL
    * I am logged in
    # Perform search of "tax"
    * I perform search of "tax"
    # Open 2nd document from the list of results in Read View
    * I click "#2 of Documents"
    * "Document Frame > Document Content" should be visible
    # Verify that the following elements are displayed in doc's Toolbar on "Read" page
    * "Favorite Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar > Next Document Button" should be visible
    * "Toolbar > Previous Document Button" should be visible
    * "Toolbar > View In New Window" should be visible
    * "Toolbar > Previous Results Button" should be visible
    * "Toolbar > Next Results Button" should be visible
    * "Toolbar > Previous Highlight Button" should be visible
    * "Toolbar > Next Highlight Button" should be visible
    * "Toolbar > Highlight Checkbox" should be visible

  @CU-29011 @CU-32300 @CU-32962
  @ipa
  Scenario: Verify previous document from SRL opens in read view on clicking "previous result" control
    * I am logged in
    # Perform search of "tax"
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    # Remember title of 1st doc in results as "firstDoc"
    * I remember text of "#1 of Documents > Document Title" as "firstDoc"
    # Open 2nd doc from results in Read View
    * I click "#2 of Documents"
    * "Results Toolbar > Hit Count" should not be visible
    * I wait until "Loading Indicator" is gone
    # Click "Previous Result" button in Read View
    * I click "Toolbar > Previous Results Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    # Wait until other doc's content is loaded
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I wait 5 seconds
    # Open "Show Metadata" section
    * I click "Show Metadata"
    # Verify that "search-title" parameter corresponds 1st doc's title from "Results" page remembered as "{$secondDoc}"
    * I remember value of "search-title" metadata parameter as "metadataTitle"
    * "{$metadataTitle}" text should contain "{$firstDoc}" text ignoring whitespaces ignoring case

  @CU-29012 @CU-32301 @CU-32965
  @ipa
  Scenario: Verify document view opened in a new tab from SRL
    * I am logged in
    # Perform search of "law"
    * I perform search of "law"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    # Select "Open In New Tab" checkbox
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Click on 1st doc from results
    * I click "#1 of Documents"
    # Verify that doc is opened in new browser tab
    * I switch to last tab
    * "Document Frame > Document Content" should be visible

  @CU-29013 @CU-32302 @CU-32970
  Scenario: Verify elements of a toolbar panel for document opened in a new tab from SRL
    * I am logged in
    # Search for "tax" term
    * I perform search of "tax"
    * "Results Toolbar > Hit Count" should be visible
    * Count of "Documents" should be more than "0"
    # Select "Open In New Tab" checkbox
    * I click "Results Toolbar > Open In New Tab Checkbox"
    # Click on 2nd doc from results
    * I click "#2 of Documents"
    # Verify that doc is opened in new browser tab
    * I switch to last tab
    * "Document Frame > Document Content" should be visible
    # Verify that the following elements are present in opened doc's Toolbar:
    * "Favorite Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Quick Email Button" should be visible
    * "Toolbar > Next Document Button" should be visible
    * "Toolbar > Previous Document Button" should be visible
    * "Toolbar > Previous Results Button" should be visible
    * "Toolbar > Next Results Button" should be visible
    * "Toolbar > Previous Highlight Button" should be visible
    * "Toolbar > Next Highlight Button" should be visible
    * "Toolbar > Highlight Checkbox" should be visible

  @CU-29000 @CU-32303 @CU-32973
  @ipa
  Scenario: Verify search term / terms are highlighted in document body for docs opened from SRL
    * I am logged in
    # Perform search of "partnership" and open 1st doc from results in Read View
    * I perform search of "partnership"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    # Verify that search term findings are displayed highlighted in doc's content
    * Count of "Document Frame > Highlights" should be more than "0"

@smoke
@mvl @vlcc
@ipa
@contents_panel
Feature: Contents Panel

  @CU-31756 @CU-32408
  Scenario Outline: Verify that boxes with cross chairs are displayed in 'Contents' panel for all level nodes except documents' titles
    * I am logged in
    # Open <docId> document from examples
    * I open "<docId>" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember number of Collapsed Parent Nodes
    * I remember number of "Contents Tab > Collapsed Parent Node" as "parentNodes"
    # Verify that each Collapsed Parent Node has "Expand" ("+") button
    * Count of "Contents Tab > Collapsed Parent Node > Header > Expand Button" should be equal to "{$parentNodes}"
    # Verify that "Collapse" ("-") button is displayed next to First Expanded Parent Node
    * "Contents Tab > #1 of Expanded Parent Node > Expand Button" should be visible
    # Verify that all First level Child Nodes have "Expand" ("+") button
    * I remember number of "Contents Tab > Collapsed First Child Node" as "FirstNodes"
    * Count of "Contents Tab > Collapsed First Child Node > Header > Expand Button" should be equal to "{$FirstNodes}"
    # Verify that First Expanded Child Node has "Collapse" ("-") button
    * "Contents Tab > #1 of Expanded First Child Node > Expand Button" should be visible
    # Verify that all collapse Second level Child Nodes have "Expand" ("+") button
    * I remember number of "Contents Tab > Collapsed Second Child Node" as "SecondNodes"
    * Count of "Contents Tab > Collapsed Second Child Node > Header > Expand Button" should be equal to "{$SecondNodes}"
    # Verify that First Expanded 2d level Child Node has "Collapse" ("-") button
    * "Contents Tab > #1 of Expanded Second Child Node > Expand Button" should be visible
    * "Contents Tab > #1 of Expanded Second Child Node > #1 of Links" should be visible
    # Verify that doc title selected in 'Contents' panel ("Selected Link") corresponds to the doc title displayed in Read view
    * I remember text of "Contents Tab > #1 of Expanded Second Child Node > #1 of Links" as "docTitle"
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces
    * Text of "Contents Tab > Selected Link" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | docId            |
      | 09013e2c84b4442d |

  @CU-31766 @CU-32407
  Scenario Outline: Verify that expansion of elements in 'Contents' panel is not persistent when navigating to another publication
    * I am logged in
    # Search for <docIds> document
    * I perform search of "<docIds>"
    # Click #1 of docs from "Results" page
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    # Click Label of Second Collapsed Parent Node
    * I click "Contents Tab > #2 of Collapsed Parent Node > Header > Label"
    # Remember number of Expanded Parent Nodes as "expanded"
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "2"
    * I remember number of "Contents Tab > Expanded Parent Node" as "expanded"
    # Return to "Results" page by click on "Search Results" link in "Search Bar"
    * "Contents Tab > #Employee Benefit Plans in Expanded Parent Node" should be visible
    * I click "Search Bar > Search Results"
    # Click #2 of docs from "Results" page
    * I click "#2 of Documents"
    * "Document Frame > Document Content" should be visible
    * I click browser back button
    # Return to "Results" page by clicking browser "Back" button
    * "#1 of Documents" should be visible
    * I scroll to "#1 of Documents" element
    # Open #1 of Documents again
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Verify that previously expanded node is collapsed (number of expanded nodes is less than rememebred {$expanded})
    * Count of "Contents Tab > Expanded Parent Node" should be less than "$expanded"

    Examples:
      | docIds                                                                             |
      | sdv01ecf387487d131000a6bcd8d385ad169401 OR ipm0179b5e9687d51100091c70050568822f202 |
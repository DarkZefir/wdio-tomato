@smoke
@px
@contrents_panel
Feature: Contents Panel


  @CU-33147
  Scenario Outline: [PX] Verify that boxes with cross chairs are displayed in 'Contents' panel for all level nodes except documents' titles
    * I am logged in
    * I open "<docId>" document
    * "Contents Tab > #1 of Expanded Parent Node > Header" should be visible
    * I remember number of "Contents Tab > Collapsed Parent Node" as "parentNodes"
    * Count of "Contents Tab > Collapsed Parent Node > Header > Expand Button" should be equal to "{$parentNodes}"
    * "Contents Tab > #1 of Expanded Parent Node > Path Header > Collapse Button" should be visible
    * I remember number of "Contents Tab > Collapsed First Child Node" as "FirstNodes"
    * Count of "Contents Tab > Collapsed First Child Node > Header > Expand Button" should be equal to "{$FirstNodes}"
    * "Contents Tab > #1 of Expanded First Child Node > Path Header > Collapse Button" should be visible
    * "Contents Tab > #1 of Collapsed Second Child Node" should not be visible
    * I remember text of "Contents Tab > Selected Link" as "docTitle"
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | docId            |
      | 09013e2c844f416d |

  @CU-33149
  Scenario: [PX] Verify that all the nodes user expands in 'Contents' panel remain expanded until collapsed by a user
    * I am logged in
    * I open "mtg01844169ac7b581000a1b000237de5959c034" document
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "Trusts—Estates (Chapter 5)" ignoring case ignoring whitespaces
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "Taxation of Beneficiaries" ignoring case ignoring whitespaces
    * I click "Contents Tab > #Income (Chapter 7) in Collapsed Parent Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #Gross Income Defined in Collapsed First Child Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #1 of Expanded First Child Node > #1 of Links"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #Individuals (Chapter 1) in Collapsed Parent Node > Header > Label"
    * "Contents Tab > Loading Indicator" should not be present
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Individuals (Chapter 1)    |
      | Trusts—Estates (Chapter 5) |
      | Income (Chapter 7)         |
    * I should see the following lines in "Contents Tab > Expanded First Child Node > Header > Label" ignoring order:
      | Taxation of Beneficiaries |
      | Gross Income Defined      |
    * I click "Contents Tab > #Trusts—Estates (Chapter 5) in Expanded Parent Node > Header > Label"
    * I click "Contents Tab > #Gross Income Defined in Expanded First Child Node > Header > Label"
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Individuals (Chapter 1) |
      | Income (Chapter 7)      |
    * I click "Contents Tab > #Individuals (Chapter 1) in Expanded Parent Node > Header > Label"
    * I click "Contents Tab > #Income (Chapter 7) in Expanded Parent Node > Header > Label"
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible

  @CU-33142
  Scenario Outline: [PX] Verify that expansion of elements in 'Contents' panel is not persistent * navigating to another publication
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
    * "Contents Tab > #Benefits in Expanded Parent Node" should be visible
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
      | docIds                               |
      | 09013e2c875842a0 or 09013e2c875842a2 |

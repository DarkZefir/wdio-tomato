@smoke
@mvl
@ipa
@contents_panel
Feature: Contents Panel 1

  @CU-31761
  Scenario: Verify that all the nodes user expands in 'Contents' panel remain expanded until collapsed by a user
    * I am logged in
    # Open "ftn0109013e2c8432f97f" document
    * I open "ftn0109013e2c8432f97f" document
    # Verify that Label of First Expanded Parent Node contains "Gross Income" text
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "Gross Income" ignoring case ignoring whitespaces
    # Verify that Label of First Expanded Child Node of First Level contains "Items of Gross Income"
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "Items of Gross Income" ignoring case ignoring whitespaces
    # Verify that Label of First Expanded Child Node of Second Level contains "§3,005 Compensation for Services"
    * Text of "Contents Tab > #1 of Expanded Second Child Node > Path Header > Label" should contain "§3,005 Compensation for Services" ignoring case ignoring whitespaces
    # Click Collapsed Parent Node with "Quick Tax Facts" Label
    * I click "Contents Tab > #Quick Tax Facts in Collapsed Parent Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    # Click "2022 Quick Tax Facts" text in Collapsed Child Node of First Level
    * I click "Contents Tab > #2022 Quick Tax Facts in Collapsed First Child Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    # Click First link within Expanded Child Node of First Level
    * I click "Contents Tab > #1 of Expanded First Child Node > #1 of Links"
    * I move mouse over "Contents Tab > Root Title"
    # Click "What's New" label of Collapsed Parent Node
    * I click "Contents Tab > #What's New in Collapsed Parent Node > Header > Label"
    * "Contents Tab > #What's New in Expanded Parent Node" should be visible
    # Verify that that Expanded Parent Nodes have the following labels:
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Gross Income    |
      | Quick Tax Facts |
      | What's New      |
    # Verify that Expanded Nodes of First Level have the following labels:
    * I should see the following lines in "Contents Tab > Expanded First Child Node > Header > Label" ignoring order:
      | Items of Gross Income |
      | 2022 Quick Tax Facts  |
    # Verify that Expanded Child Node of Second level has the following label:
    * I should see the following lines in "Contents Tab > Expanded Second Child Node > Header > Label" ignoring order:
      | §3,005 Compensation for Services |
    # Click label of Exapanded Parent Node with "Gross Income" text
    * I click "Contents Tab > #Gross Income in Expanded Parent Node > Header > Label"
    # Click label of Expanded Child Node of First level with the "2022 Quick Tax Facts" text
    * I click "Contents Tab > #2022 Quick Tax Facts in Expanded First Child Node > Header > Label"
    # Verify that Expanded Parent Nodes with the following titles remained:
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Quick Tax Facts |
      | What's New      |
    # Click label of Expanded Parent Node with "Quick Tax Facts" text
    * I click "Contents Tab > #Quick Tax Facts in Expanded Parent Node > Header > Label"
    # Click label of Expanded Parent Node with "What's New" text
    * I click "Contents Tab > #What's New in Expanded Parent Node > Header > Label"
    # Verify that there are no Expanded Parent Nodes displayed in Contents Panel
    * "Contents Tab > #1 of Expanded Parent Node" should not be present

  @CU-31800
  Scenario Outline: Verify that next document from Search Results List is opened after click on 'Next search result' button in Utility bar
    * I am logged in
    # Search for <docIds> from examples
    * I perform search of "<docIds>"
    # Click #2 of Documents
    * I click "#2 of Documents"
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember text of "Selected Link" in "Contents" panel as "selectedLink"
    * "Contents Tab > Selected Link" should be visible
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    # Remember doc's title displayed in Read View
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click browser "Back" button
    * I click browser back button
    * "#1 of Documents" should be visible
    * I scroll to "#1 of Documents" element
    # Click First doc from results
    * I click "#1 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Click "Next Results" button in Toolbar
    * I click "Toolbar > Next Results Button"
    # Verify that initially opened document is opened: "Selected Link" text is remembered "{$selectedLink}"
    * Text of "Contents Tab > Selected Link" should be "$selectedLink"
    # Verify that doc's title in read view is initially remembered "{$docTitle}""
    * Text of "Document Frame > Title" should contain "$docTitle" ignoring case ignoring whitespaces

    Examples:
      | docIds                                                      |
      | irc0109013e2c83dca29a OR 86226fc67df310008833000d3a8abb4e01 |

  @CU-31801
  Scenario Outline: Verify that previous document from Search Results List is opened after click on 'Previous search result' button in Utility bar
    * I am logged in
    # Search for <docIds>
    * I perform search of "<docIds>"
    # Click #1 of documents in "Results" page
    * I click "#1 of Documents"
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    # Remember text of "Selected Link" in "Contents" panel
    * I remember text of "Contents Tab > Selected Link" as "selectedLink"
    # Remember doc's title text displayed in Read view
    * I remember text of "Document Frame > Title" as "docTitle"
    # Click browser "Back" button and verify that "Results" page is displayed
    * I click browser back button
    * "#2 of Documents" should be visible
    * I scroll to "#2 of Documents" element
    # Click #2 of Documents from "Results" page
    * I click "#2 of Documents"
    * "Contents Tab > Selected Link" should be visible
    # Click on "Previous Results" button in Toolbar
    * I click "Toolbar > Previous Results Button"
    # Wait until document is loaded and check that text of "Selected Link" corresponds to initially displayed "{$selectedLink}" when First opened doc
    * Text of "Contents Tab > Selected Link" should be "$selectedLink"
    # Verify that doc's title in Read view is initially remembered "{$docTitle}" of First opened doc
    * Text of "Document Frame > Title" should contain "$docTitle" ignoring case ignoring whitespaces

    Examples:
      | docIds                                                      |
      | irc0109013e2c83dca29a OR 86226fc67df310008833000d3a8abb4e01 |


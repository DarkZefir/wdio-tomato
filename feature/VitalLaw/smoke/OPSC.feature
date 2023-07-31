@smoke
@mvl
@opsc
Feature: On Platform Smart Charts

  @CU-31357
  Scenario: Verify UI elements of On Platform Smart Charts Template
    * I am logged in
    # Open "#/topics/browse/st/TaxStateAndLocal" url
    * I open base url with "#/topics/browse/st/TaxStateAndLocal"
    # Click "Property Factor" box title
    * "Tax State Topics List > #1 of Box Titles" should be visible
    * I click "Tax State Topics List > #Property Factor in Box Titles"
    # Click "Property Factor" link in "Smart Charts Widget"
    * I wait until "Loading Indicator" is gone
    * I click "Tax Topic Page > Smart Charts Widget > #Property Factor in Box Links"
    # Verify that "TAX - STATE & LOCAL" text is displayed in "Session Navigator"
    * Text of "Session Navigator > Session Navigator Tab" should be "TAX - STATE & LOCAL"
    * "Search Bar > Search Input" should be visible
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Nodes" should be visible
    # Verify that "Search Within Tax - State & Local" text is displayed in "Search" input field
    * Placeholder text for "Search Bar > Search Input" should be "Search Within Tax - State & Local"
    # Verify that the following elements are displayed on "Smart Charts" page:
    * "Search Bar > Advanced Search" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Help Icon" should be visible
    * "Search Bar > Citation Search Builder Button" should be visible
    * "Utility Bar" should be visible
    * "Utility Bar > Config Button" should be visible
    * "Utility Bar > Expand Icon" should be visible
    * "Utility Bar > Collapse Icon" should be visible
    * "Utility Bar > Rows Icon" should be visible
    * "Utility Bar > Columns Icon" should be visible
    * "Utility Bar > Calendar Icon" should be visible
    * "Utility Bar > Favorites Button" should be visible
    * "Utility Bar > Print Icon" should be visible
    * "Utility Bar > Download Icon" should be visible
    # Verify that "Results Nodes" are displayed
    * Count of "Results Nodes" should be more than "1"
    # Verify that number of column headers is 5
    * Count of "#1 of Results Nodes > Header Titles" should be equal to "5"
    # Remember text of Leaf Titles in First Node Header as "leaftitle"
    * I remember text of "#1 of Results Nodes > #1 of Section Titles > Leaf Title" as "leaftitle"
    # Verify texts of column headers
    * Text of "#1 of Results Nodes > #1 of Headers" should be "JURISDICTION"
    * Text of "#1 of Results Nodes > #2 of Headers" should be "$leaftitle" ignoring case
    * Text of "#1 of Results Nodes > #3 of Headers" should be "COMMENT"
    * Text of "#1 of Results Nodes > #4 of Headers" should be "CITATION"
    * Text of "#1 of Results Nodes > #5 of Headers" should be "CCH EXPLANATION"
    # Verify that each "Result Node" has "Info Icon"
    * I remember number of "Results Nodes" as "resultsNodesCount"
    * I remember number of "Results Nodes > Info Icon" as "infoIconCount"
    * "$resultsNodesCount" number should be equal to "$infoIconCount"

  @ipa
  @CU-31362
  Scenario: Verify UI elements of On Platform Smart Chart Search Results Box
    * I am logged in
    # Open "#/home/TaxStateAndLocal" url
    * I open base url with "#/home/TaxStateAndLocal"
    * "Search Bar > Search Input" should be visible
    # Search for "stock"
    * I perform search of "stock"
    # Verify that text of "Smart Chart Title Box" is "VitalLaw Smart Chart Results"
    * Text of "Smart Charts Title Box > Title" should be "VitalLaw Smart Chart Results"
    # Verify that "Topics Container" is displayed within "Smart Chart Title Box"
    * "Smart Charts Title Box > Topics Container" should be visible
    # Verify that number of topics in "Topics Container" is less than 7
    * Count of "Smart Charts Title Box > Topic Item" should be less than "7"
    # Verify that "Jurisdiction Container" is displayed within "Smart Charts Title Box"
    * "Smart Charts Title Box > Jurisdiction Container" should be visible
    # Remember number of Jurisdictions displayed in "Smart Charts Title Box" as "Jurisdictions#"
    * I remember number of "Smart Charts Title Box > Jurisdiction Item" as "Jurisdictions#"
    # Verify that Jurisdiction Container contains "{$Jurisdictions#}" text
    * Text of "Smart Charts Title Box > Jurisdiction Container" should contain "$Jurisdictions#"

  @ipa
  @CU-31365
  Scenario: Verify that On Platform Smart Chart is opened after click on OPSC Search Result Box
    * I am logged in
    # Open "#/home/Tax" url
    * I open base url with "#/home/Tax"
    * "Search Bar > Search Input" should be visible
    # Perform search of "stock"
    * I perform search of "stock"
    * "Smart Charts Title Box" should be visible
    # Remember number of jurisdictions displayed within "Smart Charts Title Box" as "Jurisdictions1"
    * I remember number of "Smart Charts Title Box > Jurisdiction Item" as "Jurisdictions1"
    # Click "Smart Charts Title Box"
    * I click "Smart Charts Title Box"
    # Verify that "TAX - ALL" text is displayed in Session Navigator
    * Text of "Session Navigator > Session Navigator Tab" should be "TAX - ALL"
    # Verify that "Search" input field is displayed
    * "Search Bar > Search Input" should be visible
    # Verify that "Utility Bar" is displayed
    * "Utility Bar" should be visible
    # Verify that "Results Nodes" are displayed
    * Count of "Results Nodes" should be more than "1"
    # Verify that "Info" icon is displayed in each "Result Node"
    * I remember number of "Results Nodes" as "resultsNodesCount"
    * I remember number of "Results Nodes > Info Icon" as "infoIconCount"
    * "$resultsNodesCount" number should be equal to "$infoIconCount"
    # Click "Config" button in "Utility Bar"
    * I click "Utility Bar > Config Button"
    # Verify that "Config Panel" overlay is displayed
    * "Config Panel Overlay" should be visible
    # Verify that number of selected states in "Config Panel" is the same as "{$Jurisdictions1}"
    * I remember number of "Config Panel > State Filter > Checked Items" as "Jurisdictions2"
    * "$Jurisdictions1" number should be equal to "$Jurisdictions2"

  @ipa
  @CU-31521
  Scenario: Verify opening of On Platform Smart Charts from the analytical section of TLP document
    * I am logged in
    # Open "tes01b4552fec7c6c1000942cd8d385ad169402" doc
    * I open "tes01b4552fec7c6c1000942cd8d385ad169402" topics document
    * I wait until "Loading Indicator" is gone
    # Click "taken on the federal return" link in Summary
    * I click "Tax Topic Page > #taken on the federal return in Summary Links"
    * I wait until "Loading Indicator" is gone
    # Verify that "Smart Charts" page is opened
    * "Smart Charts Header" should be visible

  @ipa
  @CU-32033
  Scenario: Verify OPSC box is displayed as a result on SRL
    * I am logged in
    # Search for "stock"
    * I perform search of "stock"
    # Verify that "Smart Charts Title Box" is displayed
    * "Smart Charts Title Box" should be visible

  @ipa
  @CU-32796
  Scenario: Verify opening of On Platform Smart Charts from 'Smart Charts' section of State TLP document
    * I am logged in
    # Open "tes01c67dcc7e7d251000a601d8d385ad169402" doc
    * I open "tes01c67dcc7e7d251000a601d8d385ad169402" topics document
    * I wait until "Loading Indicator" is gone
    # Click "Sales and Use Tax Drop Shipments" link within "Smart Charts" widget
    * I click "Tax Topic Page > Smart Charts Widget >#Sales and Use Tax Drop Shipments in Box Links"
    * I wait until "Loading Indicator" is gone
    # Verify that "Smart Charts" page is opened
    * "Smart Charts Header" should be visible

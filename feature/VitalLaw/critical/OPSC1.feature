@critical_path
@mvl
Feature: OPSC 1

  @CU-31545
  Scenario: Verify UI of 'Calendar' widget of On Platform Smart Charts Template
    * I am logged in
    * I open "tes01b48ff1cc7c6c1000925cd8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Calendar Icon" should be visible
    * I click "Utility Bar > Calendar Icon"
    * "Calendar Widget" should be visible
    * "Calendar Widget > X Button" should be visible
    * Text of "Calendar Widget > Title" should be "Highlight updates"
    * Text of "Calendar Widget > Description" should be "Select a date to highlight the updates made since that time."
    * "Calendar Widget > Left Navigation Button" should be visible
    * "Calendar Widget > Right Navigation Button" should be visible
    * "Calendar Widget > Year Month Button" should be visible
    * "Calendar Widget > #1 of Days Buttons" should be visible
    * "Calendar Widget > Current Date" should be visible
    * Count of "Calendar Widget > Days Buttons" should be equal to "42"
    * "Calendar Widget > Current Date" should be visible
    * I click "Calendar Widget > Year Month Button"
    * "Calendar Widget > Year Button" should be visible
    * "Calendar Widget > Left Navigation Button" should be visible
    * "Calendar Widget > Right Navigation Button" should be visible
    * "Calendar Widget > #1 of Month Buttons" should be visible
    * Count of "Calendar Widget > Month Buttons" should be equal to "12"
    * I click "Calendar Widget > Year Button"
    * "Calendar Widget > Year Button" should be visible
    * "Calendar Widget > #1 of Year Buttons" should be visible
    * Count of "Calendar Widget > Year Buttons" should be equal to "20"
    * I click "Calendar Widget > X Button"
    * "Calendar Widget" should not be visible

  @CU-31548
  Scenario: Verify highlighting of updates on On Platform Smart Charts Template
    * I am logged in
    * I open "tes01b48ff1cc7c6c1000925cd8d385ad169402" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * I click "Tax Topic Page > Smart Charts Widget > #1 of Box Links"
    * "Utility Bar > Calendar Icon" should be visible
    * I click "Utility Bar > Calendar Icon"
    * "Calendar Widget" should be visible
    * "Calendar Widget > Current Date" should be visible
    * I click "Calendar Widget > Current Date"
    * "Calendar Widget" should not be visible
    * "Utility Bar > Highlight Date Info" should be visible
    * Text of "Utility Bar > Highlight Date Info" should contain "0 changes since"
    * "Utility Bar > Clear Highlights Button" should be visible
    * I click "Utility Bar > Clear Highlights Button"
    * "Utility Bar > Highlight Date Info" should not be visible
    * I click "Utility Bar > Calendar Icon"
    * "Calendar Widget" should be visible
    * I click "Calendar Widget > Year Month Button"
    * I click "Calendar Widget > Year Button"
    * Text of "Calendar Widget > Year Button" should contain "2021 - 2040"
    * I click "Calendar Widget > Left Navigation Button"
    * I click "Calendar Widget > #2001 in Year Buttons"
    * I click "Calendar Widget > #December in Month Buttons"
    * I click "Calendar Widget > #15 in Days Buttons"
    * "Calendar Widget" should not be visible
    * "Utility Bar > Highlight Date Info" should be visible
    * Text of "Utility Bar > Highlight Date Info" should contain "changes since December 2001"
    * "Utility Bar > Clear Highlights Button" should be visible
    * "Updated Rows" should be visible
    * I click "Columns Icon"
    * "Vertical View" should be visible
    * "Utility Bar > Highlight Date Info" should be visible
    * Text of "Utility Bar > Highlight Date Info" should contain "changes since December 2001"
    * "Updated Columns" should be visible
    * Text of "#1 of Results Nodes > #1 of Section Titles > Highlight Updates" should contain "changes since December 2001"
    * I click "Utility Bar > Clear Highlights Button"
    * "Utility Bar > Highlight Date Info" should not be visible
    * "Updated Columns" should not be visible

  @CU-31556
  @local
  Scenario Outline: Verify that OPSC search result box reflects results with proper jurisdictions
    * I am logged in
    * I open base url with "#/home/TaxStateAndLocal"
    * "Search Bar > Search Input" should be visible
    * I perform search of "<search term>"
    * "Smart Charts Title Box" should be visible
    * Text of "Smart Charts Title Box > Jurisdiction Container" should be "<jurisdiction>"
    * I click "Smart Charts Title Box"
    * "Utility Bar > Config Button" should be visible
    * I click "Utility Bar > Config Button"
    * "Config Panel" should be visible
    * Value in "Config Panel > Topics Filter > Topic Search Input" should be ""
    * Text of all "Config Panel > State Filter > Selected Titles" should equal "<code>" ignoring whitespaces

    Examples:
      | search term                                 | jurisdiction                  | code     |
      | tax base ny                                 | 1 Jurisdiction(s): NY         | NY       |
      | tax base New York                           | 1 Jurisdiction(s): NY         | NY       |
      | stock al, ak, wy                            | 3 Jurisdiction(s): AL, AK, WY | AK AL WY |
      | Capital One Bank v. Commissioner of Revenue | 1 Jurisdiction(s): MA         | MA       |

  @CU-32801
  @local
  Scenario Outline: Verify that OPSC search result box reflects results with up to 6 leaf level titles
    * I am logged in
    * I open base url with "#/home/TaxStateAndLocal"
    * "Search Bar > Search Input" should be visible
    * I perform search of "<search term>"
    * "Smart Charts Title Box" should be visible
    * I remember text of "Smart Charts Title Box > Topics Container" as "titles"
    * I click "Smart Charts Title Box"
    * I remember text of "#1 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle1"
    * I remember text of "#2 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle2"
    * I remember text of "#3 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle3"
    * I remember text of "#4 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle4"
    * I remember text of "#5 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle5"
    * I remember text of "#6 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle6"
    * I remember text of "#7 of Results Nodes > Section Titles > Leaf Title" as "LeafTitle7"
    * "{$titles}" text should contain "{$LeafTitle1}" text
    * "{$titles}" text should contain "{$LeafTitle2}" text
    * "{$titles}" text should contain "{$LeafTitle3}" text
    * "{$titles}" text should contain "{$LeafTitle4}" text
    * "{$titles}" text should contain "{$LeafTitle5}" text
    * "{$titles}" text should contain "{$LeafTitle6}" text
    * "{$titles}" text should not contain "{$LeafTitle7}" text

    Examples:
      | search term       |
      | tax base ny       |
      | tax base New York |
      | stock al, ak, wy  |

  @CU-32865
  @local
  Scenario: Verify that after re-execution of search resulted with OPSC box, OPSC box is still displayed in Search Results List
    * I am logged in
    * I perform search of "Capital One Bank v. Commissioner of Revenue"
    * "Smart Charts Title Box" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I click "Save This Search Popup > Title"
    * I type "CU-32865" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * Count of "Saved Searches Popup > Items" should be equal to "1"
    * I click "Saved Searches Popup > #1 of Items > Name"
    * "Saved Searches Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Smart Charts Title Box" should be visible


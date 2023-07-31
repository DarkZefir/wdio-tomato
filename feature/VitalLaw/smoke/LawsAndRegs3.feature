@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegs3

  @CU-39824
  Scenario Outline: Verify that link "Show metadata" works in USC and CFR Documents for Laws&Regulations
    * I am logged in
    #Open any document from Federal boxes on Laws&Regs
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * I remember number of "#<Index> of Code Boxes > Items" as "numOfItems"
    * I click "#<Index> of Code Boxes > #{$randomInt(1, $numOfItems)} of Item Links"
    * "Document Frame > Document Content" should be visible
    #Verify that metadata can be opened
    * I click "Show Metadata"
    * I scroll to the bottom
    * "#1 of Metadata Pairs" should be visible
    #Verify that metadata can be closed
    * I click "Show Metadata"
    * "#1 of Metadata Pairs" should not be visible

    Examples:
      | Index |
      | 1     |
      | 2     |

  @CU-39825
  Scenario Outline: Verify that link "Show metadata" works in SS and SR Documents for Laws&Regulations
    * I am logged in
    #Open any document from State boxes on Laws&Regs
    * I click "Header > Laws And Regulations Button"
    * I wait until "Loading Indicator" is gone
    * I click "State Box > #<Index> of Tab Buttons"
    * I remember number of "State Box > Items" as "numOfItems"
    * I click "State Box > #{$randomInt(1, $numOfItems)} of Item Links"
    * "Document Frame > Document Content" should be visible
    #Verify that metadata can be opened
    * I click "Show Metadata"
    * I scroll to the bottom
    * "#1 of Metadata Pairs" should be visible
    #Verify that metadata can be closed
    * I click "Show Metadata"
    * "#1 of Metadata Pairs" should not be visible

    Examples:
      | Index |
      | 1     |
      | 2     |

  @CU-39826
  Scenario Outline: Verify that link "Show metadata" works in USC, CFR, SS, SR Documents * I search for a document using SRL for Laws&Regulations
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents" should be visible
    #Open First document
    * I click "#1 of Search Result Items > Link"
    * "Document Frame > Document Content" should be visible
    #Verify that metadata can be opened
    * I click "Show Metadata"
    * I scroll to the bottom
    * "#1 of Metadata Pairs" should be visible
    #Verify that metadata can be closed
    * I click "Show Metadata"
    * "#1 of Metadata Pairs" should not be visible

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 |

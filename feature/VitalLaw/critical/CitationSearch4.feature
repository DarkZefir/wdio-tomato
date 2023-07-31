@critical_path
@mvl
Feature: Citation Search 4

  @CU-32699
  Scenario Outline: Verify User is able to open document from Citation Lookup Search Results
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    # Perform search for a term from examples in Citation Lookup box
    * I type "<Term>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Citation Matches Header" should be visible
    # Verify that more than 1 Citation Result is displayed
    * Count of "Citation Results" should be more than "1"
    # Click on the first Citation Result
    * I click "#1 of Citation Results Title"
    * I wait until "Loading Indicator" is gone
    # Click on 'Show Metadata'
    * I click "Show Metadata"
    # Verify that doc frame contains the term from examples
    * Text of "Document Frame" should contain "<Term>" ignoring case ignoring whitespaces

    Examples:
      | PA            | Term    |
      | TAX - ALL     | 1.704-1 |
      | TAX - ALL     | sec.104 |
      | TAX - FEDERAL | sec.1   |

  @CU-32700
  Scenario Outline: Verify Citation Lookup Search that leads to Read view
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    # Perform search for a term from examples in Citation Lookup box
    * I type "<Term>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    # Click on 'Show Metadata'
    * I click "Show Metadata"
    # Verify that doc frame contains the term from examples
    * Text of "Document Frame" should contain "<Term>" ignoring whitespaces

    Examples:
      | PA        | Term          |
      | TAX - ALL | 31.3306(b)-1T |
      | TAX - ALL | 31.3221-1     |

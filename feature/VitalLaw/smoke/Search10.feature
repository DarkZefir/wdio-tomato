@smoke
@mvl
@search
Feature: Search 10

  @CU-42161
  Scenario Outline: Both AI and PCING content can be searched from All content
    * I am logged in
    # Perform search of all 5 types of docs
    * I perform search of "<AI> or <USC> or <CFR> or <SS> or <SR>"
    # Make sure that 5 docs are displayed in SRL
    * Text of "Results Toolbar > Hit Count" should be "5"

    Examples:
      | AI                                 | USC                                        | CFR                                         | SS                                         | SR                                          |
      | db4b88287e09100088f0000d3a8abb4e01 | us-law-17ad8ac7cd02c72594be33c891495eb5-v1 | us-regs-774e37c52c8c85c4349107644151c55a-v1 | fl-law-5432f650ebc558bacd0f717ee77bcfed-v1 | or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 |

  @CU-42162
  Scenario Outline: Filters panel is displayed properly when searching for both AI and PCING docs from All content
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Check filters panel
    * Text of "#1 of Filter Groups > Label" should be "PRACTICE AREAS"
    * Text of "#1 of Filter Groups > #1 of Filter Items" should be "<Filter1>"
    * Text of "#2 of Filter Groups > Label" should be "DOCUMENT TYPE"
    * Text of "#2 of Filter Groups > #1 of Filter Items" should be "<Filter2>"
    * Text of "#3 of Filter Groups > Label" should be "JURISDICTION"
    * Text of "#3 of Filter Groups > #1 of Filter Items" should be "<Filter3>"

    Examples:
      |     | searchTerm                                  | Filter1            | Filter2               | Filter3 |
      | AI  | db4b88287e09100088f0000d3a8abb4e01          | Family Law         | Other Content         | Federal |
      | USC | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | Laws & Regulations | Laws                  | Federal |
      | CFR | us-regs-774e37c52c8c85c4349107644151c55a-v1 | Laws & Regulations | Rules and Regulations | Federal |
      | SS  | fl-law-5432f650ebc558bacd0f717ee77bcfed-v1  | Laws & Regulations | Laws                  | State   |
      | SR  | or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1 | Laws & Regulations | Rules and Regulations | State   |

  @CU-42184
  Scenario Outline: Document type pre-search filters for L&R shows appropriate results and are displayed as pre-search filter pill in SRL
    * I am logged in
    # Click 'Advanced Search'
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    # Input search term which includes 4 types of L&R documents
    * I type "us-law-17ad8ac7cd02c72594be33c891495eb5-v1 or us-regs-774e37c52c8c85c4349107644151c55a-v1 or fl-law-5432f650ebc558bacd0f717ee77bcfed-v1 or or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1" in "Advanced Search Popup > Search Input"
    # Click 'Select filters'
    * I click "Advanced Search Popup > #1 of Presearch Filters > Title"
    # Click Document Type
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Presearch Filter Titles"
    # Click Laws / Rules and Regulations
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Filter Items > #<filter1> of Filter Item Level0 > Label"
    # Click Acts and Statutes / Final and Temporary Regulations
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Filter Items > #<filter2> of Filter Item Level1 > Input"
    # Click 'GO' button
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    # Check that number of results is 2
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "2"
    # Check that appropriate pre-search filter pill is displayed
    * Text of "Search Bar > #1 of Pre Search Filters" should contain "<value>"

    Examples:
      | filter1 | filter2 | value                           |
      | 8       | 1       | Acts and Statutes               |
      | 9       | 2       | Final and Temporary Regulations |

  @CU-42185
  Scenario Outline: Jurisdiction pre-search filters for L&R shows appropriate results and are displayed as pre-search filter pill in SRL
    * I am logged in
    # Click 'Advanced Search'
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    # Input search term which includes 4 types of L&R documents
    * I type "us-law-17ad8ac7cd02c72594be33c891495eb5-v1 or us-regs-774e37c52c8c85c4349107644151c55a-v1 or fl-law-5432f650ebc558bacd0f717ee77bcfed-v1 or or-regs-fd6342cfdb7623d3b70e0b4dcb1294a5-v1" in "Advanced Search Popup > Search Input"
    # Click 'Select filters'
    * I click "Advanced Search Popup > #1 of Presearch Filters > Title"
    # Click Jurisdiction
    * I click "Advanced Search Popup > #1 of Presearch Filters > #3 of Presearch Filter Titles"
    # Click Federal / State
    * I click "Advanced Search Popup > #1 of Presearch Filters > #3 of Filter Items > #<filter1> of Filter Item Level0 > Input"
    # Click 'GO' button
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    # Check that number of results is 2
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Results Toolbar > Hit Count" should be "2"
    # Check that appropriate pre-search filter pill is displayed
    * Text of "Search Bar > #1 of Pre Search Filters" should contain "<value>"

    Examples:
      | filter1 | value   |
      | 1       | Federal |
      | 2       | State   |

@critical_path
@mvl
Feature: Citation Search 3

  @CU-31175
  @logout
  Scenario: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that Home page is opened for user without Subscription to SEC - Federal
    # Login as 'kitlonly@wk.com' with 'password' password
    * I am logged in as "kitlonly@wk.com" with "password" password
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/securities-act-of-1933/11(b)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb"
    # Verify that Notice popup with 'We're sorry, we can't find the content you requested.' message is displayed
    * "Content Not Found Popup" should be visible
    * Text of "Content Not Found Popup" should match "We're sorry, we can't find the content you requested." ignoring whitespaces

  @CU-31178
  Scenario Outline: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that correct read page is opened for SEC Releases
    * I am logged in
    # Open the URL from examples
    * I open base url with "<parameters>"
    * I wait until "Loading Indicator" is gone
    # Click on 'Show Metadata'
    * I click "Show Metadata"
    # Verify that doc frame contains citation from examples
    * Text of "Document Frame" should contain "<citation>" ignoring whitespaces

    Examples:
      | parameters                                                                                   | citation |
      | ?extlink=/scion/citation-template/sec-releases/33\|\|8732&cpid=WKUS-Legal-Cheetah&cfu=TAA    | 33-8732  |
      | ?extlink=/scion/citation-template/sec-releases/40IA\|\|3341A&cpid=WKUS-Legal-Cheetah&cfu=TAA | 3341A    |

  @CU-31179
  Scenario: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that Citation Builder is opened for SEC Releases * No Results
    * I am logged in
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/sec-releases/40IC||3341A&cpid=WKUS-Legal-Cheetah&cfu=TAA"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * I remember index of "Citation Template Search Box > #2 of Citation Groups > Templates > Title" exactly matching "Release No." as "index"
    # Verify that error with 'No documents found for the citation entered. Please double check your entry.' is displayed
    * "Citation Template Search Box > #2 of Citation Groups > #{$index} of Templates > Error Message" should be visible
    * Text of "Citation Template Search Box > #2 of Citation Groups > #{$index} of Templates > Error Message" should match "No documents found for the citation entered. Please double check your entry." ignoring whitespaces
    # Verify that the input of the first field is '40IC' and the second is '3341A'
    * Value in "Citation Template Search Box > #2 of Citation Groups > #{$index} of Templates > #1 of Inputs" should be "40IC"
    * Value in "Citation Template Search Box > #2 of Citation Groups > #{$index} of Templates > #2 of Inputs" should be "3341A"

  @CU-32698
  Scenario Outline: Verify Citation Lookup Search with more than 1 results
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    # Perform search for a term from examples in Citation Lookup box
    * I type "<Term>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    * "Citation Matches Header" should be visible
    # Verify that more than 1 Citation Result is displayed and the search bar contains the term from examples
    * Count of "Citation Results" should be more than "1"
    * Text of "Search Bar" should contain "Citation Lookup: <Term>"

    Examples:
      | PA            | Term                         |
      | TAX - ALL     | IRC 1                        |
      | TAX - FEDERAL | IRS Press Release IR-2012-67 |
      | TAX - FEDERAL | Release IR-2012-67           |
      | TAX - FEDERAL | 1.355-1                      |
      | TAX - FEDERAL | 1                            |


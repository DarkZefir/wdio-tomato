@critical_path
@mvl
Feature: Citation Search1

  @CU-31719
  Scenario Outline: Citation by URL on LABOR & EMPLOYMENT LAW - Verify that correct read page is opened for Arbitrator awards
    * I am logged in
    # Open the URL from examples
    * I open base url with "<parameters>"
    * I wait until "Loading Indicator" is gone
    # Scroll down to the bottom and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    # Verify that doc frame contains the name from examples
    * Text of "Document Frame" should contain "<name>" ignoring whitespaces
    # Verify that 'da-id' value is 'WKUS_TAL_2086'
    * I should see "da-id" metadata parameter with "WKUS_TAL_2086" value

    Examples:
      | parameters                                                                                                                               | name          |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/will\|\|evans&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb     | willevans     |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/Harold\|\|jones&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb   | haroldjones   |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/Arvid\|\|Anderson&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | arvidanderson |

  @CU-31720
  Scenario Outline: Citation by URL on LABOR & EMPLOYMENT LAW - Verify that correct results page is opened for Arbitrator awards
    * I am logged in
    # Open the URL from examples
    * I open base url with "<parameters>"
    # Verify that more than 1 Citation Result is displayed
    * Count of "Citation Results" should be more than "1"
    * "Results Toolbar > Search Information Icon" should be clickable
    # Click on Info icon
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    # Verify that 'Arbitrator First Name <firstName> Last <lastName>' is displayed as Pre-search selection
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Arbitrator First Name <firstName> Last <lastName>" ignoring whitespaces

    Examples:
      | parameters                                                                                                                              | firstName | lastName |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/Robert\|\|Stein&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb  | Robert    | Stein    |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/Thomas\|\|Hewitt&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | Thomas    | Hewitt   |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/J\|\|Grant&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb       | J         | Grant    |
      | ?extlink=/scion/citation-template/labor-employment-arbitrators-name/Nathan\|\|Cayton&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | Nathan    | Cayton   |

  @logout
  @CU-31721
  Scenario: Citation by URL on LABOR & EMPLOYMENT LAW - Verify that Citation Builder is opened for Arbitrator awards * No Results
    * I am logged in
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/labor-employment-arbitrators-name/athan||cayton&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb"
    * "Citation Template Search Box > Loading Indicator" should not be visible
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * I remember index of "Citation Template Search Box > #1 of Citation Groups > Templates > Title" exactly matching "Arbitrator First Name" as "index"
    # Verify that error message 'No documents found for the citation entered. Please double check your entry.' is displayed
    * "Citation Template Search Box > #1 of Citation Groups > #{$index} of Templates > Error Message" should be visible
    * Text of "Citation Template Search Box > #1 of Citation Groups > #{$index} of Templates > Error Message" should match "No documents found for the citation entered. Please double check your entry." ignoring whitespaces
    # Verify that First Name input is 'athan' and Last Name input is 'cayton'
    * Value in "Citation Template Search Box > #1 of Citation Groups > #{$index} of Templates > #1 of Inputs" should be "athan"
    * Value in "Citation Template Search Box > #1 of Citation Groups > #{$index} of Templates > #2 of Inputs" should be "cayton"

  @CU-31722
  @logout
  Scenario: Citation by URL on LABOR & EMPLOYMENT LAW - Verify that Home page is opened for user without Subscription to PA
    # Login as 'kitlonly@wk.com' with 'password' password
    * I am logged in as "kitlonly@wk.com" with "password" password
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/labor-employment-arbitrators-name/Robert||Hoffman&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb"
    # Verify that Notice popup with 'We're sorry, we can't find the content you requested.' message is displayed
    * "Content Not Found Popup" should be visible
    * Text of "Content Not Found Popup" should match "We're sorry, we can't find the content you requested." ignoring whitespaces

  @CU-31723
  Scenario: Citation by URL on LABOR & EMPLOYMENT LAW - Verify that user is able to open doc from Results page
    * I am logged in
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/labor-employment-arbitrators-name/J||WILLIAMS&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb"
    # Verify that more than 1 Citation Result is displayed
    * Count of "Citation Results" should be more than "1"
    * "Results Toolbar > Search Information Icon" should be clickable
    # Click on the first Citation Result
    * I click "#1 of Citation Results"
    * I wait until "Loading Indicator" is gone
    # Click on 'Show Metadata'
    * I click "Show Metadata"
    # Verify that doc frame contains 'jwilliams'
    * Text of "Document Frame" should contain "jwilliams" ignoring whitespaces
    # Verify that 'da-id' value is 'WKUS_TAL_2086'
    * I should see "da-id" metadata parameter with "WKUS_TAL_2086" value

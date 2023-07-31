@critical_path
@mvl
Feature: Citation Search

  @CU-31172
  Scenario Outline: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that Results page is opened
    * I am logged in
    # Open the URL from examples
    * I open base url with "<parameters>"
    # Verify that more that 1 Citation Result is displayed
    * Count of "Citation Results" should be more than "1"
    * "Results Toolbar > Search Information Icon" should be clickable
    # Click on Info icon
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    # Verify that citation from examples is displayed as Pre-search selection
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "<citation>" ignoring whitespaces

    Examples:
      | parameters                                                                                                               | citation                             |
      | ?extlink=/scion/citation-template/securities-act-of-1933/11(b)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb        | Securities Act of 1933 §11(b)        |
      | ?extlink=/scion/citation-template/securities-exchange-act-of-1934/11&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb  | Securities Exchange Act of 1934 §11  |
      | ?extlink=/scion/citation-template/trust-indenture-act-of-1939/323&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb     | Trust Indenture Act of 1939 §323     |
      | ?extlink=/scion/citation-template/investment-company-act-of-1940/1&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb    | Investment Company Act of 1940 §1    |
      | ?extlink=/scion/citation-template/investment-advisers-act-of-1940/202&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | Investment Advisers Act of 1940 §202 |
      | ?extlink=/scion/citation-template/commodity-exchange-act/1&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb            | Commodity Exchange Act §1            |

  @CU-31174
  Scenario: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that user is able to open doc from Results page
    * I am logged in
    # Open the URL below
    * I open base url with "?extlink=/scion/citation-template/securities-act-of-1933/11(b)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb"
    # Verify that more that 1 Citation Result is displayed
    * Count of "Citation Results" should be more than "1"
    * "Results Toolbar > Search Information Icon" should be clickable
    # Click on the first Citation Result
    * I click "#1 of Citation Results"
    * I wait until "Loading Indicator" is gone
    # Verify that the title contains '11(b)'
    * Text of "Document Frame" should contain "11(b)"

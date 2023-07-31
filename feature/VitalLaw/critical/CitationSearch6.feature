@critical_path
@mvl
Feature: Citation Search 6

  @CU-31173
  Scenario Outline: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that Citation builder page is opened * no results
    * I am logged in
    # Open the URL from examples
    * I open base url with "<parameters>"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * I remember index of "Citation Template Search Box > #1 of Citation Groups > Templates" matching "<field>" as "actIndex"
    # Verify that error with 'No documents found for the citation entered. Please double check your entry.' is displayed
    * "Citation Template Search Box > #1 of Citation Groups > #{$actIndex} of Templates > Error Message" should be visible
    * Text of "Citation Template Search Box > #1 of Citation Groups > #{$actIndex} of Templates > Error Message" should match "No documents found for the citation entered. Please double check your entry." ignoring whitespaces
    # Verify that the input of the field from examples is equal to the value from examples
    * Value in "Citation Template Search Box > #1 of Citation Groups > #{$actIndex} of Templates > #1 of Inputs" should be "<value>"

    Examples:
      | parameters                                                                                                                                                 | field                                                       | value       |
      | ?extlink=/scion/citation-template/securities-act-of-1933/33&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                             | Securities Act of 1933 §                                    | 33          |
      | ?extlink=/scion/citation-template/securities-exchange-act-of-1934/111&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                   | Securities Exchange Act of 1934 §                           | 111         |
      | ?extlink=/scion/citation-template/trust-indenture-act-of-1939/z&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                         | Trust Indenture Act of 1939 §                               | z           |
      | ?extlink=/scion/citation-template/investment-company-act-of-1940/666&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                    | Investment Company Act of 1940 §                            | 666         |
      | ?extlink=/scion/citation-template/investment-advisers-act-of-1940/666&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                   | Investment Advisers Act of 1940 §                           | 666         |
      | ?extlink=/scion/citation-template/commodity-exchange-act/5gg&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                            | Commodity Exchange Act §                                    | 5gg         |
      | ?extlink=/scion/citation-template/dodd-frank-wall-street-reform-and-consumer-protection-act/13(a)(1)(A)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | Dodd-Frank Wall Street Reform and Consumer Protection Act § | 13(a)(1)(A) |
      | ?extlink=/scion/citation-template/sarbanes-oxley-act-of-2002/13(a)(1)(A)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                | Sarbanes-Oxley Act of 2002 §                                | 13(a)(1)(A) |
      | ?extlink=/scion/citation-template/securities-investor-protection-act-of-1970/133(a)(1)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                  | Securities Investor Protection Act of 1970 §                | 133(a)(1)   |


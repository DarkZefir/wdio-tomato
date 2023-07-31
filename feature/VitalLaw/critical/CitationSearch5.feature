@critical_path
@mvl
Feature: Citation Search 5

  @CU-31171
  Scenario Outline: Citation by URL on SECURITIES - FEDERAL & INTERNATIONAL - Verify that correct read page is opened
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    # Open the URL from examples
    * I open base url with "<parameters>"
    * "Header > Home" should be visible
    # Verify that doc frame contains the citation from examples
    * Text of "Document Frame" should contain "<citation>" ignoring whitespaces

    Examples:
      | parameters                                                                                                                                                  | citation     |
      | ?extlink=/scion/citation-template/securities-act-of-1933/27(a)(3)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                        | 27(a)(3)     |
      | ?extlink=/scion/citation-template/securities-exchange-act-of-1934/10B(a)(2)(A)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                           | 10B(a)(2)(A) |
      | ?extlink=/scion/citation-template/trust-indenture-act-of-1939/310(a)(1)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                  | 310(a)(1)    |
      | ?extlink=/scion/citation-template/investment-company-act-of-1940/6(a)(2)(B)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                              | 6(a)(2)(B)   |
      | ?extlink=/scion/citation-template/investment-advisers-act-of-1940/202(a)(1)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                              | 202(a)(1)    |
      | ?extlink=/scion/citation-template/commodity-exchange-act/5g&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                              | 5g           |
      | ?extlink=/scion/citation-template/dodd-frank-wall-street-reform-and-consumer-protection-act/802(a)(4)(B)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb | 802(a)(4)(B) |
      | ?extlink=/scion/citation-template/sarbanes-oxley-act-of-2002/302(a)(4)(A)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                                | 302(a)(4)(A) |
      | ?extlink=/scion/citation-template/securities-investor-protection-act-of-1970/13(c)(1)&cpid=WKUS-Legal-Cheetah&cfu=TAA&uAppContext=debweb                    | 13(c)(1)     |

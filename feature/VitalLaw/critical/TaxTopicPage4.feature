@critical_path
@mvl
Feature: Tax Topics List 4

  @CU-37688
  Scenario Outline: Verify that correspondent message is displayed when user with limited subscription tries to reach TLP doc by URL
    * I am logged in as "TLPuser@wk.com" with "password" password
    * I open base url with "<url>"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Title" should be "NOTICE"
    * Text of "Notice Popup > Notice Message" should be "We're sorry, we can't find the content you requested."
    Examples:
      | url                                                               |
      | #/topics/TaxFederal/tppc01864f589e7c6610009eaf90b11c18c90202      |
      | #/topics/TaxStateAndLocal/tes01c327ee367d681000a7d6005056881d2303 |
      | #/topics/TaxInternational/eb0284927cb51000a364d8d385ad169403      |

  @CU-37691
  Scenario Outline: Verify that search is executed within Tax Topic Pages if a user searches from a tax Topic Page
    * I am logged in
    * I open base url with "<url>"
    * I wait until "Loading Indicator" is gone
    * I perform search of "merger"
    * "Results Toolbar > Hit Count" should be visible
    * Text of "Search Bar" should contain "<Text>" ignoring case
    * Count of "#TAX ESSENTIALS in Filter Groups > Filter Items" should be equal to "1"
    * Text of "#TAX ESSENTIALS in Filter Groups > #1 of Filter Items" should be "<Topics>"
    * Count of "#DOCUMENT TYPE in Filter Groups > Filter Items" should be equal to "1"
    * Text of "#DOCUMENT TYPE in Filter Groups > #1 of Filter Items" should be "Topic Pages"
    * Count of "#JURISDICTION in Filter Groups > Filter Items" should be equal to "1"
    * Text of "#JURISDICTION in Filter Groups > #1 of Filter Items" should be "<Jurisdiction>"
    Examples:
      | url                                                               | Text                           | Topics               | Jurisdiction  |
      | #/topics/TaxFederal/tppc01864f589e7c6610009eaf90b11c18c90202      | Tax Essentials - Federal       | Federal Topics       | Federal       |
      | #/topics/TaxStateAndLocal/tes01c327ee367d681000a7d6005056881d2303 | Tax Essentials - State         | State Topics         | State         |
      | #/topics/TaxInternational/eb0284927cb51000a364d8d385ad169403      | Tax Essentials - International | International Topics | International |

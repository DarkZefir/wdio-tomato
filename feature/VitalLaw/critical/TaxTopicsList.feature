@critical_path
@mvl
Feature: Tax Topics List

  @CU-31160
  Scenario Outline: Verify that user is able to search by Federal/State/International Topic Pages title from Federal/State/International Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * I wait until "Loading Indicator" is gone
    * "Topics Search Result List > Topics List Container" should be visible
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * I wait 10 seconds
    * Text of "Topics Search Result List > Category" should contain "CATEGORY"
    * Each element of "Topics Search Result List > Topic Links" should contain "<Search Term>" ignoring case
    *  "Topics List Clear Search" should be visible
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | PA                           | URL                                                       | List Title                     | Search Term |
      | TAX - FEDERAL                | #/topics/browse/fed/TaxFederal                            | TAX ESSENTIALS - FEDERAL       | method      |
      | TAX - STATE & LOCAL          | #/topics/browse/st/TaxStateAndLocal                       | TAX ESSENTIALS - STATE         | factor      |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES | TAX ESSENTIALS - INTERNATIONAL | base        |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/MA                  | TAX ESSENTIALS - INTERNATIONAL | VAT         |
      | KLUWER INTERNATIONAL TAX LAW | #/topics/browse/kitl/kluwertaxlaw/VN                      | QUICK REFERENCE BY COUNTRY     | capital     |


  @CU-31187
  Scenario Outline: Verify that correct message is displayed when user executes a search by term with no matches on Federal/State/International Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * "Topics Search Result List > Topics List Container" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * Text of "Topics Search Result List > Category" should contain "CATEGORY"
    * "Topics Search Result List > No Results Message" should be visible
    * Text of "Topics Search Result List > No Results Message" should contain "There are no search results for the term"
    * Text of "Topics Search Result List > No Results Message" should contain "<Search Term>"
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | PA                           | URL                                                       | List Title                     | Search Term |
      | TAX - FEDERAL                | #/topics/browse/fed/TaxFederal                            | TAX ESSENTIALS - FEDERAL       | banking     |
      | TAX - STATE & LOCAL          | #/topics/browse/st/TaxStateAndLocal                       | TAX ESSENTIALS - STATE         | banking     |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES | TAX ESSENTIALS - INTERNATIONAL | account     |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/MA                  | TAX ESSENTIALS - INTERNATIONAL | count       |
      | KLUWER INTERNATIONAL TAX LAW | #/topics/browse/kitl/kluwertaxlaw/VN                      | QUICK REFERENCE BY COUNTRY     | count       |

  @CU-38487
  Scenario Outline: Verify that user is able to search by Bankruptcy Topic Pages title from Bankruptcy Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * "Topics Search Result List > Topics List Container" should be visible
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * Each element of "Topics Search Result List > Topic Links" should contain "<Search Term>" ignoring case
    *  "Topics List Clear Search" should be visible
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | PA         | URL                            | List Title            | Search Term |
      | BANKRUPTCY | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | bank        |

  @CU-38488
  Scenario Outline: Verify that correct message is displayed when user executes a search by term with no matches on Bankruptcy Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * "Topics Search Result List > Topics List Container" should be visible
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * "Topics Search Result List > No Results Message" should be visible
    * Text of "Topics Search Result List > No Results Message" should contain "There are no search results for the term"
    * Text of "Topics Search Result List > No Results Message" should contain "<Search Term>"
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | PA         | URL                            | List Title            | Search Term |
      | BANKRUPTCY | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | lalala      |

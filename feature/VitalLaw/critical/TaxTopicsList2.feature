@critical_path
@mvl
Feature: Tax Topics List 2

  @CU-31189
  Scenario Outline: Verify that results gained after usage of search filter on Federal/State/International Tax Topics List can be sorted by ascending/descending order
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * I wait until "Loading Indicator" is gone
    * "Topics Search Result List > #1 of Topic Links" should be visible
    * "Topics Search Result List > Sorting Icon" should be visible
    * Order of "Topics Search Result List > Topic Links" should be alphabetical
    * I click "Topics Search Result List > Sorting Icon"
    * Order of "Topics Search Result List > Topic Links" should be reverse alphabetical

    Examples:
      | PA                           | URL                                                       | List Title                     | Search Term |
      | TAX - FEDERAL                | #/topics/browse/fed/TaxFederal                            | TAX ESSENTIALS - FEDERAL       | gains       |
      | TAX - STATE & LOCAL          | #/topics/browse/st/TaxStateAndLocal                       | TAX ESSENTIALS - STATE         | tax         |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES | TAX ESSENTIALS - INTERNATIONAL | types       |
      | TAX - INTERNATIONAL          | #/topics/browse/intl/TaxInternational/BO                  | TAX ESSENTIALS - INTERNATIONAL | tax         |
      | KLUWER INTERNATIONAL TAX LAW | #/topics/browse/kitl/kluwertaxlaw/RO                      | QUICK REFERENCE BY COUNTRY     | tax         |
      | BANKRUPTCY                   | #/topics/browse/bke/Bankruptcy                            | BANKRUPTCY ESSENTIALS          | ns          |

  @CU-32440
  Scenario: Verify UI of IRC view on Federal List page
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By Topic"
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"
    * "Topics List Search Icon" should not be visible

  @CU-32441
  Scenario: Verify that topics that are displayed on IRC view contain IRC link in Key Primary Sourse
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > Mode Switch" should be visible
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > #Subtitle A—Income Taxes [Secs. 1-1563] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #CHAPTER 1—NORMAL TAXES AND SURTAXES [Secs. 1—1400Z-2] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #Subchapter A—Determination of Tax Liability [Secs. 1-59A] in Node Titles"
    * I click "Tax Federal Topics List > IRC Tree Content > #SEC. 1. TAX IMPOSED. in Node Titles"
    * "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #1 of IRC Links" should be visible
    * I click "Tax Federal Topics List > IRC Tree Content > IRC Topics List > #Capital Gains in IRC Links"
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Key Primary Sources in Table Of Contents Items"
    * "Tax Topic Page > Key Primary Sources Widget" should be visible
    * Text in collection of "Tax Topic Page > Key Primary Sources Widget > Links" should contain "§ 1., TAX IMPOSED."

  @CU-37689
  Scenario Outline: Verify that limited list of countries is displayed in 'Countries' drop down on 'International Tax Topics List'
    * I am logged in as "interlimit@wk.com" with "password" password
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Tax International Topics List Country > Dropdown"
    * "Tax International Topics List Country > #1 of Dropdown Items" should be visible
    * Text in collection of "Tax International Topics List Country > Dropdown Items" should contain "Austria"
    * Text in collection of "Tax International Topics List Country > Dropdown Items" should not contain "Israel"

    Examples:
      | URL                                                       |
      | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES |
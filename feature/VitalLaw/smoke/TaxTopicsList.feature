@smoke
@mvl
@tax_topics_list
Feature: Tax Topics List

  @ipa
  @CU-31348
  Scenario Outline: Verify opening of Topics Lists pages from Fed/State/International/Tax All PAs
    * I am logged in
    * I am on "<pa>" PA
    * "Browse Topics Box" should be visible
    * "Browse Topics Box > Browse Topics Link" should be visible
    * Text of "Browse Topics Box > Browse Topics Link" should be "<linkText>" ignoring case
    * I click "Browse Topics Box > Browse Topics Link"

    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<pageTitle>"
    * I wait until "Loading Indicator" is gone

    * I am on "Tax - All" PA
    * "Browse Topics Box" should be visible
    * Count of "Browse Topics Box > Browse Tax Links" should be equal to "3"
    * I click "Browse Topics Box > #<linkText> in Browse Tax Links"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<pageTitle>"

    Examples:
      | pa                  | linkText                                      | pageTitle                      |
      | Tax - Federal       | BROWSE FEDERAL CONTENT CURATED BY TOPIC       | TAX ESSENTIALS - FEDERAL       |
      | Tax - International | BROWSE INTERNATIONAL CONTENT CURATED BY TOPIC | TAX ESSENTIALS - INTERNATIONAL |
      | Tax - State & Local | BROWSE STATE CONTENT CURATED BY TOPIC         | TAX ESSENTIALS - STATE         |

  @logout
  @CU-31322
  Scenario Outline: Verify UI elements of Federal Topic List page
    * I am logged in as "<User>" with "password" password
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"
    * "Topics List Search Icon" should be visible
    * "Topics List Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * "Tax Federal Topics List > Mode Switch" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By IRC"
    * "Expand All" should be visible
    * "Collapse All" should be visible
    * I remember text of "Tax Federal Topics List > Top Level Node" as "titles"
    * "{$titles}" text should be equal to "<Subscription>" text

    Examples:
      | User                 | Subscription                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | tlpfedlrus@wk.com    | A CLOSER LOOK,ACCOUNTING METHODS AND PERIODS,BUSINESS DEDUCTIONS AND CREDITS,C CORPORATIONS,COMPENSATION AND BENEFITS,DEPRECIATION DEDUCTIONS,ESTATES, GIFTS, AND TRUSTS,HEALTHCARE,INCOME ITEMS,INDIVIDUAL AND NONBUSINESS DEDUCTIONS AND CREDITS,INDIVIDUALS,INTERNATIONAL TAXATION,LLCS,PARTNERSHIPS,RETIREMENT PLANS,S CORPORATIONS,SALES AND EXCHANGES,SPECIAL ENTITIES,TAX PRACTICE AND PROCEDURE                                   |
      | tlpfedlrusliq@wk.com | A CLOSER LOOK,ACCOUNTING METHODS AND PERIODS,BUSINESS DEDUCTIONS AND CREDITS,C CORPORATIONS,COMPENSATION AND BENEFITS,DEPRECIATION DEDUCTIONS,ESTATES, GIFTS, AND TRUSTS,HEALTHCARE,INCOME ITEMS,INDIVIDUAL AND NONBUSINESS DEDUCTIONS AND CREDITS,INDIVIDUALS,INTERNATIONAL TAXATION,LLCS,LIQUOR INDUSTRY TAXES AND CONTROL,PARTNERSHIPS,RETIREMENT PLANS,S CORPORATIONS,SALES AND EXCHANGES,SPECIAL ENTITIES,TAX PRACTICE AND PROCEDURE |
      | tlpfedliq@wk.com     | LIQUOR INDUSTRY TAXES AND CONTROL                                                                                                                                                                                                                                                                                                                                                                                                         |

  @CU-38489
  Scenario Outline: Verify opening of Topic List pages from Bankruptcy PA
    * I am logged in
    * I am on "Bankruptcy" PA
    * "Browse Topics Box" should be visible
    * "Browse Topics Box > Browse Topics Link" should be visible
    * Text of "Browse Topics Box > Browse Topics Link" should be "<linkText>" ignoring case
    * I click "Browse Topics Box > Browse Topics Link"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<pageTitle>"

    Examples:
      | linkText                                   | pageTitle             |
      | BROWSE BANKRUPTCY CONTENT CURATED BY TOPIC | BANKRUPTCY ESSENTIALS |

  @CU-38490
  Scenario: Verify opening of topics from Bankrupcy Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/bke/Bankruptcy"
    * "Topics List Title" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"
    * I click "Tax State Topics List > #7 of Topic Links"
    * I wait until "Tax Topic Page > Topic Title" is visible
    * Text of "Tax Topic Page > Topic Title" should be "CORPORATE BANKRUPTCY" ignoring case
    * I click browser back button
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"

  @CU-38491
  Scenario: Verify UI elements of Bankruptcy Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/bke/Bankruptcy"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "BANKRUPTCY ESSENTIALS"
    * "Topics List Search Icon" should be visible
    * "Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."

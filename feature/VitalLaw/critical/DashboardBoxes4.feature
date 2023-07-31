@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-29662
  Scenario Outline: Verify that "Tax Essentials" box is displayed on dashboards
    * I am logged in
    * I am on "<pa>" PA
    * "Essentials Box" should be visible
    * Text of "Essentials Box > Title" should be "TAX ESSENTIALS"
    Examples:
      | pa                  |
      | TAX - ALL           |
      | TAX - FEDERAL       |
      | TAX - INTERNATIONAL |
      | TAX - STATE & LOCAL |

  @CU-29663
  Scenario Outline: Verify that "Citation Lookup" box is displayed on dashboards
    * I am logged in
    * I am on "<pa>" PA
    * "Citation Lookup Box" should be visible
    * Text of "Citation Lookup Box > Header" should contain "CITATION LOOKUP"
    Examples:
      | pa                            |
      | TAX - ALL                     |
      | TAX - INTERNATIONAL           |
      | TAX - STATE & LOCAL           |
      | TAX - ESTATES, GIFTS & TRUSTS |

  @CU-29160
  Scenario: Verify that "Law Firm Blogs" box is displayed on Blockchain & Virtual Currencies PA dashboard
    * I am logged in
    * I am on "BLOCKCHAIN & VIRTUAL CURRENCIES" PA
    * "Law Firm Blogs Box" should be visible
    * Text of "Law Firm Blogs Box > Header" should be "LAW FIRM BLOGS"
    * "Law Firm Blogs Box > Customize" should be visible

  @CU-38486
  Scenario: Verify that "Bankruptcy Essentials" box is displayed on Bankruptcy PA dashboard
    * I am logged in
    * I am on "BANKRUPTCY" PA
    * "Essentials Box" should be visible
    * Text of "Essentials Box > Title" should be "BANKRUPTCY ESSENTIALS"

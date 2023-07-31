@smoke
@mvl
@dashboard
Feature: Dashboard

  @ipa
  @CU-31549
  Scenario: Verify UI of All Content
    * I am logged in
    # Verify that "White Papers And Special Reports Box" is visible and has "WHITE PAPERS & SPECIAL REPORTS" title
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box" should be visible
    # Verify that the following boxes are also visible
    * "Need Help Box" should be visible
    * "Practice Areas Box" should be visible
    * "Vitallaw Resources Box" should be visible
    * "Ukraine Crisis Box" should be visible

  @ipa
  @CU-31551
  Scenario: Verify List of PAs in All Content Practice Areas box
    * I am logged in
    * I am on "All content" PA
    # Verify that "Practice Areas Box" with "RACTICE AREAS" title is visible
    * "Practice Areas Box" should be visible
    * Text of "Practice Areas Box > Title" should be "PRACTICE AREAS"
    # Verify that links the following links are displayed in "Practice Areas Box"
    * I should see the following lines in "Practice Areas Box > Practice Area Links":
      | Antitrust & Competition                   |
      | Banking & Consumer Finance                |
      | Bankruptcy                                |
      | Blockchain & Virtual Currencies           |
      | Blue Chip                                 |
      | COVID-19 Resources                        |
      | Cybersecurity & Privacy                   |
      | Elder & Estates Law                       |
      | Energy & Environment                      |
      | Family Law                                |
      | Government Contracts                      |
      | Health Reform Knowledge Center            |
      | Healthcare                                |
      | Human Resources                           |
      | Intellectual Property                     |
      | IP - WK Trademark Navigator               |
      | Kluwer International Tax Law              |
      | Labor & Employment Law                    |
      | Life Sciences                             |
      | Litigation                                |
      | Payroll & Entitlements                    |
      | Pension & Employee Benefits               |
      | Practice of Law                           |
      | Products Liability & Insurance            |
      | Property & Construction Law               |
      | Scion Reference Publications              |
      | Securities - All                          |
      | Securities - Corporation Law & Governance |
      | Securities - Federal & International      |
      | Securities - State                        |
      | Sexual Harassment & Workplace Compliance  |
      | Tax - All                                 |
      | Tax - Estates, Gifts & Trusts             |
      | Tax - Federal                             |
      | Tax - International                       |
      | Tax - State & Local                       |
      | Technical Answer Group - TAG              |
      | Telecommunications                        |
      | Transportation                            |

  @ipa
  @CU-31571
  Scenario: Verify VitalLaw Resources on All Content
    * I am logged in
    * I am on "All content" PA
    # Verify that "VitalLaw Resources Box" is displayed on "All Content" page
    * "Vitallaw Resources Box" should be visible
    # Verify presence of the following elements in "VitalLaw Resoures Box":
    * Text of "Vitallaw Resources Box > Title" should be "VITALLAW RESOURCES"
    * Count of "Vitallaw Resources Box > Links" should be equal to "3"
    * Text of "Vitallaw Resources Box > #1 of Links" should be "VitalLaw Widgets"
    * Text of "Vitallaw Resources Box > #2 of Links" should be "MARC Records and Product Titles with Links"
    * Text of "Vitallaw Resources Box > #3 of Links" should be "VitalLaw Practice Area Information"
    # Verify texts of href attributes of links in "VitalLaw Resources Box"
    * I remember "href" attribute of "Vitallaw Resources Box > #1 of Links" as "url1"
    * "{$url1}" text should contain "https://www.wolterskluwer.com/en/solutions/vitallaw-law-firms/vitallaw-widgets" text
    * I remember "href" attribute of "Vitallaw Resources Box > #2 of Links" as "url2"
    * "{$url2}" text should contain "https://marc.wolterskluwerlr.com" text
    * I remember "href" attribute of "Vitallaw Resources Box > #3 of Links" as "url3"
    * "{$url3}" text should contain "https://www.wolterskluwer.com/en/solutions/legal-regulatory" text

  @ipa
  @CU-31572
  Scenario: Verify White Papers box on All Content
    * I am logged in
    # * I remember index of "White Papers And Special Reports Box > Title" matching "WHITE PAPERS & SPECIAL REPORTS" as "index"
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button" should be visible
    # Verify that 4 links are displayed in "White Papers And Special Reports Box"
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > #1 of Links" should be visible
    * Count of "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > Links" should be equal to "4"
    # Verify that texts of the links displayed in "White Papers And Special Reports Box" are the following:
    * I should see the following lines in "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > Links" ignoring order:
      | Top Tax Law Developments for April–June 2022                           |
      | Fierce opposition to SEC's sweeping climate regulations                |
      | Disclosure requirements: a guide to SEC's climate risk proposal        |
      | WilmerHale: bipartisan and bicameral comprehensive privacy legislation |

    # Verify texts of href attributes of links displayed in "White Papers And Special Reports Box"
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > Links" urls should contain the following lines:
      | business.cch.com/AllContentPageWhitePapers/Tax_devs_apr_jun_22.pdf             |
      | business.cch.com/AllContentPageWhitePapers/Securities_climate_battle_emerg.pdf |
      | business.cch.com/AllContentPageWhitePapers/Securities_climate_risk_prop.pdf    |
      | business.cch.com/AllContentPageWhitePapers/Securities_compr_priv_leg.pdf       |

  @ipa
  @CU-31574
  Scenario: Verify need help box on All Content
    * I am logged in
    * I am on "All content" PA
    # Verify that "Need Help" box is displayed on "All Content" page
    * "Need Help Box" should be visible
    # Verify the following elements In "Need Help" box
    * Text of "Need Help Box > Header" should be "NEED HELP?"
    * "Need Help Box > View Online Help Link" should be visible
    * "Need Help Box > #1 of Access Training And Reference Material Link" should be visible
    * "Need Help Box > #1 of Email Customer Support Link" should be visible
    * "Need Help Box > #1 of Call Customer Support" should be visible
    * Text of "Need Help Box > Header" should be "NEED HELP?"
    * Text of "Need Help Box > View Online Help" should be "View online help"
    * Text of "Need Help Box > View Online Help Link" should be "online help"
    * Text of "Need Help Box > #1 of Access Training And Reference Material" should be "Access training and reference material"
    * Text of "Need Help Box > #1 of Access Training And Reference Material Link" should be "training and reference material"
    # Verify texts of links and their href attributes:
    * I remember "href" attribute of "Need Help Box > #1 of Access Training And Reference Material Link" as "url1"
    * "{$url1}" text should be equal to "https://www.wolterskluwer.com/en/solutions/legal-regulatory/training-support" text
    * Text of "Need Help Box > #1 of Email Customer Support" should be "Email customer support: vitallawsupport@wolterskluwer.com"
    * Text of "Need Help Box > #1 of Email Customer Support Link" should be "vitallawsupport@wolterskluwer.com"
    * I remember "href" attribute of "Need Help Box > #1 of Email Customer Support Link" as "url2"
    * "{$url2}" text should be equal to "mailto:vitallawsupport@wolterskluwer.com" text
    # Verify text of "Call Customer Support"
    * Text of "Need Help Box > #1 of Call Customer Support" should be "Call customer support: 1-800-955-5217"

  @logout
  @CU-31573
  Scenario: Verify absence of White papers on All Content for CRN user
    # Log in as "kitlonly@wk.com" user
    * I am logged in as "kitlonly@wk.com" with "password" password
    * I am on "All content" PA
    # Verify that "White Papers And Special Reports" boxes are not displayed for the "kitlonly@wk.com" user
    * "#1 of White Papers And Special Reports Box" should not be present

  @logout
  @CU-31576
  Scenario: Verify Need Help Box and Absence of White Papers on All Content Dashboard for CRN user
    # Log in as "kitlonly@wk.com" user
    * I am logged in as "kitlonly@wk.com" with "password" password
    * I am on "All content" PA
    # Verify that "Need Help" box is displayed with the following items:
    * "Need Help Box" should be visible
    * Text of "Need Help Box > Header" should be "NEED HELP?"
    * Text of "Need Help Box > View Online Help" should be "View online help"
    * Text of "Need Help Box > View Online Help Link" should be "online help"
    * Text of "Need Help Box > #1 of Access Training And Reference Material" should be "Access training and reference material"
    * Text of "Need Help Box > #1 of Access Training And Reference Material Link" should be "training and reference material"
    # Vefify url of the 1st link in "Need Help" box
    * I remember "href" attribute of "Need Help Box > #1 of Access Training And Reference Material Link" as "url1"
    * "{$url1}" text should be equal to "https://www.wolterskluwer.com/en/solutions/legal-regulatory/training-support" text
    # Verify text of "Email Customer Support"
    * Text of "Need Help Box > #1 of Email Customer Support" should be "Email customer support: vitallawsupport@wolterskluwer.com"
    * Text of "Need Help Box > #1 of Email Customer Support Link" should be "vitallawsupport@wolterskluwer.com"
    # Verify url of link of "Email Customer Support"
    * I remember "href" attribute of "Need Help Box > #1 of Email Customer Support Link" as "url2"
    * "{$url2}" text should be equal to "mailto:vitallawsupport@wolterskluwer.com" text
    # Verify text of "Call Customer Support"
    * Text of "Need Help Box > #1 of Call Customer Support" should be "Call customer support: +1 800-261-3111 (option 1)"
    # Verify url of "Email Customer Support" link
    * I remember "href" attribute of "Need Help Box > #1 of Email Customer Support Link" as "supportEmailLink"
    * "{$supportEmailLink}" text should contain "mailto:vitallawsupport@wolterskluwer.com" text
    # Verify that "Compliance Resource Network Support" title and elements under it
    * Text of "Need Help Box" should contain "Compliance Resource Network Support"
    * Text of "Need Help Box" should contain "View online help"
    * Text of "Need Help Box" should contain "Register for Online Training"
    # Verify "For product access and billing inquiries:" block under "Compliance Resource Network Support" title
    * Text of "Need Help Box" should contain "For product access and billing inquiries:"
    * Text of "Need Help Box > #2 of Call Customer Support" should be "800-261-3111 Select Option 3"
    * Text of "Need Help Box" should contain "7am-6pm Central Time"
    * Text of "Need Help Box > #2 of Email Customer Support" should contain "or Email: CustomerSupportSecurities@wolterskluwer.com"
    * Text of "Need Help Box > #2 of Email Customer Support Link" should be "CustomerSupportSecurities@wolterskluwer.com"
    * I remember "href" attribute of "Need Help Box > #2 of Email Customer Support Link" as "supportEmailLink2"
    * "{$supportEmailLink2}" text should contain "mailto:CustomerSupportSecurities@wolterskluwer.com" text
    # Verify "For technical support inquiries:" block under "Compliance Resource Network Support" title
    * Text of "Need Help Box" should contain "For technical support inquiries:"
    * Text of "Need Help Box > #3 of Call Customer Support" should be "800-261-3111 Select Option 1 then Select Option 4 (for CRN)"
    * Text of "Need Help Box" should contain "8am-6pm Eastern Time"
    * Text of "Need Help Box > #3 of Email Customer Support" should contain "or Email: OneSumXCPMSupport@wolterskluwer.com"
    * Text of "Need Help Box > #3 of Email Customer Support Link" should be "OneSumXCPMSupport@wolterskluwer.com"
    * I remember "href" attribute of "Need Help Box > #3 of Email Customer Support Link" as "supportEmailLink3"
    * "{$supportEmailLink3}" text should contain "mailto:OneSumXCPMSupport@wolterskluwer.com" text
    # Verify that "Capital Changes Support" title is present
    * Text of "Need Help Box" should contain "Capital Changes Support"
    # Verify "For product access and billing inquiries:" block under "Capital Changes Support" title
    * Text of "Need Help Box" should contain "For product access and billing inquiries:"
    * Text of "Need Help Box > #4 of Call Customer Support" should be "800-261-3111 Select Option 3"
    * Text of "Need Help Box" should contain "7am-6pm Central Time"
    * Text of "Need Help Box > #4 of Email Customer Support" should contain "or Email: CustomerSupportSecurities@wolterskluwer.com"
    * Text of "Need Help Box > #4 of Email Customer Support Link" should be "CustomerSupportSecurities@wolterskluwer.com"
    * I remember "href" attribute of "Need Help Box > #4 of Email Customer Support Link" as "supportEmailLink4"
    * "{$supportEmailLink4}" text should contain "mailto:CustomerSupportSecurities@wolterskluwer.com" text
    # Verify "For technical support inquiries:" block under "Capital Changes Support" title
    * Text of "Need Help Box" should contain "For technical support inquiries:"
    * Text of "Need Help Box > #5 of Call Customer Support" should be "888-904-5550"
    * Text of "Need Help Box" should contain "8am-6pm Eastern Time"
    * Text of "Need Help Box > #5 of Email Customer Support" should contain "or Email: GKECustomerSupport@wolterskluwer.com"
    * Text of "Need Help Box > #5 of Email Customer Support Link" should be "GKECustomerSupport@wolterskluwer.com"
    * I remember "href" attribute of "Need Help Box > #5 of Email Customer Support Link" as "supportEmailLink5"
    * "{$supportEmailLink5}" text should contain "mailto:GKECustomerSupport@wolterskluwer.com" text

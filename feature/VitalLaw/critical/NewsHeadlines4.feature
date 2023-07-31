@critical_path
@mvl
Feature: News Headlines 4

  @CU-30893
  Scenario: Verify that "CYBERSECURITY POLICY REPORT" content group is displayed on 'Cybersecurity & Privacy' PA
    * I am logged in
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "CYBERSECURITY POLICY REPORT"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #1 of SubSections > Sign Up" should be visible

  @CU-30964
  @logout
  Scenario: Verify that 'CYBERSECURITY POLICY REPORT' and "GLOBAL CYBERSECURITY DEVELOPMENTS" boxes are NOT displayed on 'Cybersecurity & Privacy' PA for user without subscription to corresponding DAs
    * I am logged in as "hrkclimit@wk.com" with "password" password
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "Session Navigator > Session Navigator Tab" should be visible
    * Text of "Session Navigator > Session Navigator Tab" should be "CYBERSECURITY & PRIVACY"
    * Text in collection of "News Headlines Box > SubSections > SubHeaders" should not contain "GLOBAL CYBERSECURITY DEVELOPMENTS" ignoring case
    * Text in collection of "News Headlines Box > SubSections > SubHeaders" should not contain "CYBERSECURITY POLICY REPORT" ignoring case

  @CU-29449
  Scenario: Verify that "News Headlines" box is displayed on Tax - Estates, Gifts & Trusts PA dashboard
    * I am logged in
    * I am on "TAX - ESTATES, GIFTS & TRUSTS" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "FEDERAL TAX DAY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "STATE TAX DAY"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"

  @CU-31054
  Scenario Outline: Verify that correct document is opened from 'Blog' box on "KITL" PA
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * Text of "#2 of News Headlines Box > Header Title" should be "BLOG"
    * I click "<link>"
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "WKUS_TAL_18664" value

    Examples:
      | link                                                                           |
      | #2 of News Headlines Box > #1 of SubSections > #1 of Links                     |
      | #2 of News Headlines Box > #1 of SubSections > #2 of Links                     |
      | #2 of News Headlines Box > #1 of SubSections > #3 of Links                     |
      | #2 of News Headlines Box > #1 of SubSections > #1 of SubHeaders                |
      | #2 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons |

  @CU-29129
  Scenario: Verify that "News Headlines" box is displayed on Antitrust & Competition PA dashboard
    * I am logged in
    * I am on "ANTITRUST & COMPETITION" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "ANTITRUST LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29144
  Scenario: Verify that "News Headlines" box is displayed on Banking & Consumer Finance PA dashboard
    * I am logged in
    * I am on "BANKING & CONSUMER FINANCE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "BANKING AND FINANCE LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29519
  Scenario: Verify that "News Headlines" box is displayed on Tax - State & Local PA dashboard
    * I am logged in
    * I am on "TAX - STATE & LOCAL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "STATE TAX DAY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29430
  Scenario: Verify that "News Headlines" box is displayed on Sexual Harassment & Workplace Compliance PA dashboard
    * I am logged in
    * I am on "SEXUAL HARASSMENT & WORKPLACE COMPLIANCE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "SEXUAL HARASSMENT NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29479
  Scenario: Verify that "News Headlines" box is displayed on Tax - Federal PA dashboard
    * I am logged in
    * I am on "TAX - FEDERAL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "FEDERAL TAX DAY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

@smoke
@vlcc
@dashboard
Feature: Dashboard 3

  @CU-34234
  Scenario Outline: [VLCC] Verify that "News Headlines" widget is displayed on specific PAs
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header" should contain "NEWS HEADLINES"
    * Text of "#1 of News Headlines Box > Header" should contain "Sign Up"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "6"
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "<Title>"
    * "#1 of News Headlines Box > Customize" should not be visible

    Examples:
      | Practice Area                             | Title                         |
      | All Content                               | CORPORATE COUNSEL DAILY       |
      | Banking                                   | BANKING AND FINANCE LAW DAILY |
      | Corporate Governance                      | SECURITIES REGULATION DAILY   |
      | Food, Drugs & Cosmetics / Medical Devices | HEALTH LAW DAILY              |
      | HR, Employment and Labor                  | LABOR & EMPLOYMENT LAW DAILY  |
      | Intellectual Property                     | IP LAW DAILY                  |
      | Sexual Harassment & Workplace Compliance  | SEXUAL HARASSMENT NEWS        |
      | Torts                                     | PRODUCTS LIABILITY LAW DAILY  |
      | Trade & Advertising                       | ANTITRUST LAW DAILY           |

  @CU-34236
  Scenario: [VLCC] Verify that "News Headlines" widget is displayed on "Cybersecurity & Privacy" PA
    * I am logged in
    * I open base url with "#/home/Privacy"
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "CYBERSECURITY POLICY REPORT"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #1 of SubSections > Sign Up" should be visible
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "GLOBAL CYBERSECURITY DEVELOPMENTS"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * "#1 of News Headlines Box > #2 of SubSections > Customize" should not be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #2 of SubSections > Sign Up" should be visible

  @CU-42497
  Scenario: [VLCC] Verify that "News Headlines" widget is displayed on "Bankruptcy" PA
    * I am logged in
    * I open base url with "#/home/Bankruptcy"
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR BANKRUPTCY: US & GLOBAL"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > Header SignUp" should be visible

  @CU-42498
  Scenario: [VLCC] Verify that "News Headlines" widget is displayed on "Securities - Federal" PA
    * I am logged in
    * I open base url with "#/home/SecuritiesFederal"
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "SECURITIES REGULATION DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #1 of SubSections > Sign Up" should be visible
    * "#1 of News Headlines Box > #2 of SubSections > Customize" should not be visible
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR SECURITIES: US & GLOBAL"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #2 of SubSections > Sign Up" should be visible

@smoke
@vlcc
@dashboard
Feature: Dashboard 4

  @CU-34246
  Scenario Outline: [VLCC] Verify that correct tab in 'News' overlay is opened * user clicks on 'Sign up' link on "News Headlines" widget
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * I click "<Section>"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "<Tab>"

    Examples:
      | Practice Area                             | Section                                                | Tab         |
      | All Content                               | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Banking                                   | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Corporate Governance                      | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Food, Drugs & Cosmetics / Medical Devices | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Health Care                               | #1 of News Headlines Box > #1 of SubSections > Sign Up | DAILIES     |
      | Health Care                               | #1 of News Headlines Box > #2 of SubSections > Sign Up | NEWSLETTERS |
      | HR, Employment and Labor                  | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Intellectual Property                     | #1 of News Headlines Box > Header SignUp               | DAILIES     |

  @CU-34250
  Scenario: [VLCC] Verify that user can perform search from Sample Forms widget (with drop down)
    * I am logged in
    * I open base url with "#/home/SecuritiesFederal"
    * "Sample Forms Box" should be visible
    * I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    * I click "Sample Forms Box > #1 of Dropdowns"
    * "Sample Forms Box > #1 of Dropdowns > #5 of Items" should be visible
    * I remember number of "Sample Forms Box > #1 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" as "randomlinks"
    * I click "Sample Forms Box > #1 of Dropdowns > #{$randomlinks} of Items"
    * I wait until "Loading Indicator" is gone
    * I type "tax" in "Sample Forms Box > Search Term Input"
    * "Sample Forms Box > Search Button" should be clickable
    * I click "Sample Forms Box > Search Button"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup" should contain "Document Type: Sample Forms"

  @CU-42499
  Scenario: [VLCC] Verify that "News Headlines" widget is displayed on "Health Care" PA
    * I am logged in
    * I open base url with "#/home/HealthCare"
    * I wait until "#1 of News Headlines Box > #1 of SubSections" is visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "HEALTH LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #1 of SubSections > Sign Up" should be visible
    * "#1 of News Headlines Box > #2 of SubSections > Customize" should not be visible
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR HEALTHCARE: US & GLOBAL"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #2 of SubSections > Sign Up" should be visible

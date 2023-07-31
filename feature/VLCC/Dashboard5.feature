@smoke
@vlcc
@dashboard
Feature: Dashboard 5

  @CU-34332
  Scenario Outline: [VLCC] Verify that correct tab in 'News' overlay is opened when user clicks on 'Sign up' link on "News Headlines" widget 2
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * I click "<Section>"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "<Tab>"

    Examples:
      | Practice Area                            | Section                                                | Tab         |
      | Securities - Federal                     | #1 of News Headlines Box > #1 of SubSections > Sign Up | DAILIES     |
      | Securities - Federal                     | #1 of News Headlines Box > #2 of SubSections > Sign Up | NEWSLETTERS |
      | Sexual Harassment & Workplace Compliance | #1 of News Headlines Box > Header SignUp               | NEWSLETTERS |
      | Torts                                    | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Trade & Advertising                      | #1 of News Headlines Box > Header SignUp               | DAILIES     |
      | Cybersecurity & Privacy VLCC             | #1 of News Headlines Box > #1 of SubSections > Sign Up | DAILIES     |
      | Cybersecurity & Privacy VLCC             | #1 of News Headlines Box > #2 of SubSections > Sign Up | NEWSLETTERS |

  @CU-34248
  Scenario Outline: [VLCC] Verify that correct DA is opened when user clicks on News Headlines widget Title
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box" should be visible
    * I click "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons"
    * I wait until "Loading Indicator" is gone
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                | Daid           |
      | COVID-19 Resources           | WKUS_TAL_19546 |
      | Cybersecurity & Privacy VLCC | WKUS_TAL_16517 |
      | Health Care                  | WKUS_TAL_6444  |
      | All Content                  | WKUS_TAL_17896 |
      | Securities - Federal         | WKUS_TAL_6445  |

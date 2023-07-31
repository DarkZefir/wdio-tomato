@smoke
@vlcc
@dashboard
Feature: Dashboard 10

  @CU-34249
  Scenario Outline: [VLCC] Verify that correct DA is opened when user clicks any link on News Headlines widget
    * I am logged in
    * I am on "<Practice Area>" PA
    * "#1 of News Headlines Box" should be visible
    * I remember number of "#1 of News Headlines Box > #<Index> of SubSections > Links" as "links"
    * I click "#1 of News Headlines Box > #<Index> of SubSections > #{$randomInt(1, $links)} of Links"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I should see "da-id" metadata parameter with "<Daid>" value

    Examples:
      | Practice Area                | Daid           | Index |
      | Cybersecurity & Privacy VLCC | WKUS_TAL_16517 | 1     |
      | All Content                  | WKUS_TAL_17896 | 1     |
      | Securities - Federal         | WKUS_TAL_6445  | 1     |
      | Securities - Federal         | WKUS_TAL_20137 | 2     |
      | COVID-19 Resources           | WKUS_TAL_19546 | 1     |
      | Bankruptcy                   | WKUS_TAL_20135 | 1     |
      | Health Care                  | WKUS_TAL_6444  | 1     |
      | Health Care                  | WKUS_TAL_20136 | 2     |

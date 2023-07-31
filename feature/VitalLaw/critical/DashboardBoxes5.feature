@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-37394
  Scenario Outline: Verify that the user can perform search from "Sample Forms" widget on different dashboards
    * I am logged in
    * I am on "<PA>" PA
    * "Sample Forms Box" should be visible
    * Text of "Sample Forms Box > Title" should be "SAMPLE FORMS"
    * I type "tax" in "Sample Forms Box > Search Term Input"
    * I click "Sample Forms Box > Search Button"
    * "Sample Forms Box" should not be visible
    * I wait until "Loading Indicator" is gone
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Pre Search Selections Group" should be "Pre-Search Selections Practice Area: <PA> Sample Forms Filtered By Document Type: Sample Forms" ignoring whitespaces ignoring punctuation marks
    Examples:
      | PA                                        |
      | Bankruptcy                                |
      | Family Law                                |
      | Intellectual Property                     |
      | Labor & Employment Law                    |
      | Litigation                                |
      | Pension & Employee Benefits               |
      | Practice of Law                           |
      | Securities - All                          |
      | Securities - Corporation Law & Governance |
      | Securities - Federal & International      |

@critical_path
@mvl
Feature: Dashboard

  @CU-28706
  Scenario: Verify that Citation Search Template (Citation Builder) is displayed and accessible from the 'TAG' PA
    * I am logged in
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * "Search Bar > Citation Search Builder Button" should be visible
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * Text of "Citation Template Search Box > Header" should contain "TECHNICAL ANSWER GROUP - TAG"
    * "Citation Template Search Box > X Close Button" should be visible
    * I click "Citation Template Search Box > X Close Button"
    * "Header" should be visible

  @CU-29448
  Scenario: Verify that "Practice Tools" box is displayed on Tax - Estates, Gifts & Trusts PA dashboard
    * I am logged in
    * I am on "TAX - ESTATES, GIFTS & TRUSTS" PA
    * "Practice Tools Box" should be visible
    * Text of "Practice Tools Box > Header" should be "PRACTICE TOOLS"
    * "Practice Tools Box > Customize" should be visible
    * Text in collection of "Practice Tools Box > Practice Tools Types Title" should contain "FEDERAL"
    * Text in collection of "Practice Tools Box > Practice Tools Types Title" should contain "MULTISTATE"
    * Text in collection of "Practice Tools Box > Practice Tools Types Title" should contain "INTELLIFORMS"

  @CU-35709
  Scenario: Verify that "News Headlines" box is displayed on COVID-19 Resources dashboard
    * I am logged in
    * I am on "COVID-19 Resources" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "COVID-19 NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "10"


  @CU-35748
  Scenario Outline: Verify dropdowns in "Useful Links" box on Covid-19 PA
    * I am logged in
    * I am on "COVID-19 Resources" PA
    * "Covid Useful Links Box" should be visible
    * Text of "Covid Useful Links Box > Header Title" should be "COVID-19 RESOURCES"
    * Count of "Covid Useful Links Box > Links Groups" should be equal to "10"
    * Text of "Covid Useful Links Box > #<box> of Links Groups Titles" should be "<title>"
    * Text of "Covid Useful Links Box > #<lab> of Links Groups Dropdowns > Label" should be "SELECT"
    Examples:
      | box | lab | title                                           |
      | 1   | 1   | BACK TO OFFICE EXPERT ANALYSIS & LEGAL INSIGHTS |
      | 2   | 2   | BACK TO OFFICE RESOURCES                        |
      | 5   | 3   | INTERNATIONAL                                   |
      | 6   | 4   | LEGAL INSIGHTS FROM LAW FIRMS                   |
      | 7   | 5   | AGENCY GUIDANCE                                 |


  @CU-35749
  Scenario: Verify that See All overlay contains more than 3 links on Covid-19 PA
    * I am logged in
    * I am on "COVID-19 Resources" PA
    * "Covid Useful Links Box" should be visible
    * I remember number of "Covid Useful Links Box > Links Groups See All" as "All"
    * I click "Covid Useful Links Box > #{$randomInt(1, $All)} of Links Groups See All"
    * "See All Popup" should be visible
    * Count of "See All Popup > Links" should be more than "3"

  @CU-35747
  Scenario: Verify that Links number through Useful Links dropdowns is more than 0 on Covid-19 PA
    * I am logged in
    * I am on "COVID-19 Resources" PA
    * "Covid Useful Links Box" should be visible
    * I remember number of "Covid Useful Links Box > Links Groups > Links" as "Links count"
    * I remember number of "Covid Useful Links Box > Links Groups Dropdowns" as "amount"
    * I remember random integer below "{$amount}" as "drops"
    * I click "Covid Useful Links Box > #{$drops} of Links Groups Dropdowns"
    * I remember number of "Covid Useful Links Box > #{$drops} of Links Groups Dropdowns > Items" as "values"
    * "Covid Useful Links Box > #{$drops} of Links Groups Dropdowns > #2 of Items" should be visible
    * I click "Covid Useful Links Box > #{$drops} of Links Groups Dropdowns > #{$randomInt(2, $values)} of Items"
    * Count of "Covid Useful Links Box > Links Groups > Links" should be more than "{$Links count}"

  @CU-35753
  Scenario Outline: Verify flat lists in "Useful Links" box on Covid-19 PA
    * I am logged in
    * I am on "COVID-19 Resources" PA
    * "Covid Useful Links Box" should be visible
    * Text of "Covid Useful Links Box > Header Title" should be "COVID-19 RESOURCES"
    * Count of "Covid Useful Links Box > Links Groups" should be equal to "10"
    * Text of "Covid Useful Links Box > #<num> of Links Groups Titles" should be "<title>"
    * Count of "Covid Useful Links Box > #<title> in Links Groups > Links" should be more than "0"
    Examples:
      | num | title                                 |
      | 3   | WHITE PAPERS & STRATEGIC PERSPECTIVES |
      | 4   | LEGISLATION                           |
      | 8   | FAQS                                  |
      | 9   | OTHER WOLTERS KLUWER RESOURCES        |
      | 10  | 3RD PARTY LINKS                       |

@critical_path
@mvl
Feature: News Headlines 1

  @CU-29218
  Scenario: Verify that "News Headlines" box is displayed on HRKC PA dashboard
    * I am logged in
    * I am on "HEALTH REFORM KNOWLEDGE CENTER" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "HEALTH REFORM EDGE"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29240
  Scenario: Verify that "News Headlines" box is displayed on Healthcare PA dashboard
    * I am logged in
    * I am on "HEALTHCARE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "HEALTH LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#2 of News Headlines Box" should be visible
    * Text of "#2 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#2 of News Headlines Box > Header SignUp" should be visible
    * Text of "#2 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR HEALTHCARE: US & GLOBAL"
    * "#2 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * "#2 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#2 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"

  @CU-29260
  Scenario: Verify that "News Headlines" box is displayed on Intellectual Property PA dashboard
    * I am logged in
    * I am on "INTELLECTUAL PROPERTY" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "IP LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29277
  Scenario: Verify that "News Headlines" box is displayed on WKTN PA dashboard
    * I am logged in
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "TRADEMARK DAILY NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible


  @CU-29306
  Scenario: Verify that "News Headlines" box is displayed on Labor & Employment Law PA dashboard
    * I am logged in
    * I am on "LABOR & EMPLOYMENT LAW" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "LABOR & EMPLOYMENT LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29329
  Scenario: Verify that "News Headlines" box is displayed on Life Sciences PA dashboard
    * I am logged in
    * I am on "LIFE SCIENCES" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "HEALTH LAW DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29372
  Scenario: Verify that "News Headlines" box is displayed on Products Liability & Insurance PA dashboard
    * I am logged in
    * I am on "PRODUCTS LIABILITY & INSURANCE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "PRODUCT LIABILITY DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29585
  Scenario: Verify that "News Headlines" box is displayed on Securities - All PA dashboard
    * I am logged in
    * I am on "SECURITIES - ALL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "SECURITIES REGULATION DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29390
  Scenario: Verify that "News Headlines" box is displayed on Securities - Corporation Law & Governance PA dashboard
    * I am logged in
    * I am on "SECURITIES - CORPORATION LAW & GOVERNANCE" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should not be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "CORPORATION LAW & GOVERNANCE NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-29413
  Scenario: Verify that "News Headlines" box is displayed on Securities - Federal & International PA dashboard
    * I am logged in
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "SECURITIES REGULATION DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#2 of News Headlines Box" should be visible
    * Text of "#2 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#2 of News Headlines Box > Header SignUp" should be visible
    * Text of "#2 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR SECURITIES: US & GLOBAL"
    * "#2 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * "#2 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#2 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
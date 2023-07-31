@critical_path
@mvl
Feature: News Headlines

  @CU-30912
  Scenario: Verify that 'Dailies' tab in 'News' overlay is opened when user clicks on 'Sign up' link on "CYBERSECURITY POLICY REPORT" content group
    * I am logged in
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "#1 of News Headlines Box > #1 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "CYBERSECURITY POLICY REPORT"
    * I click "#1 of News Headlines Box > #1 of SubSections > Sign Up"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "DAILIES"

  @CU-30898
  Scenario: Verify that 'Newsletters' tab in 'News' overlay is opened when user clicks on 'Sign up' link "GLOBAL CYBERSECURITY DEVELOPMENTS" content group
    * I am logged in
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "#1 of News Headlines Box > #2 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "GLOBAL CYBERSECURITY DEVELOPMENTS"
    * I click "#1 of News Headlines Box > #2 of SubSections > Sign Up"
    * "News Popup" should be visible
    * Text of "News Popup > Active Tab" should be "NEWSLETTERS"

  @CU-29292
  Scenario: Verify that "News Headlines" box is displayed on KITL PA dashboard
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "GLOBAL DAILY TAX NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "TRANSFER PRICING DAILY"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #3 of SubSections > #1 of SubHeaders" should be "GLOBAL VAT NEWS"
    * "#1 of News Headlines Box > #3 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #3 of SubSections > Links" should be equal to "3"

  @CU-29665
  Scenario: Verify that "News Headlines" box is displayed on Tax - All PA dashboard
    * I am logged in
    * I am on "TAX - ALL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "FEDERAL TAX DAY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "GLOBAL DAILY TAX NEWS"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #3 of SubSections > #1 of SubHeaders" should be "TRANSFER PRICING DAILY"
    * "#1 of News Headlines Box > #3 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #3 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #4 of SubSections > #1 of SubHeaders" should be "GLOBAL VAT NEWS"
    * "#1 of News Headlines Box > #4 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #4 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #5 of SubSections > #1 of SubHeaders" should be "STATE TAX DAY"
    * "#1 of News Headlines Box > #5 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #5 of SubSections > Links" should be equal to "3"

  @CU-29499
  Scenario: Verify that "News Headlines" box is displayed on Tax - International PA dashboard
    * I am logged in
    * I am on "TAX - INTERNATIONAL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "GLOBAL DAILY TAX NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "TRANSFER PRICING DAILY"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #3 of SubSections > #1 of SubHeaders" should be "GLOBAL VAT NEWS"
    * "#1 of News Headlines Box > #3 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #3 of SubSections > Links" should be equal to "3"

  @CU-29525
  Scenario: Verify that "News Headlines" box is displayed on Telecommunications PA dashboard
    * I am logged in
    * I am on "TELECOMMUNICATIONS" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "TR DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "TR STATE NEWSWIRE"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"

  @CU-29586
  Scenario: Verify that "News Headlines" box is displayed on Securities - All PA dashboard
    * I am logged in
    * I am on "SECURITIES - ALL" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "SECURITIES REGULATION DAILY"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"

  @CU-29293
  Scenario: Verify that "Blog" box is displayed on KITL PA dashboard
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "#2 of News Headlines Box > Header Title" should be visible
    * Text of "#2 of News Headlines Box > Header Title" should be "BLOG"
    * Text of "#2 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should contain "KLUWER INTERNATIONAL TAX BLOG"
    * "#2 of News Headlines Box > Header SignUp" should not be visible
    * Count of "#2 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
    * "#2 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Text of "#2 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be "READ ALL POSTS"

  @CU-30894
  Scenario: Verify that "GLOBAL CYBERSECURITY DEVELOPMENTS" content group is displayed on 'Cybersecurity & Privacy' PA
    * I am logged in
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "#1 of News Headlines Box > #2 of SubSections" should be visible
    * Text of "#1 of News Headlines Box > #2 of SubSections > #1 of SubHeaders" should be "GLOBAL CYBERSECURITY DEVELOPMENTS"
    * "#1 of News Headlines Box > #2 of SubSections > #1 of Read All Articles Buttons" should be visible
    * "#1 of News Headlines Box > #2 of SubSections > Customize" should be visible
    * Count of "#1 of News Headlines Box > #2 of SubSections > Links" should be equal to "3"
    * "#1 of News Headlines Box > #2 of SubSections > Sign Up" should be visible

  @CU-28542
  Scenario: Verify that 'News Headlines' box is displayed on 'TAG' PA
    * I am logged in
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Customize" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "TAG NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "10"

  @CU-42495
  Scenario: Verify that 'News Headlines' box is displayed on 'BANKRUPTCY' PA
    * I am logged in
    * I am on "BANKRUPTCY" PA
    *  "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "NEWS HEADLINES"
    * "#1 of News Headlines Box > Header SignUp" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > Customize" should not be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "LAW FIRM PERSPECTIVES FOR BANKRUPTCY: US & GLOBAL"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * Count of "#1 of News Headlines Box > #1 of SubSections > Links" should be equal to "3"
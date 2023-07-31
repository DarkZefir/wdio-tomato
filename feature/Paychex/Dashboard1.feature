@smoke
@px
@dashboard
Feature: Dashboard 1

  @CU-33232
  @logout
  Scenario: [PX] Verify List of items in Tools box on Home Page
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Tools Box" should be visible
    * Text of "Px Tools Box > Title" should be "TOOLS"
    * "Px Tools Box > Customize" should be visible
    * Count of "Px Tools Box > Links" should be equal to "6"
    * I should see the following lines in "Px Tools Box > Links":
      | HR and Payroll Interactive Forms           |
      | Calculators                                |
      | Sales and Use Tax Rate Changes Smart Chart |
      | SST State Taxability Matrices Smart Charts |
      | State and Federal Employment Law Compare   |
      | Paychex Mobile News Central                |
    * "Px Tools Box > Paychex Mobile News Central Link Email Icon" should be visible
    * "Px Tools Box > Paychex Mobile News Central Link Copy Icon" should be visible

  @CU-33234
  @logout
  Scenario: [PX] Verify 'Copy Link' overlay is displayed after clicking Copy URL icon on Tools Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Tools Box" should be visible
    * I click "Px Tools Box > Paychex Mobile News Central Link Copy Icon"
    * "Copy Link Popup" should be visible
    * "Copy Link Popup > X Close Button" should be visible
    * Text of "Copy Link Popup > Title" should be "COPY LINK"
    * Text of "Copy Link Popup > Sub Title" should be "PAYCHEX MOBILE NEWS CENTRAL"
    * Text of "Copy Link Popup > Copied Link" should be "https://mobile.cch.com/cchnewsmobile/?Style=148277"
    * I click "Copy Link Popup > OK Button"
    * "Copy Link Popup" should not be visible

  @CU-33235
  Scenario: [PX] Verify Latest News Box on Home Page
    * I am logged in
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > Header Title" should be "LATEST NEWS"
    * "#1 of News Headlines Box > Header SignUp" should not be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "PAYCHEX NEWS"
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Links" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible

  @CU-33236
  Scenario: [PX] Verify correct document is opened on clicking Latest News Box title
    * I am logged in
    * "#1 of News Headlines Box" should be visible
    * Text of "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders" should be "PAYCHEX NEWS"
    * I click "#1 of News Headlines Box > #1 of SubSections > #1 of SubHeaders"
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "WKUS_TAL_18645" value

  @CU-33237
  Scenario: [PX] Verify correct document is opened on clicking link from Latest News Box
    * I am logged in
    * "#1 of News Headlines Box" should be visible
    * I remember number of "#1 of News Headlines Box > #1 of SubSections > Links" as "links"
    * I remember random integer below "{$links}" as "randomLink"
    * I remember text of "#1 of News Headlines Box > #1 of SubSections > #{$randomLink} of Links" as "linkText"
    * I click "#1 of News Headlines Box > #1 of SubSections > #{$randomLink} of Links"
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I should see "tracker-title" metadata parameter with "{$linkText}" value ignoring punctuation marks

  @CU-33238
  Scenario: [PX] Verify correct document is opened on clicking Read All Articles Button on Latest News Box
    * I am logged in
    * "#1 of News Headlines Box" should be visible
    * "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons" should be visible
    * I click "#1 of News Headlines Box > #1 of SubSections > #1 of Read All Articles Buttons"
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "WKUS_TAL_18645" value

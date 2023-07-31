@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegs

  @CU-35183
  @logout
  Scenario: Verify that 'Laws & Regulations' tab is not available for user without subscription
    * I am logged in as "practCont@wk.com" with "password" password
    * "Header > Laws And Regulations Button" should not be visible

  @CU-35600
  @logout
  Scenario Outline: Verify that 'Law & Regulations' content is not available for user without subscription
    * I am logged in as "practCont@wk.com" with "password" password
    * I open base url with "<link>"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Notice Message" should be "We're sorry, we can't find the content you requested."
    * I click "Notice Popup > Close Button"
    * "Notice Popup" should not be visible

    Examples:
      | link                                              |
      | #/home/PrimarySource                              |
      | #/read/ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1 |

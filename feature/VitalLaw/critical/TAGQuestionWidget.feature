@critical_path
@mvl
Feature: TAG Question widget

  @CU-28563
  Scenario: Verify that correct User ID is displayed in 'Submit a Question to TAG' widget on "TAG' PA
    * I am logged in as "tag1@wk.com" with "password" password
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * Text of "Submit A Question To TAG Box > Text For User" should contain "John Doe"

  @CU-28707
  Scenario: Verify that Question widget is NOT displayed for user with limited subscription to "TAG" PA content
    * I am logged in as "taglimi@wk.com" with "password" password
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * "Submit A Question To TAG Box" should not be visible

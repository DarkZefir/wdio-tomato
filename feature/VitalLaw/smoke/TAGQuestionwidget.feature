@smoke
@mvl
@tag_question_widget
Feature: TAG Question widget

  @CU-28562
  Scenario: Verify that 'Submit a Question to TAG' content group is displayed on "TAG' PA
    * I am logged in
    * I am on "TECHNICAL ANSWER GROUP - TAG" PA
    * "Submit A Question To TAG Box" should be visible
    * Text of "Submit A Question To TAG Box > Title" should be "Can't find your answers?" ignoring case
    * "Submit A Question To TAG Box > Text For User" should be visible
    * "Submit A Question To TAG Box > Question Icon" should be visible
    * "Submit A Question To TAG Box > Book Icon" should be visible
    * "Submit A Question To TAG Box > Complete Link" should be visible
    * I remember "href" attribute of "Submit A Question To TAG Box > Complete Link" as "target"
    * "{$target}" text should be equal to "https://www.ftwilliam.com/cgi-bin/Pages/contactTAG.cgi" text ignoring case

@critical_path
@mvl
Feature: Limited Subscription

  @CU-32745
  Scenario: Notice overlay when accessing document without subscription
    * I am logged in as "TLPmixed@wk.com" with "password" password
    * I open base url with "#/read/HealthReform/hrw018bc498447d7d10009eeb00505688693902"
    * "Notice Popup" should be visible
    * Text of "Notice Popup > Notice Message" should be "We're sorry, we can't find the content you requested."
    * I click "Notice Popup > X Close Button"
    * "Notice Popup" should not be visible

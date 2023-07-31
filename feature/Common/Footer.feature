@smoke
@ipa
@footer
@mvl @vlcc
Feature: Footer

  @px
  @CU-28988 @CU-32310 @CU-32937
  Scenario: Verify Terms of Use Link
    * I am logged in
    * "Footer > Terms Of Use" should be visible
    # Click on "Terms of Use" link
    * I click "Footer > Terms Of Use"
    # Verify that new browser tab with "Terms of Use" text present in it is opened
    * Text of "Content Box > Title" should be "Terms of Use for CCH Online Content Services"

  @px
  @CU-28987 @CU-32311 @CU-32938
  Scenario: Verify Privacy & Cookies link
    * I am logged in
    * "Footer > Privacy And Cookies" should be visible
    * Text of "Footer > Privacy And Cookies" should be "Privacy & Cookies"
    # Click "Privacy & Cookies" link
    * I click "Footer > Privacy And Cookies"
    # Verify that a new browser tab with "Privacy & Cookies" text present in it is opened
    * I should see "Privacy & Cookies" text on page

  @CU-28986 @CU-32312
  Scenario Outline: Verify that Footer is displayed on Dashboards and TLPs
    * I am logged in
    # Open <URL> from examples
    * I open base url with "<URL>"
    # Verify that "Footer" is visible
    * "Footer" should be visible
    # Verify that the following elements are displayed in the Footer:
    * Text of "Footer > Copyright" should be "© 2022 CCH Incorporated and its affiliates and licensors. All rights reserved."
    * "Footer > Terms Of Use" should be visible
    * "Footer > Privacy And Cookies" should be visible

    Examples:
      | URL                                                          |
      | #/home/AllContent                                            |
      | #/home/HR                                                    |
      | #/home/Tax                                                   |
      | #/topics/browse/fed/TaxFederal                               |
      | #/topics/browse/kitl/kluwertaxlaw/AR                         |
      | #/topics/browse/intl/TaxInternational/INT-MULTI-COUNTRIES    |
      | #/topics/browse/st/TaxStateAndLocal                          |
      | #/topics/TaxInternational/841ce8647c681000be6690b11c18c90207 |



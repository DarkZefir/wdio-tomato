@smoke
@smoke_2
@ipa
@footer
@px
Feature: Footer

  @CU-32912
  Scenario: [PX] Verify that Footer is displayed on Home Page
    * I am logged in
    # Open <URL> from examples
    * I open base url with "#/home"
    # Verify that "Footer" is visible
    * "Footer" should be visible
    # Verify that the following elements are displayed in the Footer:
    * Text of "Footer > Copyright" should be "© 2022 CCH Incorporated and its affiliates and licensors. All rights reserved."
    * "Footer > Terms Of Use" should be visible
    * "Footer > Privacy And Cookies" should be visible

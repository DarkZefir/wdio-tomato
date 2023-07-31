@smoke
@mvl
@dashboard1
Feature: Dashboard

  @CU-40581
  Scenario Outline: Verify UI of New Site box on All Content
    * I am logged in
    * I am on "All content" PA
    # Verify that "New Site Box" is displayed
    * "New Site Box" should be visible
    # Verify that the following elements are present in "New Site Box"
    * Text of "New Site Box > Title" should be "New Site: VitalLaw.com"
    * "New Site Box > Icon" should be visible
    * Text of "New Site Box > Message" should be "<message>"
    * "New Site Box > Visit Link" should be visible
    * "New Site Box > Visit Button" should be visible

    Examples:
      | message                                                                                                                                                                                                                  |
      | Keep up to date with legal news and expert analysis by visiting Wolters Kluwer's newest site, VitalLaw.com. Preview news in your subscription and also other practice areas and topics that might be of interest to you. |

  @stg_only
  @CU-40582
  Scenario Outline: Verify VitalLaw link and button in New Site box on All Content
    * I am logged in
    * I am on "All content" PA
    * "New Site Box" should be visible
    * "New Site Box > <placeToClick>" should be visible
    * I remember number of browser tabs
    # Click <placeToClick> from examples
    * I click "New Site Box > <placeToClick>"
    # Verify that new tab is opened
    * I switch to new tab
    # Verify that url of opened tab is "https://www.stg.vitallaw.com/"
    * I remember current url as "url"
    * "{$url}" text should be equal to "https://www.stg.vitallaw.com/" text

    Examples:
      | placeToClick |
      | Visit Link   |
      | Visit Button |

  @prod_only
  @CU-40582
  Scenario Outline: Verify VitalLaw link and button in New Site box on All Content
    * I am logged in
    * I am on "All content" PA
    * "New Site Box" should be visible
    * "New Site Box > <placeToClick>" should be visible
    * I remember number of browser tabs
    # Click <placeToClick> from examples
    * I click "New Site Box > <placeToClick>"
    # Verify that new tab is opened
    * I switch to new tab
    * I remember current url as "url"
    # Verify that url of opened tab is "https://www.vitallaw.com/"
    * "{$url}" text should be equal to "https://www.vitallaw.com/" text

    Examples:
      | placeToClick |
      | Visit Link   |
      | Visit Button |

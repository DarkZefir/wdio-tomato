@smoke
@px
@resources_box
Feature: Resources Box

  @CU-33169
  @logout
  Scenario: [PX] Verify UI of Resources Box on Home Page
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box > Title" should be visible
    * Text of "Px Resources Box > Title" should be "RESOURCES"
    * "Px Resources Box > Customize" should be visible
    * "Px Resources Box > #1 of Links" should be visible
    * Count of "Px Resources Box > Links" should be equal to "12"
    * "Px Resources Box > See All Button" should be visible

  @CU-33170
  @logout
  Scenario: [PX] Verify See all overlay is displayed after clicking on 'See all' button on Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > See All Button" should be visible
    * I click "Px Resources Box > See All Button"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "Resources" ignoring case ignoring whitespaces
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

  @CU-33171
  @logout
  Scenario: [PX] Verify the UI of See All overlay of Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > See All Button" should be visible
    * I click "Px Resources Box > See All Button"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "Resources" ignoring case ignoring whitespaces
    * "See All Popup > X Close Button" should be visible
    * "See All Popup > #1 of Navigation Letters" should be visible
    * "See All Popup > #1 of Links" should be visible
    * "See All Popup > Customize Button" should be visible
    * "See All Popup > Close Button" should be visible
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

  @CU-33179
  @logout
  Scenario: [PX] Verify the number of links in See All overlay is more than on Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > #1 of Links" should be visible
    * I remember number of "Px Resources Box > Links" as "numDashboard"
    * I click "Px Resources Box > See All Button"
    * "See All Popup" should be visible
    * Count of "See All Popup > Items" should be more than "{$numDashboard}"

  @CU-33180
  @logout
  Scenario Outline: [PX] Verify correct document is opened from Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > #1 of Links" should be visible
    * I click "Px Resources Box > #<Link> in Links"
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "<DA-id>" value

    Examples:
      | Link                 | DA-id          |
      | Federal Tax Day News | WKUS_TAL_1334  |
      | EY Tax Alerts        | WKUS_TAL_17987 |

  @CU-33185
  @logout
  Scenario Outline: [PX] Verify correct document is opened from See All overlay of Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > See All Button" should be visible
    * I click "Px Resources Box > See All Button"
    * "See All Popup" should be visible
    * I click "See All Popup > #<Link> in Items"
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "<DA-id>" value

    Examples:
      | Link                                   | DA-id         |
      | Federal Tax Weekly                     | WKUS_TAL_508  |
      | Vermont - State Employment Law Library | WKUS_TAL_5095 |

  @CU-33544
  @logout
  Scenario: [PX] Verify that 'Contents' panel is displayed expanded when user opens a document from Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > #1 of Links" should be visible
    * I click "Px Resources Box > #Federal Tax Day News in Links"
    * "Contents Tab > #1 of Expanded Parent Node > Header > Label" should be visible
    * "Contents Tab > Selected Link" should be visible

  @CU-33197
  @logout
  Scenario Outline: [PX] Verify elements of a toolbar panel for document opened from Resources Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * "Px Resources Box" should be visible
    * "Px Resources Box > #1 of Links" should be visible
    * I click "Px Resources Box > #<Link> in Links"
    * "Document Frame > Document Content" should be visible
    * "Favorite Button" should be visible
    * "Toolbar Buttons > Add To Button" should be visible
    * "Toolbar Buttons > Print Button" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "Toolbar Buttons > Download Button" should be visible
    * "Toolbar Buttons > Quick Print Button" should be visible
    * "Toolbar Buttons > Copy Link Button" should be visible
    * "Toolbar > Next Document Button" should be visible

    Examples:
      | Link              |
      | CCH Tax Briefings |
      | HR Daily News     |

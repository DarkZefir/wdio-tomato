@smoke
@vlcc
@tools_box
Feature: Tools Box

  @CU-32748
  @logout
  Scenario: [VLCC] Verify Tools Box on All Content
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I am on "All Content" PA
    * Text of "Vlcc Tools Box > Title" should be "TOOLS"
    * Text of "Vlcc Tools Box > #1 of Tool Boxes > Title" should be "MULTISTATE SURVEYS & CHECKLISTS"
    * Count of "Vlcc Tools Box > #1 of Tool Boxes > Links" should be equal to "5"
    * Text of "Vlcc Tools Box > #2 of Tool Boxes > Title" should be "SMARTTASKS"
    * Count of "Vlcc Tools Box > #2 of Tool Boxes > Links" should be equal to "5"
    * "Vlcc Tools Box > #2 of Tool Boxes > See All Button" should be visible

  @CU-32743
  @logout
  Scenario Outline: [VLCC] Verify See all overlay is displayed after clicking on 'See all' button on Tools Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I am on "All Content" PA
    * I click "Vlcc Tools Box > #<Num> of Tool Boxes > See All Button"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "<Box>" ignoring case ignoring whitespaces
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

    Examples:
      | Num | Box                |
      | 1   | MULTISTATE SURVEYS |
      | 2   | SMARTTASKS         |

  @CU-32746
  @logout
  Scenario Outline: [VLCC] Verify the UI of See All overlay of Tools Box
    * I am logged in as "gcnnotcustom@wk.com" with "password" password
    * I am on "All Content" PA
    * I click "Vlcc Tools Box > #<Num> of Tool Boxes > See All Button"
    * Text of "See All Popup > Title" should contain "<Box>"
    * "See All Popup > X Close Button" should be visible
    * "See All Popup > #1 of Links" should be visible
    * "See All Popup > Customize Button" should be visible
    * "See All Popup > Close Button" should be visible
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

    Examples:
      | Num | Box                |
      | 1   | MULTISTATE SURVEYS |
      | 2   | SMARTTASKS         |

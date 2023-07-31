@smoke
@vlcc
@dashboard
Feature: Dashboard 6

  @CU-34810
  Scenario Outline: [VLCC] Verify that correct page is opened on Fastcase * user access Primary Law links
    * I am logged in
    * I open base url with "#/home/AllContent"
    * "Vlcc Primary Law Box" should be visible
    * Text of "Vlcc Primary Law Box > Title" should be "PRIMARY LAW"
    * I click "<link>"
    * I wait until page title is "Fastcase"
    * Page URL should contain "<url>"

    Examples:
      | link                               | url                             |
      | Vlcc Primary Law Box > #1 of Links | fc7.fastcase.com/outline/US/66  |
      | Vlcc Primary Law Box > #2 of Links | fc7.fastcase.com/outline/US/402 |
      | Vlcc Primary Law Box > #3 of Links | fc7.fastcase.com/outline/US/960 |
      | Vlcc Primary Law Box > #4 of Links | fc7.fastcase.com/outline/US     |
      | Vlcc Primary Law Box > #5 of Links | fc7.fastcase.com/outline/US     |
      | Vlcc Primary Law Box > #6 of Links | fc7.fastcase.com/outline/US     |

  @CU-34812
  Scenario Outline: [VLCC] Verify that user can perform search from "Find a case" widget
    * I am logged in
    * I open base url with "#/home/AllContent"
    * "Vlcc Find A Case Box" should be visible
    * I click "Vlcc Find A Case Box > Search By Dropdown"
    * "Vlcc Find A Case Box > Search By Dropdown > #1 of Items" should be visible
    * I click "Vlcc Find A Case Box > Search By Dropdown > <item>"
    * Text of "Vlcc Find A Case Box > Search By Dropdown" should be "<title>"
    * I type "<term>" in "Vlcc Find A Case Box > Search Term Input"
    * "Vlcc Find A Case Box > Go Button" should be enabled
    * I click "Vlcc Find A Case Box > Go Button"
    * I wait until page title is "Fastcase"
    * Page URL should contain "<url>"

    Examples:
      | item        | title     | term                                                          | url                                                                                                          |
      | #1 of Items | CASE CITE | ives v. montezuma county, colo., 930 f.2d 33 (10th cir. 1991) | fc7.fastcase.com/results?q=ives%20v.%20montezuma%20county,%20colo.,%20930%20f.2d%2033%20(10th%20cir.%201991) |
      | #2 of Items | KEYWORD   | agriculture                                                   | fc7.fastcase.com/results?q=agriculture&type=Cases                                                            |



@smoke
@mvl @vlcc
@news
Feature: News

  @CU-30789 @CU-32332
  Scenario: Verify that 'News' drop down contains appropriate items
    * I am logged in
    # Click "News" item in "Header"
    * I click "Header > News Dropdown"
    # Verify that "News" dropdown is displayed
    * "Header > News Dropdown > #1 of List" should be visible
    * Text of "Header > News Dropdown > #1 of List" should not be "Loading..."
    # Verify that the following items are displayed in "News" dropdown
    * I should see the following lines in "Header > News Dropdown > List":
      | Dailies          |
      | Newsletters      |
      | Treatise Updates |

  @CU-30790 @CU-32333
  Scenario Outline: Verify access to tabs in 'News' overlay
    * I am logged in
    # Click "News" item in "Header"
    * I click "Header > News Dropdown"
    * "Header > News Dropdown > #1 of List" should be visible
    # Click on the <dropdown item> item from examples in "News" drop down
    * I click "Header > News Dropdown > #<dropdown item> in List"
    # Verify that "News" dropdown is displayed
    * "News Popup" should be visible
    # Verify that active tab of "News" dropdown is <active tab> from examples
    * Text of "News Popup > Active Tab" should be "<active tab>"
    # Click <First tab> from examples
    * I click "News Popup > #<First tab> in Tabs"
    * Text of "News Popup > Active Tab" should be "<First tab>"
    # Click <Second tab> tab from examples
    * I click "News Popup > #<Second tab> in Tabs"
    # Verify that text of active tab of "News" dropdown is <Second tab> from examples
    * Text of "News Popup > Active Tab" should be "<Second tab>"

    Examples:
      | dropdown item    | active tab       | First tab   | Second tab       |
      | Dailies          | DAILIES          | NEWSLETTERS | TREATISE UPDATES |
      | Newsletters      | NEWSLETTERS      | DAILIES     | TREATISE UPDATES |
      | Treatise Updates | TREATISE UPDATES | DAILIES     | NEWSLETTERS      |

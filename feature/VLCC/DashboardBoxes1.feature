@smoke
@vlcc
@dashboard_boxes
Feature: Dashboard Boxes 1

  @CU-38806
  Scenario Outline: [VLCC] Verify that correct message is displayed when user executes a search by term with no matches on Bankruptcy Tax Topics List
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * "Topics Search Result List > Topics List Container" should be visible
    * Text of "Topics Search Result List > Name" should contain "NAME"
    * "Topics Search Result List > Sorting Icon" should be visible
    * "Topics Search Result List > No Results Message" should be visible
    * Text of "Topics Search Result List > No Results Message" should be "There are no search results for the term "<Search Term>""
    * I click "Topics List Clear Search"
    * I remember current url as "currentUrl"
    * "{$currentUrl}" text should contain "<URL>" text
    * "Topics List Search Input" should be visible
    * Value in "Topics List Search Input" should be ""

    Examples:
      | URL                            | List Title            | Search Term |
      | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | klj         |

  @CU-38807
  Scenario Outline: [VLCC] Verify that results gained after usage of search filter on Bankruptcy Tax Topics List can be sorted by ascending/descending order
    * I am logged in
    * I open base url with "<URL>"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "<List Title>"
    * "Topics List Search Icon" should be visible
    * I wait until "Loading Indicator" is gone
    * I click "Topics List Search Icon"
    * "Topics List Search Input" should be visible
    * I type "<Search Term>" in "Topics List Search Input"
    * I wait until "Loading Indicator" is gone
    * "Topics Search Result List > #1 of Topic Links" should be visible
    * "Topics Search Result List > Sorting Icon" should be visible
    * Order of "Topics Search Result List > Topic Links" should be alphabetical
    * I click "Topics Search Result List > Sorting Icon"
    * Order of "Topics Search Result List > Topic Links" should be reverse alphabetical

    Examples:
      | URL                            | List Title            | Search Term |
      | #/topics/browse/bke/Bankruptcy | BANKRUPTCY ESSENTIALS | dis         |

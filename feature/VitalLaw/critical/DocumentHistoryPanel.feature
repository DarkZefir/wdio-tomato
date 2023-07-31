@critical_path
@mvl
Feature: Document History Panel

  @CU-29699
  @local
  Scenario Outline: Verify the display of document history widget for documents from different PAs
    * I am logged in
    * I am on "<practiceArea>" PA
    * "Search Bar > Search Input" should be visible
    * I perform search of "<docID>"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > History" should be visible
    * I click "Tab Triggers > History"
    * "History Tab" should be visible
    Examples:
      | practiceArea                | docID                              |
      | PENSION & EMPLOYEE BENEFITS | fnl0109013e2c83f97697              |
      | TAX - FEDERAL               | eor0109013e2c83a3c44c              |
      | PENSION & EMPLOYEE BENEFITS | ust0209013e2c86f4eb31              |

  @CU-29700
  @local
  Scenario: Verify that correct document is opened after clicking on Citations links in Document History Panel
    * I am logged in
    * I perform search of "rrk01080ac11a7b691000943d001b78be8c78013a"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > History" should be visible
    * I click "Tab Triggers > History"
    * "History Tab" should be visible
    * "History Tab > #1 of History Items > #1 of Citation Items Links" should be visible
    * I click "History Tab > #Rev. Rul. 90-38 in History Items > #1 of Citation Items Links"
    * I wait until "Loading Indicator" is gone
    * "History Tab > Loading Indicator" should not be visible
    * "Document Frame > Document Content" should be visible
    * I wait 2 seconds
    * I scroll to the bottom
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    * I should see "title" metadata parameter with "Revenue Ruling 90-38," value

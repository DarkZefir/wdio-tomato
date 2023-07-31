@smoke
@mvl @vlcc
@ipa
@breadcrumbs
Feature: Breadcrumbs Trail from Read view

  @CU-29075 @CU-32237
  @local
  Scenario Outline: Verify DA title is displayed on document Title Bar
    * I am logged in
    * I perform search of "<doc>"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * Text of "DA Title" should contain "<da>"
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember text of "DA Title" as "daTitle"
    * I should see "da-title" metadata parameter with "{$daTitle}" value

    Examples:
      | doc                   | da                            |
      | irc0109013e2c83d8fbd4 | Current Internal Revenue Code |

  @CU-29088 @CU-32246
  @local
  Scenario: Verify that user can navigate back to SRL on clicking back button from document read view
    * I am logged in
    * I perform search of "business trust"
    * Count of "Documents" should be more than "0"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * I click browser back button
    * I wait 10 seconds
    * Page URL should contain "/#/results/"
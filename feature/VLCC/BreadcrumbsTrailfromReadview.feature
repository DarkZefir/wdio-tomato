@smoke
@smoke_1
@vlcc
@ipa
@breadcrumbs
Feature: Breadcrumbs Trail from Read view

  @CU-32238
  Scenario: [VLCC] Verify the display of Breadcrumb Trail for publications that can be found on multiple dashboards
    * I am logged in
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    * Text of "DA Title" should be "Mergers, Acquisitions, and Buyouts - Ginsburg, Levin, and Rocap"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Mergers & Acquisitions > Treatises & Explanations"
    * I click "Search Bar > Document Breadcrumbs > Expand Button"
    * I should see the following lines in "Search Bar > Document Breadcrumbs > Additional Breadcrumb Links":
      | Securities - Federal > Treatises & Explanations |

  @CU-32239
  Scenario: [VLCC] Verify appropriate dashboard is displayed on clicking Breadcrumb Trail from read view
    * I am logged in
    * I open "fcg0109013e2c84515ccf" document
    * Text of "DA Title" should be "Bank Compliance Guide"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Banking > Treatises & Explanations"
    * I click "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail"
    * Text of "Session Navigator > Session Navigator Tab" should be "BANKING"

  @CU-32242
  Scenario Outline: [VLCC] Verify the display of Breadcrumb Trail for nested publications
    * I am logged in
    * I open base url with "<url>"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Banking > Treatises & Explanations"

    Examples:
      | url                   |
      | #/read/WKUS_TAL_14205 |

  @CU-32243
  @local
  Scenario: [VLCC] Verify user can navigate back to the dashboard on clicking back button from document read view
    * I am logged in
    * I am on "CONSUMER LAW" PA
    * I perform search of "tax"
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click browser back button
    * I wait until "Loading Indicator" is gone
    * I click browser back button
    * Text of "Session Navigator > Session Navigator Tab" should be "CONSUMER LAW"

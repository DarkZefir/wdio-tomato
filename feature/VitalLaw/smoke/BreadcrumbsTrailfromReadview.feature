@smoke
@mvl
@ipa
@breadcrumbs
Feature: Breadcrumbs Trail from Read view

  @CU-29078
  Scenario: Verify the display of Breadcrumb Trail for publications that can be found on multiple dashboards
    * I am logged in
    # Open "mab012d5850ea7c401000952190b11c18cbab01" document
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    # Verify that DA Title is "Mergers, Acquisitions, and Buyouts - Ginsburg, Levin, and Rocap"
    * Text of "DA Title" should be "Mergers, Acquisitions, and Buyouts - Ginsburg, Levin, and Rocap"
    # Verify that text of main Breadcrumb Trail is "Securities - Corporation Law & Governance > Mergers & Acquisitions"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Securities - Corporation Law & Governance > Mergers & Acquisitions"
    # Click on "Expand Button" in Breadcrumbs
    * I click "Search Bar > Document Breadcrumbs > Expand Button"
    # Verify that the following Breadcrumbs are displayed:
    * I should see the following lines in "Search Bar > Document Breadcrumbs > Additional Breadcrumb Links":
      | Securities - Federal & International > Federal > Treatises & Explanations |
      | Tax - Federal > C-Corps & M&A                                             |
      | Tax - Federal > Treatises                                                 |


  @CU-29082
  Scenario: Verify appropriate dashboard is displayed on clicking Breadcrumb Trail from read view
    * I am logged in
    # Open "mab012d5850ea7c401000952190b11c18cbab01" document
    * I open "mab012d5850ea7c401000952190b11c18cbab01" document
    # Verify that DA Title is "Mergers, Acquisitions, and Buyouts - Ginsburg, Levin, and Rocap"
    * Text of "DA Title" should be "Mergers, Acquisitions, and Buyouts - Ginsburg, Levin, and Rocap"
    # Verify that text of "Main Breadcrumb Trail" is "Securities - Corporation Law & Governance > Mergers & Acquisitions"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Securities - Corporation Law & Governance > Mergers & Acquisitions"
    # Click "Main Bradcrumb Trail"
    * I click "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail"
    # Verify that "SECURITIES - CORPORATION LAW & GOVERNANCE" PA is opened and the same text is displayed in "Session Navigator"
    * Text of "Session Navigator > Session Navigator Tab" should be "SECURITIES - CORPORATION LAW & GOVERNANCE"

  @stg_only
  @CU-29084
  Scenario Outline: Verify the display of Breadcrumb Trail for nested publications
    * I am logged in
    # Open <url> from examples
    * I open base url with "<url>"
    # Verify that that text of "Main Breadcrumb Trail" is "Tax - State & Local > Archives"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Tax - State & Local > Archives"

    Examples:
      | url                  |
      | #/read/WKUS_TAL_4189 |
      | #/read/WKUS_TAL_4240 |

  @prod_only
  @CU-29084
  Scenario Outline: Verify the display of Breadcrumb Trail for nested publications
    * I am logged in
    # Open <url> from examples
    * I open base url with "<url>"
    # Verify that that text of "Main Breadcrumb Trail" is "Tax - State & Local > Archives"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "Tax - State & Local > Archives"

    Examples:
      | url                  |
      | #/read/WKUS_TAL_4189 |
      | #/read/WKUS_TAL_4240 |

  @CU-29085
  @local
  Scenario: Verify user can navigate back to the dashboard on clicking back button from document read view
    * I am logged in
    # Open "PENSION & EMPLOYEE BENEFITS" PA
    * I am on "PENSION & EMPLOYEE BENEFITS" PA
    # Search for "09013e2c84542126"
    * I perform search of "09013e2c84542126"
    # Click #1 of Documents on "Results" page
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * I click browser back button
    # Click browser "Back" button
    * I click browser back button
    # Verify that "PENSION & EMPLOYEE BENEFITS" PA is displayed and the same text is displayed in "Session Navigator"
    * Text of "Session Navigator > Session Navigator Tab" should be "PENSION & EMPLOYEE BENEFITS"

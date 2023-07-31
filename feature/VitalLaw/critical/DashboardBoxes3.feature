@critical_path
@mvl
Feature: Dashboard Boxes

  @CU-29219
  Scenario: Verify that "External Resources" box is displayed on HRKC PA dashboard
    * I am logged in
    * I am on "HEALTH REFORM KNOWLEDGE CENTER" PA
    * "External Resources Box" should be visible
    * Text of "External Resources Box > Header" should be "EXTERNAL RESOURCES"

  @CU-29220
  Scenario: Verify that "Twitter Feed" box is displayed on HRKC PA dashboard
    * I am logged in
    * I am on "HEALTH REFORM KNOWLEDGE CENTER" PA
    * "Twitter Box" should be visible
    * Text of "Twitter Box > Header" should be "TWITTER FEED"

  @CU-29276
  Scenario: Verify that "Search Case Databases" box is displayed on WKTN PA dashboard
    * I am logged in
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "Search Case Databases Box" should be visible
    * Text of "Search Case Databases Box > Header" should be "SEARCH CASE DATABASES"

  @CU-29583
  Scenario Outline: Verify that "Search RBSourcefilings" box is displayed on different dashboards
    * I am logged in
    * I am on "<pa>" PA
    * "RBsourceFilings" should be visible
    * Text of "RBsourceFilings > Header" should be "SEARCH RBSOURCEFILINGS"
    Examples:
      | pa                                   |
      | SECURITIES - ALL                     |
      | SECURITIES - FEDERAL & INTERNATIONAL |

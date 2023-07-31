@smoke
@mvl @vlcc
@dashboard_boxes
Feature: Dashboard Boxes

  @ipa
  @CU-32429 @CU-32573
  Scenario Outline: Verify See all overlay is displayed after clicking on 'See all' button
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should contain "<Box Title>"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > See All"
    * "See All Popup" should be visible
    * Text of "See All Popup > Title" should contain "<Box Title>" ignoring case ignoring whitespaces
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

    Examples:
      | Practice Area        | Box Title        |
      | TRANSPORTATION       | INDEXES & TABLES |
      | GOVERNMENT CONTRACTS | CASES            |

  @CU-32436 @CU-32592
  Scenario Outline: Verify the UI of See All overlay opened by clicking on 'See all' button
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > See All"
    * "See All Popup" should be visible
    * "See All Popup > #1 of Navigation Letters" should be visible
    * "See All Popup > X Close Button" should be visible
    * "See All Popup > #1 of Links" should be visible
    * "See All Popup > Customize Button" should be visible
    * I click "See All Popup > Close Button"
    * "See All Popup" should not be visible

    Examples:
      | Practice Area | Box Title                |
      | HEALTHCARE    | TREATISES & EXPLANATIONS |
      | HEALTHCARE    | CASES                    |

  @ipa
  @CU-32437 @CU-32594
  Scenario Outline: Verify the number of links in See All overlay is more than on the dashboard
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I remember number of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Links" as "numDashboard"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > See All"
    * "See All Popup" should be visible
    * Count of "See All Popup > Items" should be more than "{$numDashboard}"

    Examples:
      | Practice Area        | Box Title                |
      | HEALTHCARE           | TREATISES & EXPLANATIONS |
      | GOVERNMENT CONTRACTS | NASH & CIBINIC E-SERIES  |

  @ipa
  @CU-32438 @CU-32598
  Scenario Outline: Verify correct document is opened from content group
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "docTitle"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > #1 of Path Titles" should contain "{$docTitle}" ignoring case

    Examples:
      | Practice Area | Box Title                      |
      | LITIGATION    | PRIMARY SOURCES                |
      | HEALTHCARE    | HEALTH CARE COMPLIANCE LIBRARY |

  @ipa
  @CU-32477 @CU-32606
  Scenario Outline: Verify correct document is opened from See All overlay
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > See All"
    * "See All Popup" should be visible
    * I remember text of "See All Popup > #1 of Items" as "docTitle"
    * I click "See All Popup > #1 of Items"
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > #1 of Path Titles" should contain "{$docTitle}" ignoring case ignoring whitespaces

    Examples:
      | Practice Area        | Box Title                      |
      | GOVERNMENT CONTRACTS | CASES                          |
      | HEALTHCARE           | HEALTH CARE COMPLIANCE LIBRARY |

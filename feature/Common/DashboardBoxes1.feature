@smoke
@mvl @vlcc
@dashboard_boxes
Feature: Dashboard Boxes 1

  @CU-32479 @CU-32607
  @logout
  Scenario Outline: Verify that no links on dropdown-type content group when '-Select-' item is selected
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Verify that content box with title <Box Title> contains dropdown with '-SELECT-' value by default
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should contain "- SELECT -" ignoring case ignoring whitespaces
    # Verify that no links are displayed  within <Box Title> content box
    * Count of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Links" should be equal to "0"

    Examples:
      | Practice Area      | Box Title              |
      | HEALTHCARE         | MEDICARE AND MEDICAID  |
      | SECURITIES - STATE | STATES & JURISDICTIONS |

  @CU-32480 @CU-32609
  Scenario Outline: Verify links are displayed after choosing item in dropdown on content groups
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be visible
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should contain "- SELECT -" ignoring case ignoring whitespaces
    # Click on dropdown in #2 of Content Boxes (MEDICARE AND MEDICAID)
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    # Click #2 of Items in expanded dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Verify that some link(s) is(are) displayed in #2 of Content Boxes (MEDICARE AND MEDICAID)
    * Count of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Links" should be more than "0"

    Examples:
      | Practice Area | Box Title             |
      | HEALTHCARE    | MEDICARE AND MEDICAID |

  @CU-32481 @CU-32611
  Scenario Outline: Verify other links are displayed after choosing another item in content group dropdown
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    # Remember text of 2nd item in dropdown as "secondItem" and click it
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items" as "secondItem"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items"

    # Verify that "{$secondItem}" text is displayed in the dropdown
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be "{$secondItem}" ignoring case ignoring whitespaces
    # Rememeber text of 1st displayed link as "firstLink"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "firstLink"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    # Remember text of 3rd item in the dropdown as "thirdItem" and click it
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #3 of Items" as "thirdItem"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #3 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Verify that "{$thirdItem}" is displayed in the dropdown
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown" should be "{$thirdItem}" ignoring case ignoring whitespaces
    # Verify that text of 1st displayed link differs from "{$firstLink}"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should not be "{$firstLink}"

    Examples:
      | Practice Area      | Box Title              |
      | SECURITIES - STATE | STATES & JURISDICTIONS |

  @CU-32482 @CU-32629
  Scenario Outline: Verify correct document is opened from dropdown-type content group
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown"
    # Click "Explanations" item in the dropdown
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items" should contain "Explanations" ignoring case ignoring whitespaces
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Dropdown > #2 of Items"
    # Remember title of the 1st appeared link as "docTitle"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "docTitle"
    # Click 1st link
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"
    # Verify that doc with "{$docTitle}" is displayed in Read View
    * Text of "Document Frame > #1 of Path Titles" should contain "{$docTitle}" ignoring case

    Examples:
      | Practice Area | Box Title             |
      | HEALTHCARE    | MEDICARE AND MEDICAID |

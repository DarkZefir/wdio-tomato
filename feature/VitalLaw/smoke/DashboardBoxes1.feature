@smoke
@ipa
@mvl
@dashboard_boxes
Feature: Dashboard Boxes 1

  @CU-32483
  Scenario Outline: Verify no links when -Select- value in 1st dropdown of double-dropdown content group
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Verify that text displayed in the 1st dropdown of <Box Title> Content Type is "- SELECT -"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns" should contain "- SELECT -" ignoring case ignoring whitespaces
    # Verify that no links are displayed within givenm Content Type
    * Count of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > Links" should be equal to "0"

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32484
  Scenario Outline: Verify 2nd dropdown appears when something is selected in 1st dropdown
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Verify that text displayed in the 1st dropdown of <Box Title> Content Type is "- SELECT -"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns" should contain "- SELECT -" ignoring case ignoring whitespaces

    # Click 1st dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items" should be visible
    # Click on 2nd item in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * I wait 3 seconds
    # Verify that 2nd dropdown appeared
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible
    # Verify that text displayed in the 2nd dropdown is "- SELECT -"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should contain "- SELECT -" ignoring case ignoring whitespaces

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32485
  Scenario Outline: Verify links are displayed when something is selected in both dropdowns
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click 1st dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    # Click on 2nd item in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * I wait 3 seconds
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible
    # Verify that 2nd dropdown appeared
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    # Click 2nd item in 2nd dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #2 of Items"
    # Verify that some link(s) is(are) displayed within Content Type
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32486
  Scenario Outline: Verify links are changed when changed value in 1st dropdown
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click 1st dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    # Click on 2nd item in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * I wait 3 seconds
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible
    # Verify that 2nd dropdown appeared
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    # Click 2nd item in 2nd dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Remember text of 1st appeared link as "firstLink"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "firstLink"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    # Click 3rd option in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #3 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Verify that text of appered link is not the same as "{$firstLink}"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should not be "{$firstLink}"

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32487
  Scenario Outline: Verify links are changed when changed value in 2nd dropdown
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click 1st dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    # Click on 2nd item in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * I wait 3 seconds
    # Verify that 2nd dropdown appeared
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible

    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    # Click 2nd item in 2nd dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Remember text of 1st appeared link as "firstLink"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "firstLink"
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    # Click 3rd item in 2nd dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #3 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Verify that text of appered link is different from "firstLink"
    * Text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should not be "{$firstLink}"

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-32488
  Scenario Outline: Verify correct document is opened from double-dropdown-type content group
    * I am logged in
    # Open <Practice Area> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types > #1 of Content Types > Title" should be visible
    # Click 1st dropdown in content type with title <Box Title>
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns"
    # Click on 2nd item in 1st dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Dropdowns > #2 of Items"
    * I wait 3 seconds
    # Verify that 2nd dropdown appeared
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns" should be visible

    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns"
    # Click 2nd item in 2nd dropdown
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #2 of Dropdowns > #2 of Items"
    * "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    # Remember text of 1st appeared link as "docTitle"
    * I remember text of "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links" as "docTitle"
    # Click 1st link
    * I click "Content Box > #1 of Main Content Types > #<Box Title> in Content Types > #1 of Links"

    # Verify that doc with remembered "{$docTitle}" is opened in Read View
    * Text of "Document Frame > #1 of Path Titles" should contain "{$docTitle}" ignoring case

    Examples:
      | Practice Area       | Box Title |
      | TAX - STATE & LOCAL | ARCHIVES  |

  @CU-35750
  Scenario Outline: Verify Search with 2 terms of White Papers & Special Reports See All overlay
    * I am logged in
    * I am on "All content" PA
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button" should be visible
    # Click "See All" in "WHITE PAPERS & SPECIAL REPORTS" box
    * I click "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button"
    * "White Papers Popup" should be visible
    # Verify that title of the opened popup is "White Papers & Special Reports"
    * Text of "White Papers Popup > Title" should be "White Papers & Special Reports" ignoring case ignoring whitespaces
    * "White Papers Popup > Search Input" should be visible
    * "White Papers Popup > Search Button" should be visible
    # Search for <term1> within popup
    * I type "<term1>" in "White Papers Popup > Search Input"
    * I click "White Papers Popup > Search Button"
    # Verify that results number is <1st result>
    * Count of "White Papers Popup > Links" should be equal to "<1st result>"
    # Search for <term2> within popup
    * I type " <term2>" in "White Papers Popup > Search Input"
    * I click "White Papers Popup > Search Button"
    # Verify that results number is <2nd result>
    * Count of "White Papers Popup > Links" should be equal to "<2nd result>"
    # Verify that highlights match both input terms
    * Each element of "White Papers Popup > Highlights Links" should match "(<term1>|<term2>)" ignoring case

    Examples:
      | term1   | term2 | 1st result | 2nd result |
      | supreme | law   | 4          | 1          |

  @CU-35751
  Scenario Outline: Verify No results Search of White Papers & Special Reports See All overlay
    * I am logged in
    * I am on "All content" PA
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button" should be visible
    # Click "See All" in "WHITE PAPERS & SPECIAL REPORTS" box
    * I click "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button"
    * "White Papers Popup" should be visible
    # Verify that title of the opened popup is "White Papers & Special Reports"
    * Text of "White Papers Popup > Title" should be "White Papers & Special Reports" ignoring case ignoring whitespaces
    * "White Papers Popup > Search Input" should be visible
    * "White Papers Popup > Search Button" should be visible
    # Search for <term> within popup
    * I type "<term>" in "White Papers Popup > Search Input"
    * I click "White Papers Popup > Search Button"
    # Verify that no results text is displayed
    * Text of "White Papers Popup > No Results" should contain "<term>" ignoring case

    Examples:
      | term    |
      | sdcfsdf |

@smoke
@mvl
@customization
Feature: Customization

  @CU-32709
  Scenario Outline: Verify access to Customize overlay (Select Dashboard content) from Content box
    * I am logged in
    # Open <PA> from examples
    * I am on "<Practice Area>" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxes"
    # Remember random number from number of Main Content Types as "randombox"
    * I remember random integer below "{$boxes}" as "randombox"
    # Remember title of First Content type within selected #"{$randombox}" of Main Content Types as "groupTitle"
    * I remember text of "Content Box > #{$randombox} of  Main Content Types > #1 of Content Types > Title" as "grouptitle"
    # Click "Config" button in #{$randomBox} of Main Content Types
    * I click "Content Box > #{$randombox} of  Main Content Types > Header Config"
    * "Select Dashboard Content Popup" should be visible
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Verify that popup with "Select Dashboard Content" is opened
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that remembered "{$grouptitle}" text is displayed in "Group" dropdown
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Click "x"(Close) button in popup
    * I click "Select Dashboard Content Popup > X Close Button"
    # Verify that "Select Dashboard Content Popup" is not displayed
    * "Select Dashboard Content Popup" should not be visible

    Examples:
      | Practice Area                        |
      | TAX - ALL                            |
      | SECURITIES - FEDERAL & INTERNATIONAL |
      | PENSION & EMPLOYEE BENEFITS          |

  @CU-32723
  Scenario: Verify UI elements on "Select Dashboard Content" overlay (links)
    * I am logged in
    # Open "PRODUCTS LIABILITY & INSURANCE" PA
    * I am on "PRODUCTS LIABILITY & INSURANCE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * I remember number of "Content Box > #{$randombox} of  Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    # Remember title of any Content Type as "grouptitle"
    * I remember text of "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember number of links displayed in "Content Type" as "grouplinks"
    * I remember number of "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click title of remembered Content Type
    * I click "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Title"
    # Verify that "See All" popup is displayed
    * "See All Popup" should be visible
    # Remember number of links displayed in "See All" popup as "alllinks"
    * I remember number of "See All Popup > Links" as "alllinks"
    # Click "Customize" button in opened popup
    * I click "See All Popup > Customize Button"
    # Verify that "Select Dashboard Content" text is displayed as title of the overlay
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that "{$grouptitle}" is displayed in "Group" dropdown
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify the following elements of the overlay:
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group" should be visible
    * "Select Dashboard Content Popup > Select All Items Checkbox" should be visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    * Text of "Select Dashboard Content Popup > Header > Do Not Display Group Text" should be "Do Not Display" ignoring case
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled
    # Verify that number of links displayed equals to "{$alllinks}" number
    * Count of "Select Dashboard Content Popup > Content > Link Texts" should be equal to "{$alllinks}"
    # Verify that count of checked links is the same as number of links displayed in "Content Type" on dashboard ("{$grouplinks}")
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$grouplinks}"
    # Click "Cancel" button in the overlay
    * I click "Select Dashboard Content Popup > Cancel Button"
    # Verify that "Select Dashboard Content Popup" is closed
    * "Select Dashboard Content Popup" should not be visible

  @CU-32725
  Scenario: Verify UI elements on "Select Dashboard Content" overlay (dropdown with default value)
    * I am logged in
    # Open "HUMAN RESOURCES" PA
    * I am on "HUMAN RESOURCES" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Click "Config" button in header of First Main Content Type
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    # Verify that popup with title "Select Dashboard Content" is opened
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click "Group" dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Click "State Laws, Regulations & Summaries" item in the dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #State Laws, Regulations & Summaries in Items"
    # Verify that text in "Group" dropdown is changed to "State Laws, Regulations & Summaries"
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "State Laws, Regulations & Summaries" ignoring case
    # Verify the following elements in the overlay:
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group" should be visible
    * Text of "Select Dashboard Content Popup > Header > Do Not Display Group Text" should be "Do Not Display" ignoring case
    * "Select Dashboard Content Popup > Header > Reorder Button" should not be enabled
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "- Select -" ignoring case

  @CU-32735
  Scenario: Verify UI elements on "Select Dashboard Content" overlay (dropdown with preselected value)
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    # Open "TAX - STATE & LOCAL" PA
    * I am on "TAX - STATE & LOCAL" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" exactly matching "STATE & LOCAL" as "index"
    # Verify dropdown within "STATE & LOCAL" content type with "- SELECT -" text in it is displayed
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be "- SELECT -"
    # Click dropdown within "STATE & LOCAL" content type
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #1 of Items" should be visible
    # Remember number of items in the opened dropdown
    * I remember number of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    * I remember text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #{$randomlink} of Items" as "title"
    # Click any item in the dropdown except First one
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #{$randomlink} of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that text in dropdown is changed to the clicked item's text
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be "{$title}" ignoring case
    # Verify that some links are loaded within "STATE & LOCAL" content type
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Remember number of displayed links within content type
    * I remember number of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Links" as "grouplinks"
    # Click "Config" button within "Main Content Type"
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    # Verify that popup with "Select Dashboard Content" title is opened
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click "Group" dropdown and click "State & Local" in it
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #State & Local in Items"
    # Verify the following elements in the overlay:
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "State & Local" ignoring case
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group" should be visible
    * "Select Dashboard Content Popup > Select All Items Checkbox" should not be visible
    * Text of "Select Dashboard Content Popup > Header > Do Not Display Group Text" should be "Do Not Display" ignoring case
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled
    # Verify that number of displayed links within overlay is the same as number of links displayed in "STATE & LOCAL" content type ("{$grouplinks}")
    * Count of "Select Dashboard Content Popup > Content > Item Titles" should be equal to "{$grouplinks}"

  @CU-32740
  Scenario: Verify UI elements on "Select Dashboard Content" overlay (dropdown with selected value)
    * I am logged in
    # Open "HEALTHCARE" PA
    * I am on "HEALTHCARE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Cick "Config" button in header of First Main Content Type
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    # Verify that "Select Dashboard Content" popup is opened
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click "Group" dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Click "CMS Program & DME Supplier Manuals" item in the dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #CMS Program & DME Supplier Manuals in Items"
    # Verify that text in "Group" dropdown is changed to "CMS Program & DME Supplier Manuals"
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "CMS Program & DME Supplier Manuals" ignoring case
    # Verify that "- SELECT -" text is displayed in dropdown within content area of "Select Dashboard Content" popup
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "- SELECT -" ignoring case
    # Click dropdown within content area of "Select Dashboard Content" popup
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > #1 of Items" should be visible
    * I remember number of "Select Dashboard Content Popup > Content > #1 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember text of any item in the dropdown except 1 as "title" and click it
    * I remember text of "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items" as "title"
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items"
    # Verify that text in dropdown within content area of "Select Dashboard Content" popup is changed to "{$title}"
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Loading Indicator" should not be visible
    # Verify that some items are displayed under dropdown in content area of "Select Dashboard Content" popup
    * Count of "Select Dashboard Content Popup > Content > Item Titles" should be more than "0"
    # Verify the following elements within "Select Dashboard Content" popup:
    * "Select Dashboard Content Popup > Save And Close" should be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group" should be visible
    * Text of "Select Dashboard Content Popup > Header > Do Not Display Group Text" should be "Do Not Display" ignoring case
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled


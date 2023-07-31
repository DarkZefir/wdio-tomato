@smoke
@mvl
@customization
Feature: Customization 1

  @CU-33056
  Scenario Outline: Verify that user can change number of links displayed on Content groups
    * I am logged in
    # Open "ANTITRUST & COMPETITION" PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > #1 of  Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "$groups" as "randomgroup"
    # Choose any Content Type and remember its title as "grouptitle"
    * I remember text of "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember number of links displayed within chosen Content Type as "grouplinks"
    * I remember number of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click Title of the chosen Content Type
    * I click "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Title"
    # Click "Customize" button in opened "See All" popup
    * I click "See All Popup > Customize Button"
    # Verify that title of the popup is "Select Dashboard Content"
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that text displayed within "Group" dropdown is "{$grouptitle}"
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "$grouptitle" ignoring case
    # Verify that number of links with selected checkboxes is the same as displayed for the Content Type on dashbolard ("{$grouplinks}")
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "$grouplinks"
    # Remember number of <element> from examples as "links"
    * I remember number of "<element>" as "links"
    * I remember random integer below "$links" as "randomlinks"
    # Click any checked/ unchecked checkbox according to examples
    * I click "<randomlink>"
    # Remember text of checked links as "checkedlinks"
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    * "Select Dashboard Content Popup > Save And Close" should be present
    # Click "Save & Close" button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "See All Popup" should not be present
    # Verify that selected links in "Select Dashboard Content" popup ("$checkedlinks") are displayed in correspondent Content Type on dashboard
    * I remember text of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks2"
    * "$grouplinks2" collection should be equal to "$checkedlinks" collection ignoring case

    Examples:
      | element                                                              | randomlink                                                                              |
      | Select Dashboard Content Popup > Content > Link Unchecked Checkboxes | Select Dashboard Content Popup > Content > #{$randomlinks} of Link Unchecked Checkboxes |
      | Select Dashboard Content Popup > Content > Link Checked Checkboxes   | Select Dashboard Content Popup > Content > #{$randomlinks} of Link Checked Checkboxes   |

  @CU-33553
  Scenario: Verify that user can hide any content group using "Don't display" checkbox
    * I am logged in
    # Open "TAX - INTERNATIONAL" PA
    * I am on "TAX - INTERNATIONAL" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember titles of content groups displayed on dashboard as "groups1"
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups1"
    # Click "Config" button in Header of #1 of Main Content Types
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click on any item in "Group" dropdown of "Select Dashboard Content" popup an remember its text as "title"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    * I remember random integer below "{$dropdowntitles}" as "randomtitle1"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomtitle1} of Items"
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown" as "title"
    # Select "Do Not display this group" checkbox
    * I click "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox "
    # Verify that "Reorder" button is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button Disabled" should be visible
    # Click "Save & Close" button
    * I click "Select Dashboard Content Popup > Save And Close"
    # Verify that number of content types displayed within #1 of Main Content Types is less by 1 than intial "{$groups1}" number
    * Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be less than "{$groups1}"
    # Verify that disabled group with "{$title}" title is not displayed on dashboard
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should not contain "{$title}" ignoring case

  @CU-33556
  Scenario: Verify that user can unhide any content group using "Don't display" checkbox
    * I am logged in
    # Open "TAX - INTERNATIONAL" PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember titles of content groups displayed on dashboard as "groups1"
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups1"
    # Click "Config" button in Header of #1 of Main Content Types
    * I click "Content Box > #1 of Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click on any item in "Group" dropdown of "Select Dashboard Content" popup an remember its text as "title"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    * I remember random integer below "{$dropdowntitles}" as "randomtitle1"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomtitle1} of Items"
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown" as "title"
    # Disable displaying of the group on dashboard by selecting "Do Not display this group" checkbox
    * I click "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox"
    # Verify that "Reorder" button is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button Disabled" should be visible
    # Save the changes and check that the group with "{$title}" title is not displayed on dashboard anymore
    * I click "Select Dashboard Content Popup > Save And Close"
    * Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be less than "{$groups1}"
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should not contain "{$title}" ignoring case
    # Click "Config" button in Header of #1 of Main Content Types
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    # Enable content type displaying on dashboard by deselecting of "Do Not display this group" checkbox
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomtitle1} of Items"
    * I click "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox"
    # Verify that "Reorder" item is enabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should be visible
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled
    # Save the changes and check that content type with "{$title}" title is displayed on dashboard and count of displayed content types is initial ("{$groups1}")
    * I click "Select Dashboard Content Popup > Save And Close"
    #Then Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be equal to "{$groups1}"
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should contain "{$title}" ignoring case

  @CU-33717
  Scenario: Verify that selection on dashboard reflects selection on "Select Dashboard Content" overlay (2 drop downs)
    * I am logged in
    # Open "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    # Click "Config" button in header of #3 of Main Content Types
    * I click "Content Box > #3 of Main Content Types > Header Config"
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Select "United Kingdom" in "Group" dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown >#United Kingdom in Items"
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "United Kingdom" ignoring case
    # Verify that First dropdown within content area of "Select Dashboard Content" popup contains "- SELECT -" text
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "- SELECT -" ignoring case
    # Select 3rd item in the First dropdown displayed in content area of "Select Dashboard Content" popup
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #3 of Items"
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns"
    # Select random item in the Second dropdown displayed in the content area of "Select Dashboard Content" popup
    * "Select Dashboard Content Popup > Content > #2 of Dropdowns > #1 of Items" should be visible
    * I remember number of "Select Dashboard Content Popup > Content > #2 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember text of selected item in the Second dropdown as "title"
    * I remember text of "Select Dashboard Content Popup > Content > #2 of Dropdowns > #{$randomlink} of Items" as "title"
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns > #{$randomlink} of Items"
    # Verify that "{$title}" text is displaye in the Second dropdown
    * Text of "Select Dashboard Content Popup > Content > #2 of Dropdowns" should be "$title" ignoring case
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    # Remember text of displayed links under dropdowns as "titles"
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles"
    # Save the changes by clicking "Save And Close" button
    * I click "Select Dashboard Content Popup > Save And Close"
    * I remember index of "Content Box > #3 of Main Content Types > # 1 of Content Types > Titles" exactly matching "UNITED KINGDOM" as "index"
    # Verify that in "UNITED KINGDOM" content type within 3rd Main Content Type "UK Regulators & Bodies" text is displayed in the First dropdown
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    # Verify that in "UNITED KINGDOM" content type within 3rd Main Content Type "{$title}" text is displayed in the Second dropdown
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be "$title" ignoring case
    # Verify that "$titles" links are displayed under dropdowns in "UNITED KINGDOM" content type within 3rd Main Content Type
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > Links" as "titles2"
    * "$titles" collection should be equal to "$titles2" collection ignoring case

  @CU-33720
  Scenario: Verify that selection on dashboard reflects selection on "Select Dashboard Content" overlay (1 drop down)
    * I am logged in
    # Open "HEALTHCARE" PA
    * I am on "HEALTHCARE" PA
    # Click "Config" button in Header of #1 of  Main Content Types
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Click "Medicare and Medicaid" in "Group" dropdown
    * I click "Select Dashboard Content Popup > Header > Group Dropdown >#Medicare and Medicaid in Items"
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "Medicare and Medicaid" ignoring case
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "- SELECT -" ignoring case
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > #1 of Items" should be visible
    * I remember number of "Select Dashboard Content Popup > Content > #1 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Click on any item except 1 in First dropdown displayed in the content area of "Select Dashboard Content" popup and remember its text as "title"
    * I remember text of "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items" as "title"
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items"
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    # Verify texts of displayed links under dropdown as "titles"
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles"
    # Save changes by click on "Save & Close" button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Content Box > #1 of Main Content Types > #MEDICARE AND MEDICAID in Content Types > Loading Indicator" should not be visible
    # Verify that in content type "MEDICARE AND MEDICAID" of First Main Content Type First dropdown with "{$title}" text is displayed
    * "Content Box > #1 of Main Content Types > #MEDICARE AND MEDICAID in Content Types > #1 of Dropdowns" should be visible
    * Text of "Content Box > #1 of Main Content Types > #MEDICARE AND MEDICAID in Content Types > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Content Box > #1 of Main Content Types > #MEDICARE AND MEDICAID in Content Types > #1 of Links" should be visible
    # Verify that "$titles" links are displayed under dropdown in in "MEDICARE AND MEDICAID" of First Main Content Type
    * I remember text of "Content Box > #1 of Main Content Types > #MEDICARE AND MEDICAID in Content Types > Links" as "titles2"
    * "$titles" collection should be equal to "$titles2" collection ignoring case

  @CU-33738
  Scenario Outline: Verify that changes that were applied to content flat list content group on Dashboard are persistent (across one session)
    * I am logged in
    # Open "ANTITRUST & COMPETITION" PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * I remember number of "Content Box > #{$randombox} of  Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    * I remember text of "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember number of links displayed in any content type within any of Main Content Types as "grouplinks"
    * I remember number of "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click on title of this content group
    * I click "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Title"
    # Click "Customize" in "See All" popup
    * I click "See All Popup > Customize"
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify that number of links with selected checkboxes is the same as on dashboard ("{$grouplinks}")
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$grouplinks}"
    # Remember number of <element> from examples as "links"
    * I remember number of "<element>" as "links"
    * I remember random integer below "{$links}" as "randomlinks"
    # Click any checked/ unchecked checkbox according to examples
    * I click "<randomlink>"
    * I wait until "Loading Indicator" is gone
    # Remember texts of links with checked checkboxes as "checkedlinks"
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    # Save the changes by click on "Save & Close" button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "See All Popup" should not be visible
    * I click "Session Navigator > Session Navigator Tab"
    # Navigate to "CYBERSECURITY & PRIVACY" PA through "Session Navigator"
    * I click "Session Navigator > #CYBERSECURITY & PRIVACY in Practice Areas List Items"
    * I wait until "Loading Indicator" is gone
    * "Content Box > #1 of Main Content Types > #1 of Content Types > See All" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    # Navigate back to "ANTITRUST & COMPETITION" PA through "Session Navigator"
    * I click "Session Navigator > #ANTITRUST & COMPETITION in Practice Areas List Items"
    * I wait until "Loading Indicator" is gone
    * "Content Box > #{$randombox} of Main Content Types" should be visible
    * "Content Box > #{$randombox} of Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Verify that changes made for rememebr content types are saved and displayed on dashboard: displayed links should correspond to "$checkedlinks"
    * I remember text of "Content Box > #{$randombox} of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks2"
    * "$grouplinks2" collection should be equal to "$checkedlinks" collection ignoring case

    Examples:
      | element                                                              | randomlink                                                                              |
      | Select Dashboard Content Popup > Content > Link Unchecked Checkboxes | Select Dashboard Content Popup > Content > #{$randomlinks} of Link Unchecked Checkboxes |
      | Select Dashboard Content Popup > Content > Link Checked Checkboxes   | Select Dashboard Content Popup > Content > #{$randomlinks} of Link Checked Checkboxes   |

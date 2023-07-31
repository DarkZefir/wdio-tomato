@critical_path
@mvl
Feature: Customization 1

  @CU-33708
  Scenario Outline: Verify Reorder UI elements on "Select Dashboard Content" overlay (changed number of links)
    * I am logged in
    # Go to 'Antitrust & Competition' PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of content boxes under the first content container
    * I remember number of "Content Box > #1 of  Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    # Remember the title of any content box under the selected content container
    * I remember text of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember the titles of the links for the selected content box
    * I remember number of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click on the title of the selected content box
    * I click "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Title"
    * "See All Popup" should be visible
    # Click on Customize button
    * I click "See All Popup > Customize"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the group drop-down is equal to the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify that the number of checked links is equal to the number of the links memorized on the PA
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$grouplinks}"
    # Remember the number of elements from examples
    * I remember number of "<element>" as "links"
    # Click on any link
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of <checkboxes>"
    * I wait until "Loading Indicator" is gone
    # Remember the number of checked links
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    # Click on 'Reorder' link
    * I click "Select Dashboard Content Popup > Header > Reorder Button"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the group drop-down is equal to the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify that Group drop-down and links checkboxes are disabled
    * "Select Dashboard Content Popup > Header > Group Dropdown > Button" should not be enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should not be enabled
    # Verify that 'Done', 'X Close' and 'Cancel' buttons are enabled
    * "Select Dashboard Content Popup > Header > Done Button" should be enabled
    # Verify that 'Save & Close' button is disabled
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    # Remember the titles of the links
    * I remember text of "Select Dashboard Content Popup > Content > Link Texts" as "titles2"
    # Verify that the titles of the links are equal to the titles of the checked links
    * "$titles2" collection should be equal to "$checkedlinks" collection ignoring case ignoring order
    # Click on 'Done' button
    * I click "Select Dashboard Content Popup > Header > Done Button"
    * "Select Dashboard Content Popup" should be visible
    # Click on 'X Close' button
    * I click "Select Dashboard Content Popup > X Close Button"
    * "Confirmation Popup" should be visible
    # Click on 'Yes' button on the Confirmation popup
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Select Dashboard Content Popup" should not be visible

    Examples:
      | element                                                              | checkboxes                |
      | Select Dashboard Content Popup > Content > Link Unchecked Checkboxes | Link Unchecked Checkboxes |
      | Select Dashboard Content Popup > Content > Link Checked Checkboxes   | Link Checked Checkboxes   |

  @CU-33713
  Scenario: Verify that "Reorder" functionality is not available for group with less than 2 selected links on "Select Dashboard Content" overlay
    * I am logged in
    # Go to 'Government Contracts' PA
    * I am on "GOVERNMENT CONTRACTS" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of content boxes under the first content container
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups1"
    # Click on Customize button
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Remember the number of drop-down items
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    # Click on any item of the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomInt(1, $dropdowntitles)} of Items"
    # Remember the title of the drop-down input
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown" as "title"
    * "Select Dashboard Content Popup > Select All Items Checkbox" should be visible
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    * "Select Dashboard Content Popup > Select All Items Checkbox" should be selected
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    # Verify that 'Reorder' link is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should not be enabled
    # Remember the number of unchecked links
    * I remember number of "Select Dashboard Content Popup > Content > Link Unchecked Checkboxes" as "links"
    # Click on any unchecked link
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of Link Unchecked Checkboxes"
    # Verify that 'Reorder' link is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should not be enabled
    # Remember the number of unchecked links
    * I remember number of "Select Dashboard Content Popup > Content > Link Unchecked Checkboxes" as "links"
    # Click on any unchecked link
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of Link Unchecked Checkboxes"
    # Verify that 'Reorder' link is enabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled

  @CU-33716
  Scenario: Verify UI elements on "Select Dashboard Content" overlay (2 drop downs with preselected value)
    * I am logged in
    # Go to 'Securities - Federal & International' PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the title of the content box exactly matching 'UNITED KINGDOM'
    * I remember index of "Content Box > #3 of Main Content Types > Content Types > Title" exactly matching "UNITED KINGDOM" as "index"
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be visible
    # Click on the first drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns"
    * I wait until "Loading Indicator" is gone
    # Click on the third item in the drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns > #3 of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of the first drop-down is 'UK Regulators & Bodies'
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be visible
    # Click on the second drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns"
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #1 of Items" should be visible
    # Remember the number of items in the second drop-down
    * I remember number of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember the title of any item in the second drop-down and click on it
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #{$randomlink} of Items" as "title"
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #{$randomlink} of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of the second drop-down is the title of the selected item
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be "{$title}" ignoring case
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Remember the titles of the links below
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > Links" as "titles"
    # Click on 'Customize' button
    * I click "Content Box > #3 of  Main Content Types > Header Config"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on 'Group' drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #United Kingdom in Items"
    # Verify that the input of 'Group' drop-down is 'United Kingdom'
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "United Kingdom" ignoring case
    # Verify that the input of the first drop-down is 'UK Regulators & Bodies' ignoring case (enabled)
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be enabled
    # Verify that the input of the second drop-down is the title of the selected item (enabled)
    * Text of "Select Dashboard Content Popup > Content > #2 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Content > #2 of Dropdowns" should be enabled
    # Verify that 'Save & Close' button is disabled
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    # Verify that 'X Close' and 'Cancel' buttons are enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    # Verify that 'Do not display this group' checkbox is visible
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should be visible
    # Verify that 'Select All Items' checkbox is not visible
    * "Select Dashboard Content Popup > Select All Items Checkbox" should not be visible
    * Text of "Select Dashboard Content Popup > Header > Do Not Display Group Text" should be "Do Not Display" ignoring case ignoring whitespaces
    * "Select Dashboard Content Popup > Header > Reorder Button" should be visible
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles2"
    # Verify that the titles of the links on the overlay are equal to the titles of links displayed after selecting the second drop-down on the PA
    * "$titles" collection should be equal to "$titles2" collection ignoring case

  @CU-33744
  Scenario: Verify that changes that were applied to drop down selection are persistent (across sessions)
    * I am logged in
    # Go to 'Tax - Estates, Gifts & Trusts' PA
    * I am on "TAX - ESTATES, GIFTS & TRUSTS" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the title of the content box exactly matching 'STATE & LOCAL'
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" exactly matching "STATE & LOCAL" as "index"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be visible
    # Verify that the drop-down input is '-SELECT-'
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be "- SELECT -"
    # Click on the drop-down
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #1 of Items" should be visible
    # Remember the number of drop-down items
    * I remember number of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember the title of any item of the drop-down
    * I remember text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #{$randomlink} of Items" as "title"
    # Click on this item in the drop-down
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown > #{$randomlink} of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that the drop-down input is the selected in the drop-down state
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be "{$title}" ignoring case
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Remember the titles of the links under the drop-down
    * I remember text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Links" as "grouplinks"
    # Click on Logout in User Menu
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"
    # Login
    * I am logged in without cleanup
    * "Session Navigator > Session Navigator Tab" should be visible
    # Click on 'Tax - Estates, Gists & Trusts' in Session Navigator
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > #TAX - ESTATES, GIFTS & TRUSTS in Practice Areas List Items"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Remember the titles of the links for 'State & Local' content box
    * I remember text of "Content Box > #1 of  Main Content Types > #{$index} of Content Types > Links" as "grouplinks2"
    # Verify that the titles of the links on the PA are equal to the titles of the links that were previously memorized
    * "$grouplinks2" collection should be equal to "$grouplinks" collection ignoring case
    # Verify that the drop-down input is the selected in the drop-down state
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Dropdown" should be "{$title}" ignoring case

  @CU-33745
  Scenario: Verify that changes that were applied to group with 2 drop downs are persistent (after page refresh)
    * I am logged in
    # Go to 'Securities - Federal & International' PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the title of the content box exactly matching 'UNITED KINGDOM'
    * I remember index of "Content Box > #3 of Main Content Types > Content Types > Title" exactly matching "UNITED KINGDOM" as "index"
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be visible
    # Click on the first drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns"
    * I wait until "Loading Indicator" is gone
    # Click on the third item in the drop-dow
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns > #3 of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of the first drop-down is 'UK Regulators & Bodies'
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be visible
    # Click on the second drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns"
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #1 of Items" should be visible
    # Remember the number the items in the second drop-down
    * I remember number of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember the number the title of any item in the second drop-down
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #{$randomlink} of Items" as "title"
    # Click on this item
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #{$randomlink} of Items"
    * I wait until "Loading Indicator" is gone
    # Verify that the input of the second drop-down is the title of the selected in the drop-down item
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be "{$title}" ignoring case
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Remember the titles of the links under the drop-down
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > Links" as "titles"
    # Click on browser refresh button
    * I click browser refresh button
    * "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Links" should be visible
    # Verify that the input of the first drop-down is 'UK Regulators & Bodies'
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    # Verify that the input of the second drop-down is the title of the selected in the drop-down item
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be "{$title}" ignoring case
    * I remember text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > Links" as "titles2"
    # Verify that the titles of the links on the PA are equal to the titles of the links that were previously memorized
    * "$titles" collection should be equal to "$titles2" collection ignoring case

  @CU-33746
  Scenario Outline: Verify that changes are not applied to Dashboard if user doesn't save customization on "Select Dashboard" overlay (flat list)
    * I am logged in
    # Go to 'Antitrust & Competition' PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of the content boxes of the selected content container
    * I remember number of "Content Box > #1 of  Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    # Remember the title of any content box
    * I remember text of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember the number of the links under the selected content box
    * I remember number of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click on the title of the selected content box
    * I click "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Title"
    * "See All Popup" should be visible
    # Click on 'Customize' button
    * I click "See All Popup > Customize"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the Group drop-down is the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify that the number of checked links is equal to the number of links memorized on the PA
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$grouplinks}"
    # Remember the number of elements from examples
    * I remember number of "<element>" as "links"
    # Click on the link from examples
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of <checkboxes>"
    # Click on 'Cancel' button
    * I click "Select Dashboard Content Popup > Cancel Button"
    * "Confirmation Popup" should be visible
    # Click on 'Yes' on the Confirmation overlay
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    * "Select Dashboard Content Popup" should not be visible
    # Verify that the number of links on the overlay is equal to the number of the links memorized on the PA
    * Count of "Content Box > #1 of  Main Content Types > #{$randomgroup} of Content Types > Links" should be equal to "{$grouplinks}"

    Examples:
      | element                                                              | checkboxes                |
      | Select Dashboard Content Popup > Content > Link Unchecked Checkboxes | Link Unchecked Checkboxes |
      | Select Dashboard Content Popup > Content > Link Checked Checkboxes   | Link Checked Checkboxes   |

  @CU-33748
  Scenario Outline: Verify user can apply changes to more than 1 group via "Select Dashboard Content" overlay
    * I am logged in
    # Go to 'Healthcare' PA
    * I am on "HEALTHCARE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on Customize icon
    * I click "Content Box > #1 of  Main Content Types > Header Config"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Click on 'Medicare and Medicaid' in the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #Medicare and Medicaid in Items"
    # Verify that the input of the 'Group' drop-down is 'Medicare and Medicaid'
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "Medicare and Medicaid" ignoring case
    # Verify that the input of the first content drop-down is '-SELECT-'
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "- SELECT -" ignoring case
    # Click on the first content drop-down
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > #1 of Items" should be visible
    # Remember the number of items in the drop-down
    * I remember number of "Select Dashboard Content Popup > Content > #1 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    # Remember the title of any item in the drop-down
    * I remember text of "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items" as "title"
    # Click on this item
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items"
    # Verify that the input of the first content drop-down is the item selected in the drop-down
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Loading Indicator" should not be visible
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    # Remember the titles of the items under the drop-down
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles"
    # Click on 'Group' drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #News & Commentary in Items"
    # Click on 'News & Commentary' in 'Group' drop-down
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "NEWS & COMMENTARY" ignoring case
    # Remember the number of elements from examples
    * I remember number of "<element>" as "links"
    # Click on the link from examples
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of <checkboxes>"
    # Remember the titles of the checked links
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    # Click 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    # Remember the title of the content box exactly matching 'MEDICARE AND MEDICAID'
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" exactly matching "MEDICARE AND MEDICAID" as "index"
    * "Content Box > #1 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be visible
    # Verify that the input of the first drop-down is previously selected in the drop-down item
    * Text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > #1 of Dropdowns" should be "{$title}" ignoring case
    # Remember the titles of the links under the drop-down
    * I remember text of "Content Box > #1 of Main Content Types > #{$index} of Content Types > Links" as "titles2"
    # Verify that the titles of the links on the PA are equal to the titles of the links on the overlay
    * "$titles" collection should be equal to "$titles2" collection ignoring case
    # Remember the title of the content box exactly matching 'NEWS & COMMENTARY'
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" exactly matching "NEWS & COMMENTARY" as "index2"
    # Verify that the titles of the checked links on the overlay are equal to the titles of the links under 'News & Commentary' content box
    * I remember text of "Content Box > #1 of Main Content Types > #{$index2} of Content Types > Links" as "titles3"
    * "$titles3" collection should be equal to "$checkedlinks" collection ignoring case

    Examples:
      | element                                                              | checkboxes                |
      | Select Dashboard Content Popup > Content > Link Unchecked Checkboxes | Link Unchecked Checkboxes |
      | Select Dashboard Content Popup > Content > Link Checked Checkboxes   | Link Checked Checkboxes   |


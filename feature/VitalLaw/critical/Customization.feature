@critical_path
@mvl
Feature: Customization

  @CU-33069
  Scenario: Verify that all groups from Dashboard are available in "Select Dashboard Content" overlay
    * I am logged in
    # Go to 'Products Liability & Insurance' PA
    * I am on "PRODUCTS LIABILITY & INSURANCE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    # Remember the titles of the content boxes under any content container
    * I remember text of "Content Box > #{$randombox} of Main Content Types > Content Types > Title" as "grouptitles"
    # Click on Customize button
    * I click "Content Box > #{$randombox} of Main Content Types > Header Config"
    * "Select Dashboard Content Popup" should be visible
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Remember the titles of drop-down items
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    # Verify that titles of drop-down items are equal to the titles of the content boxes under selected content container
    * "$grouptitles" collection should be equal to "$dropdowntitles" collection ignoring case

  @CU-33076
  Scenario: Verify that user can select any group from dropdown on "Select Dashboard Content" overlay
    * I am logged in
    # Go to 'Blockchain & Virtual Currencies' PA
    * I am on "BLOCKCHAIN & VIRTUAL CURRENCIES" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on Customize button
    * I click "Content Box > #1 of Main Content Types > Header Config"
    * "Select Dashboard Content Popup" should be visible
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Remember the titles of drop-down items
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdownitems"
    * I remember random integer below "{$dropdownitems}" as "randomdropdownitems"
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomdropdownitems} of Items" as "grouptitle"
    # Click on any item in the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomdropdownitems} of Items"
    # Verify that the drop-down input contains the selected item
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Remember the titles of the links of the overlay
    * I remember text of "Select Dashboard Content Popup > Content > Link Texts" as "links"
    # Click on 'Cancel' button
    * I click "Select Dashboard Content Popup > Cancel Button"
    * "Select Dashboard Content Popup" should not be visible
    # Click on the selected content box
    * I remember index of "Content Box > #1 of Main Content Types > Content Types > Title" matching "{$grouptitle}" ignoring case as "index"
    * I click "Content Box > #1 of Main Content Types > #{$index} of Content Types > Title"
    * "See All Popup" should be visible
    * I remember text of "See All Popup > Links" as "links2"
    # Verify that the links of the current overlay are equal to the links displayed on the customize overlay
    * "$links" collection should be equal to "$links2" collection ignoring case ignoring order

  @CU-33552
  Scenario: Verify that "See All" button display depends on a number of selected links
    * I am logged in
    # Go to 'Blue Chip' PA
    * I am on "BLUE CHIP" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    # Remember the title of any content box under the first content container
    * I remember text of "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Click on See All button under the selected content box
    * I click "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > See All"
    * "See All Popup" should be visible
    # Remember the number of the links
    * I remember number of "See All Popup > Links" as "alllinks"
    # Click on 'Customize' button
    * I click "See All Popup > Customize"
    # Verify that the overlay title is 'Select Dashboard Content'
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the Group drop-down is the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    # Verify that the number of the items of the overlay is equal to the number of the memorized links
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$alllinks}"
    # Click on 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    # Verify that 'See All' button is no longer displayed
    * "See All Popup" should not be visible
    # Verify that the number of the items of the content box is equal to the number of the memorized links
    * Count of "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > Links" should be equal to "{$alllinks}"
    * "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > See All" should not be visible
    # Click on the title of the selected content box
    * I click "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > Title"
    * "See All Popup" should be visible
    # Click on 'Customize' button
    * I click "See All Popup > Customize"
    # Verify that the overlay title is 'Select Dashboard Content'
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the Group drop-down is the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Remember the number of selected links
    * I remember number of "Select Dashboard Content Popup > Content > Link Checked Checkboxes" as "links"
    # Uncheck any link
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of Link Checked Checkboxes"
    # Remember the number of the selected links
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    * "Select Dashboard Content Popup > Save And Close" should be enabled
    # Click on 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    * I remember text of "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks2"
    # Verify that the number of the links of the selected content box is eqaul to the number of memorized links
    * "$grouplinks2" collection should be equal to "$checkedlinks" collection ignoring case
    # Verify that 'See All' button is displayed
    * "Content Box > #1 of Main Content Types > #{$randomgroup} of Content Types > See All" should be visible

  @CU-33559
  Scenario: Verify that user can hide any content group by unchecking items
    * I am logged in
    # Go to 'Government Contracts' PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of the content boxes of the selected content container
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups1"
    # Click on Customize button in Header of the selected content container
    * I click "Content Box > #1 of Main Content Types > Header Config"
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
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    * "Select Dashboard Content Popup > Select All Items Checkbox" should be selected
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    # Verify that 'Reorder' link is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should not be enabled
    # Click on 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    # Verify that the number of content boxes is less than the number memorized previously
    * Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be less than "{$groups1}"
    # Verify that the content box with the title previously selected in the drop-down is not displayed on the PA
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should not contain "{$title}" ignoring case

  @CU-33561
  Scenario: Verify that content group is shown on Dashboard when at least 1 item is selected to display
    * I am logged in
    # Go to 'ANTITRUST & COMPETITION' PA
    * I am on "ANTITRUST & COMPETITION" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Remember the number of the content boxes of the selected content container
    * I remember number of "Content Box > #1 of Main Content Types > Content Types > Title" as "groups1"
    # Click on Customize button in Header of the selected content container
    * I click "Content Box > #1 of Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Remember the number of drop-down items
    * I remember number of "Select Dashboard Content Popup > Header > Group Dropdown > Items" as "dropdowntitles"
    * I remember random integer below "{$dropdowntitles}" as "randomtitle1"
    # Click on any item of the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomtitle1} of Items"
    # Remember the title of the drop-down input
    * I remember text of "Select Dashboard Content Popup > Header > Group Dropdown" as "title"
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    * "Select Dashboard Content Popup > Select All Items Checkbox" should be selected
    # Click on 'Select All Items' checkbox
    * I click "Select Dashboard Content Popup > Select All Items Checkbox"
    # Verify that 'Reorder' link is disabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should not be enabled
    # Click on 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    # Verify that the number of content boxes is less than the number memorized previously
    * Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be less than "{$groups1}"
    # Verify that the content box with the title previously selected in the drop-down is not displayed
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should not contain "{$title}" ignoring case
    # Click on Customize button in Header of the selected content container
    * I click "Content Box > #1 of Main Content Types > Header Config"
    * "Select Dashboard Content Popup" should be visible
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on Group drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    # Click on the same item of the drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #{$randomtitle1} of Items"
    # Remember the number of the unchecked links
    * I remember number of "Select Dashboard Content Popup > Content > Link Unchecked Checkboxes" as "links"
    # Select the unchecked link
    * I click "Select Dashboard Content Popup > Content > #{$randomInt(1, $links)} of Link Unchecked Checkboxes"
    # Remember the number of the selected links
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    * "Select Dashboard Content Popup > Save And Close" should be enabled
    # Click on 'Save & Close' button
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Select Dashboard Content Popup" should not be visible
    * "See All Popup" should not be visible
    # Verify that the number of content boxes is equal to the number memorized previously
    * Count of "Content Box > #1 of Main Content Types > Content Types > Title" should be equal to "{$groups1}"
    # Verify that the content box with the title previously selected in the drop-down is displayed on the PA
    * Text in collection of "Content Box > #1 of Main Content Types > Content Types > Title" should contain "{$title}" ignoring case

  @CU-33651
  Scenario: Verify Reorder UI elements on "Select Dashboard Content" overlay (default number of links)
    * I am logged in
    # Go to 'Products Liability & Insurance' PA
    * I am on "PRODUCTS LIABILITY & INSURANCE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * I remember number of "Content Box > Main Content Types" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    # Remember the number of content boxes under any content container
    * I remember number of "Content Box > #{$randombox} of Main Content Types > Content Types > Title" as "groups"
    * I remember random integer below "{$groups}" as "randomgroup"
    # Remember the title of any content box
    * I remember text of "Content Box > #{$randombox} of Main Content Types > #{$randomgroup} of Content Types > Title" as "grouptitle"
    * "Content Box > #{$randombox} of Main Content Types > #{$randomgroup} of Content Types > #1 of Links" should be visible
    # Remember the number of the links for the selected content box
    * I remember number of "Content Box > #{$randombox} of Main Content Types > #{$randomgroup} of Content Types > Links" as "grouplinks"
    # Click on the title of the selected content box
    * I click "Content Box > #{$randombox} of Main Content Types > #{$randomgroup} of Content Types > Title"
    * "See All Popup" should be visible
    # Click on See All -> Customize button
    * I click "See All Popup > Customize"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of the group drop-down is equal to the title of the selected content box
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "{$grouptitle}" ignoring case
    # Verify that the number of checked links is equal to the number of the links memorized on the PA
    * Count of "Select Dashboard Content Popup > Content > Links Checked Text" should be equal to "{$grouplinks}"
    # Verify that 'Reorder' link is enabled
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled
    # Remember the number of the checked links
    * I remember text of "Select Dashboard Content Popup > Content > Links Checked Text" as "checkedlinks"
    # Click on 'Reorder' button
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
    # Verify that the number of links is equal to the number of the links memorized on the PA
    * Count of "Select Dashboard Content Popup > Content > Link Texts" should be equal to "{$grouplinks}"
    # Remember the titles of the links
    * I remember text of "Select Dashboard Content Popup > Content > Link Texts" as "grouplinks2"
    # Verify that the titles of the links are equal to the titles of the checked links
    * "$grouplinks2" collection should be equal to "$checkedlinks" collection ignoring case
    # Click on 'X Close' button
    * I click "Select Dashboard Content Popup > X Close Button"
    # Verify that the overlay is no longer displayed
    * "Select Dashboard Content Popup" should not be visible

  @CU-33692
  Scenario: Verify Reorder UI elements on "Select Dashboard Content" overlay (drop down)
    * I am logged in
    # Go to 'Sexual Harassment & Workplace Compliance' PA
    * I am on "SEXUAL HARASSMENT & WORKPLACE COMPLIANCE" PA
    * "Content Box > #1 of Main Content Types" should be visible
    # Click on Customize button in Header of the selected content container
    * I click "Content Box > #1 of Main Content Types > Header Config"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on 'State Laws, Regulations & Summaries' in 'Group' drop-down
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #State Laws, Regulations & Summaries in Items"
    # Verify that the drop-down input is 'State Laws, Regulations & Summaries'
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "State Laws, Regulations & Summaries" ignoring case
    # Click on the drop-down
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > #1 of Items" should be visible
    # Remember the number of the drop-down items
    * I remember number of "Select Dashboard Content Popup > Content > #1 of Dropdowns > Items" as "links"
    * I remember random integer below "{$links}" and above "2" as "randomlink"
    * I remember text of "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items" as "title"
    # Click on any state name
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #{$randomlink} of Items"
    # Verify that the drop-down input is the title of the selected state
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Loading Indicator" should not be visible
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    # Verify that more than one link is displayed under the drop-down
    * Count of "Select Dashboard Content Popup > Content > Item Titles" should be more than "0"
    # Remember the titles of the links
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles"
    # Click on 'Reorder' button
    * I click "Select Dashboard Content Popup > Header > Reorder Button"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that Group drop-down input is 'State Laws, Regulations & Summaries' (disabled)
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "State Laws, Regulations & Summaries" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown > Button" should not be enabled
    # Verify that the state drop-down input is the previously selected state (disabled)
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "{$title}" ignoring case
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > Button" should not be enabled
    # Verify that 'Done', 'X Close' and 'Cancel' buttons are enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should not be enabled
    * "Select Dashboard Content Popup > Header > Done Button" should be enabled
    # Verify that 'Save & Close' button is disabled
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    # Remember the titles of the links
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles2"
    # Verify that the titles of the links are equal to the titles of previously memorized links
    * "$titles" collection should be equal to "$titles2" collection ignoring case
    # Click on 'Cancel' button
    * I click "Select Dashboard Content Popup > Cancel Button"
    * "Select Dashboard Content Popup" should be visible
    # Click on 'X Close' button
    * I click "Select Dashboard Content Popup > X Close Button"
    # Verify that 'Confirm Cancel' popup is displayed
    * "Confirmation Popup" should be visible
    # Click on 'Yes' button
    * I click "Confirmation Popup > Confirm Button"
    * "Confirmation Popup" should not be visible
    # Verify that overlay is no longer displayed
    * "Select Dashboard Content Popup" should not be visible

  @CU-33706
  Scenario: Verify Reorder UI elements on "Select Dashboard Content" overlay (2 drop downs)
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
    * I wait until "Loading Indicator" is gone
    # Click on the second item in the drop-down
    * I click "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns > #2 of Items"
    # Verify that the input of the second drop-down is 'FCA (Financial Conduct Authority)'
    * Text of "Content Box > #3 of Main Content Types > #{$index} of Content Types > #2 of Dropdowns" should be "FCA (Financial Conduct Authority)" ignoring case
    * I wait until "Loading Indicator" is gone
    # Click on 'Customize' button
    * I click "Content Box > #3 of Main Content Types > Header Config"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    # Click on the active item in the last drop-down
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns"
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns > #FCA (Financial Conduct Authority) in Items"
    # Verify that the input of 'Group' drop-down is 'United Kingdom'
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "UNITED KINGDOM" ignoring case
    * "Select Dashboard Content Popup > Loading Indicator" should not be visible
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    * Count of "Select Dashboard Content Popup > Content > Item Titles" should be more than "0"
    # Remember the titles of the content items
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles"
    # Click on 'Reorder' link
    * "Select Dashboard Content Popup > Header > Reorder Button" should be enabled
    * I click "Select Dashboard Content Popup > Header > Reorder Button"
    # Verify that the overlay with 'Select Dashboard Content' title is displayed
    * Text of "Select Dashboard Content Popup > Title" should be "Select Dashboard Content" ignoring case
    # Verify that the input of 'Group' drop-down is 'United Kingdom' (disabled)
    * Text of "Select Dashboard Content Popup > Header > Group Dropdown" should be "UNITED KINGDOM" ignoring case
    * "Select Dashboard Content Popup > Header > Group Dropdown > Button" should not be enabled
    # Verify that the input of the first drop-down is 'UK Regulators & Bodies' ignoring case (disabled)
    * Text of "Select Dashboard Content Popup > Content > #1 of Dropdowns" should be "UK Regulators & Bodies" ignoring case
    * "Select Dashboard Content Popup > Content > #1 of Dropdowns > Button" should not be enabled
    # Verify that the input of the second drop-down is 'FCA (Financial Conduct Authority)' (disabled)
    * Text of "Select Dashboard Content Popup > Content > #2 of Dropdowns" should be "FCA (Financial Conduct Authority)" ignoring case
    * "Select Dashboard Content Popup > Content > #2 of Dropdowns > Button" should not be enabled
    # Verify that 'Done', 'X Close' and 'Cancel' buttons are enabled
    * "Select Dashboard Content Popup > Header > Do Not Display Group Checkbox" should not be enabled
    * "Select Dashboard Content Popup > Header > Done Button" should be enabled
    # Verify that 'Do not display this group' checkbox and 'Save & Close' button are disabled
    * "Select Dashboard Content Popup > Save And Close" should not be enabled
    * "Select Dashboard Content Popup > X Close Button" should be enabled
    * "Select Dashboard Content Popup > Cancel Button" should be enabled
    # Remember the titles of the content items
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "titles2"
    # Verify that the titles of the content items are equal to the ones memorized previously
    * "$titles" collection should be equal to "$titles2" collection ignoring case
    # Click on 'X Close' button
    * I click "Select Dashboard Content Popup > X Close Button"
    # Verify that the overlay is no longer displayed
    * "Select Dashboard Content Popup" should not be visible

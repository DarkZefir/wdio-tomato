@critical_path
@mvl
Feature: PED 14

  @CU-42102
  Scenario Outline: Email/Download overlay in All Content SRL has no RTF option
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Open 1st document
    * I click "#1 of Documents > Checkbox"
    # Click Email/Download
    * I click "Toolbar Buttons > <button> Button"
    # Email/Download popup should include "We are temporarily offering PDF only format. Word compatible format will be available again in the near future." message
    * Text of "<button> Popup > Temporary Message" should be "We are temporarily offering PDF only format. Word compatible format will be available again in the near future."
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible
    # Select list only option in Include dropdown
    * I click "<button> Popup > Include Dropdown"
    * I click "<button> Popup > Include Dropdown > #2 of Items"
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible

    Examples:
      | button   | searchTerm |
      | Email    | cat        |
      | Download | cat        |

  @CU-42103
  Scenario Outline: Email/Download overlay in L&R SRL has no RTF option
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>" on Laws & Regulations
    # Open 1st document
    * I click "#1 of Documents > Checkbox"
    # Click Email/Download
    * I click "Toolbar Buttons > <button> Button"
    # Email/Download popup should include "We are temporarily offering PDF only format. Word compatible format will be available again in the near future." message
    * Text of "<button> Popup > Temporary Message" should be "We are temporarily offering PDF only format. Word compatible format will be available again in the near future."
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible
    # Select list only option in Include dropdown
    * I click "<button> Popup > Include Dropdown"
    * I click "<button> Popup > Include Dropdown > #2 of Items"
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible

    Examples:
      | button   | searchTerm |
      | Email    | cat        |
      | Download | cat        |

  @CU-42104
  Scenario Outline: Email/Download overlay in favorites has no RTF option
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Add 1st doc to a favorites
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * "Add To Popup > #1 of Dropdowns > #1 of Items" should be visible
    * I click "Add To Popup > #1 of Dropdowns > #Favorites in Items"
    * "Add To Popup > Save And Close" should be clickable
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Open favorites
    * I click "Header > Favorites Button"
    * "Favorites Popup" should be visible
    * "Favorites Popup > #1 of Items" should be visible
    # Select a doc
    * I click "Favorites Popup > #1 of Item Checkboxes"
    # Click Email/Download
    * I click "Favorites Popup > Toolbar Buttons > <button> Button"
    # Email/Download popup should include "We are temporarily offering PDF only format. Word compatible format will be available again in the near future." message
    * Text of "<button> Popup > Temporary Message" should be "We are temporarily offering PDF only format. Word compatible format will be available again in the near future."
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible
    # Select list only option in Include dropdown
    * I click "<button> Popup > Include Dropdown"
    * I click "<button> Popup > Include Dropdown > #2 of Items"
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible

    Examples:
      | button   | searchTerm |
      | Email    | cat        |
      | Download | cat        |

  @CU-42105
  Scenario Outline: Email/Download overlay in folders has no RTF option
    * I am logged in
    # Perform a search
    * I perform search of "<searchTerm>"
    # Add 1st doc to a folder
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Add To Button"
    * "Add To Popup" should be visible
    * I click "Add To Popup > #1 of Dropdowns"
    * "Add To Popup > #1 of Dropdowns > #1 of Items" should be visible
    * I click "Add To Popup > #1 of Dropdowns > #Folder in Items"
    * "Add To Popup > Folder Name" should be visible
    * I type "CU-42105" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be clickable
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    # Open folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-42105 in Items"
    * "Folder Popup" should be visible
    # Select a doc
    * I click "Folder Popup > #1 of Items > Checkbox"
    # Click Email/Download
    * I click "Folder Popup > Toolbar Buttons > <button> Button"
    # Email/Download popup should include "We are temporarily offering PDF only format. Word compatible format will be available again in the near future." message
    * Text of "<button> Popup > Temporary Message" should be "We are temporarily offering PDF only format. Word compatible format will be available again in the near future."
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible
    # Select list only option in Include dropdown
    * I click "<button> Popup > Include Dropdown"
    * I click "<button> Popup > Include Dropdown > #2 of Items"
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible

    Examples:
      | button   | searchTerm |
      | Email    | cat        |
      | Download | cat        |

  @CU-42106
  Scenario Outline: Email/Download overlay in L&R read view has no RTF option
    * I am logged in
    # Open L&R document
    * I open "<docId>" document
    * "Show Metadata" should be visible
    # Click Email/Download button
    * I click "Toolbar Buttons > <button> Button"
    * "<button> Popup" should be visible
    # Email/Download popup should include "We are temporarily offering PDF only format. Word compatible format will be available again in the near future." message
    * Text of "<button> Popup > Temporary Message" should be "We are temporarily offering PDF only format. Word compatible format will be available again in the near future."
    # Format dropdown value should be "PDF" and it should be the only one value
    * Text of "<button> Popup > Format Dropdown" should be "PDF"
    * I click "<button> Popup > Format Dropdown"
    * "<button> Popup > Include Dropdown > #2 of Items" should not be visible

    Examples:
      | button   | docId                                       |
      | Email    | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 |
      | Download | us-regs-e43babcc8d534e6f5b305e1277d49850-v1 |
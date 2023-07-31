@critical_path
@mvl
Feature: PED 12

  @CU-32686
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Folders for Print
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
    * I type "CU-32686" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be clickable
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I wait 3 seconds
    # Open folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-32686 in Items"
    * "Folder Popup" should be visible
    * "Folder Popup > #1 of Items" should be visible
    # Select a doc
    * I click "Folder Popup > #1 of Items > Checkbox"
    # Click print
    * I click "Folder Popup > Toolbar Buttons > Print Button"
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Print Button" should be enabled
    * I wait 3 seconds
    # Click Print
    * I click "Print Popup > Print Button"
    * "Notice Popup" should be visible
    # Title of notice pop up should be "NOTICE"
    * Text of "Notice Popup > Notice Title" should be "NOTICE"
    # Notice popup should have text: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Notice Popup > Notice Message" should contain "You have selected"
    * Text of "Notice Popup > Notice Message" should contain "<docCount> documents. Please select no more than 100 documents."
    # Close notice popup
    * I click "Notice Popup > Close Button"
    # There should be message in red: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Print Popup > #1 of Error Messages" should contain "You have selected"
    * Text of "Print Popup > #1 of Error Messages" should contain "<docCount> documents. Please select no more than 100 documents."
    Examples:
      |               | searchTerm                       | docCount       |
      | regular >1000 | WKUS_TAL_412                     | more than 1000 |
      | regular <1000 | WKUS_TAL_16490                   |                |
      | L&R >1000     | WKUS_TAL_20120                   | more than 1000 |
      | L&R <1000     | Title 7 Agriculture commissioner |                |
  # |regular <1000|WKUS_TAL_8199                   |              |
  # |regular <1000|WKUS_TAL_18026                  |              |

  @CU-32687
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Folders for Email
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
    * I type "CU-32687" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be clickable
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I wait 5 seconds
    # Open folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-32687 in Items"
    * "Folder Popup" should be visible
    * "Folder Popup > #1 of Items" should be visible
    # Select a doc
    * I click "Folder Popup > #1 of Items > Checkbox"
    # Click email
    * I click "Folder Popup > Toolbar Buttons > Email Button"
    * "Email Popup > Loading Indicator" should not be visible
    * "Email Popup > Email Button" should be enabled
    * I wait 3 seconds
    # Click email
    * I click "Email Popup > Email Button"
    * "Notice Popup" should be visible
    # Title of notice pop up should be "NOTICE"
    * Text of "Notice Popup > Notice Title" should be "NOTICE"
    # Notice popup should have text: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Notice Popup > Notice Message" should contain "You have selected"
    * Text of "Notice Popup > Notice Message" should contain "<docCount> documents. Please select no more than 100 documents."
    # Close notice popup
    * I click "Notice Popup > Close Button"
    # There should be message in red: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Email Popup > #1 of Error Messages" should contain "You have selected"
    * Text of "Email Popup > #1 of Error Messages" should contain "<docCount> documents. Please select no more than 100 documents."
    Examples:
      |               | searchTerm                       | docCount       |
      | regular >1000 | WKUS_TAL_412                     | more than 1000 |
      | regular <1000 | WKUS_TAL_16490                   |                |
      | L&R >1000     | WKUS_TAL_20120                   | more than 1000 |
      | L&R <1000     | Title 7 Agriculture commissioner |                |
  # |regular <1000|WKUS_TAL_8199                   |              |
  # |regular <1000|WKUS_TAL_18026                  |              |

  @CU-32690
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Folders for Download
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
    * I type "CU-32690" in "Add To Popup > Folder Name"
    * "Add To Popup > Save And Close" should be clickable
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * I wait 5 seconds
    # Open folder
    * I click "Header > Folders Dropdown"
    * "Header > Folders Dropdown > #1 of Items" should be visible
    * I click "Header > Folders Dropdown > #CU-32690 in Items"
    * "Folder Popup" should be visible
    * "Folder Popup > #1 of Items" should be visible
    # Select a doc
    * I click "Folder Popup > #1 of Items > Checkbox"
    # Click download
    * I click "Folder Popup > Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * "Download Popup > Download Button" should be enabled
    * I wait 3 seconds
    # Click download
    * I click "Download Popup > Download Button"
    * "Notice Popup" should be visible
    # Title of notice pop up should be "NOTICE"
    * Text of "Notice Popup > Notice Title" should be "NOTICE"
    # Notice popup should have text: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Notice Popup > Notice Message" should contain "You have selected"
    * Text of "Notice Popup > Notice Message" should contain "<docCount> documents. Please select no more than 100 documents."
    # Close notice popup
    * I click "Notice Popup > Close Button"
    # There should be message in red: "You have selected more than 1000/<doc count documents. Please select no more than 100 documents."
    * Text of "Download Popup > #1 of Error Messages" should contain "You have selected"
    * Text of "Download Popup > #1 of Error Messages" should contain "<docCount> documents. Please select no more than 100 documents."
    Examples:
      |               | searchTerm                       | docCount       |
      | regular >1000 | WKUS_TAL_412                     | more than 1000 |
      | regular <1000 | WKUS_TAL_16490                   |                |
      | L&R >1000     | WKUS_TAL_20120                   | more than 1000 |
      | L&R <1000     | Title 7 Agriculture commissioner |                |
# |regular <1000|WKUS_TAL_8199                   |              |
# |regular <1000|WKUS_TAL_18026                  |              |

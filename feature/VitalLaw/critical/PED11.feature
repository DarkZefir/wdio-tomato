@critical_path
@mvl
Feature: PED 11

  @CU-32648
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Favorites for Download
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
    # Click download
    * I click "Favorites Popup > Toolbar Buttons > Download Button"
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

  @CU-32645
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Favorites for Print
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
    # Click print
    * I click "Favorites Popup > Toolbar Buttons > Print Button"
    * "Print Popup" should be visible
    * "Print Popup > Loading Indicator" should not be visible
    * "Print Popup > Print Button" should be enabled
    * I wait 3 seconds
    # Click print
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

  @CU-32646
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Favorites for Email
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
    # Click email
    * I click "Favorites Popup > Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
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
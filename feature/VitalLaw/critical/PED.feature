@critical_path
@mvl
Feature: PED

  @CU-32083
  @local
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Search Results List for Print
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "#1 of Documents > Checkbox"
    * "Toolbar Buttons > Print Button" should be clickable
    * I click "Toolbar Buttons > Print Button"
    * "Print Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
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

  @CU-32086
  @local
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Search Results List for Email
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
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

  @CU-32088
  @local
  Scenario Outline: Correspondent overlay is displayed if there are >100 docs are selected from Search Results List for Download
    * I am logged in
    * I perform search of "<searchTerm>"
    * I click "#1 of Documents > Checkbox"
    * I click "Toolbar Buttons > Download Button"
    * "Download Popup > Loading Indicator" should not be visible
    * I wait 3 seconds
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

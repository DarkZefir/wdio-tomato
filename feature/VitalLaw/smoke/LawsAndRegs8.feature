@smoke
@mvl
@session_navigator
Feature: Session Navigator, History

  @CU-41320
  Scenario Outline: Verify UI of 'Email' popup opened from Laws&Regs SRL
    * I am logged in
    #Perform any search on Laws&Regs
    * I perform search of "<term>" on Laws & Regulations
    #Select any document from SRL clicking on checkbox
    * I click "#1 of Documents > Checkbox"
    #Click Email buttom on the Toolbar
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    #Verify UI of Email Popup
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * "Email Popup > Email Subject Label" should be visible
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Include Attachment Label" should be visible
    * Text of "Email Popup > Include Attachment Label" should be "Include Attachment"
    * "Email Popup > Include Dropdown" should be visible
    * Text of "Email Popup > Include Dropdown > Label" should be "COMPLETE DOCUMENTS"
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

    Examples:
      | term      |
      | camembert |

  @CU-41321
  Scenario Outline: Verify UI of Email Popup for Laws&Regs document opened from SRL
    * I am logged in
    #Perform search of provided document on Laws&Regs
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents > Document Title" should be visible
    * I wait until "Loading Indicator" is gone
    #Perform search within provided term
    * I perform search of "<term>"
    #Open doc from SRL
    * "#1 of Documents" should be visible
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents > Document Title" should be visible
    * I click "#1 of Documents > Document Title"
    * "Document Frame > Title" should be visible
    * "Toolbar Buttons > Email Button" should be visible
    * "DA Title" should be visible
    * I remember text of "DA Title" as "DATitle"
    #Click Email button in the toolbar
    * I click "Toolbar Buttons > Email Button"
    * "Email Popup" should be visible
    * I wait until "Loading Indicator" is gone
    #Verify UI of Email overlay
    * Text of "Email Popup > Title" should be "EMAIL"
    * "Email Popup > Document Title" should be visible
    * Text of "Email Popup > Document Title" should be "{$DATitle}" ignoring case
    * "Email Popup > Email To Label" should be visible
    * Text of "Email Popup > Email To Label" should be "To"
    * "Email Popup > Email Input" should be visible
    * Value in "Email Popup > Email Input" should not be ""
    * "Email Popup > Email Subject Label" should be visible
    * Text of "Email Popup > Email Subject Label" should be "Subject"
    * "Email Popup > Email Subject" should be visible
    * Value in "Email Popup > Email Subject" should contain "has sent you research materials"
    * "Email Popup > Email Message Label" should be visible
    * Text of "Email Popup > Email Message Label" should be "Message"
    * "Email Popup > Email Message" should be visible
    * Value in "Email Popup > Email Message" should be ""
    * "Email Popup > Format Label" should be visible
    * Text of "Email Popup > Format Label" should be "Format"
    * "Email Popup > Format Dropdown" should be visible
    * Text of "Email Popup > Format Dropdown > Label" should be "PDF"
    * "Email Popup > Options Label" should be visible
    * Text of "Email Popup > Options Label" should be "Options"
    * "Email Popup > Include Search Term Highlights Checkbox" should be visible
    * "Email Popup > Include Search Term Highlights Checkbox" should be selected
    * "Email Popup > Include Search Term Highlights Label" should be visible
    * Text of "Email Popup > Include Search Term Highlights Label" should be "Include search term highlights"
    * "Email Popup > Content Tree" should be visible
    * "Email Popup > Content Tree > #1 of All Content Nodes In Tree Nodes" should be visible
    * "Email Popup > Email Button" should be visible
    * Text of "Email Popup > Email Button" should be "SEND"
    * "Email Popup > Email Button" should be enabled
    * "Email Popup > Cancel Button" should be visible
    * Text of "Email Popup > Cancel Button" should be "CANCEL"
    * "Email Popup > Cancel Button" should be enabled
    * "Email Popup > X Close Button" should be visible
    * "Email Popup > X Close Button" should be enabled
    * I click "Email Popup > X Close Button"
    * "Email Popup" should not be visible

    Examples:
      | doc                                         | term     | type |
      | us-law-e04ca2666db80ed0cf55080692b5de74-v1  | state    | USC  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | section  | CFR  |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | property | SS   |
      | ia-regs-1932406691bcb848e3de97bab5b938a8-v1 | project  | SR   |
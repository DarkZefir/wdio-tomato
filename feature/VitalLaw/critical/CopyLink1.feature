@critical_path
@mvl
Feature: CopyLink

  @CU-34887
  Scenario Outline: URL does not exceed 256 characters #2
    * I am logged in
    # Open doc from examples
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    # Click on Copy Link button
    * I click "Toolbar Buttons > Copy Link Button"
    # Verify that 'The link has been copied to the clipboard' popup is displayed
    * "Blank Info Popup" should be visible
    * I remember clipboard content as "copyurl"
    # Verify that URL is less than 256 characters
    * "{$copyurl}" string should be less than "256" characters
    # Open the copied URL
    * I open "{$copyurl}" url
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "docId"
    # Verify that 'docId' contains 'DocID' from examples
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocType               | DocID                                    |
      | Treatises             | 4083c6c27c8b1000aef190b11c18cbab01       |
      | Explanations          | tpz0809013e2c86362724                    |
      | Annotations           | fed01313014607b681000af1a001b78be8c78010 |
      | News and Blogs        | isg01d45df3447da41000b14a00505688693903  |
      | Capital Histories     | 09013e2c8585032e         |
      | Legislative Summaries | 09013e2c834f77d8                         |
      | Acts and Statutes     | sec016852713a7ce510009a78d8d385ad169403  |
      | Constitutions         | 09013e2c86c4c209                         |
      | Model Laws            | 09013e2c834fc080                         |
      | Organizational Laws   | 09013e2c851a7938                         |

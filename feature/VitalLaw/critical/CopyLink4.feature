@critical_path
@mvl
Feature: CopyLink

  @CU-34889
  Scenario Outline: URL does not exceed 256 characters (TLP) #2
    * I am logged in
    # Open doc from examples
    * I open "<DocID>" topics document
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    # Click on Copy Link button
    * I click "Toolbar Buttons > Copy Link Button"
    # Verify that 'The link has been copied to the clipboard' popup is displayed
    * "Blank Info Popup" should be visible
    * I remember clipboard content as "copyurl"
    # Verify that URL is less than 256 characters
    * "{$copyurl}" string should be less than "256" characters
    # Open the copied URL
    * I open "{$copyurl}" url
    * "Tax Topic Page > Table Of Contents" should be visible
    # Scroll down and click on 'Show Metadata'
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I remember value of "docID" metadata parameter as "docId"
    # Verify that 'docId' contains 'DocID' from examples
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocType                        | DocID                                    |
      | Tax ESSENTIALS - FEDERAL       | tppc0121df0e607c691000a60490b11c18cbab0c |
      | TAX ESSENTIALS - STATE         | tes01b3c2d6d87c6c1000a0e7d8d385ad169409  |
      | TAX ESSENTIALS - INTERNATIONAL | 9097947e7cbb1000b6d6d8d385ad169409       |
      | BANKRUPTCY ESSENTIALS          | 85ce10ea7de71000bd90000d3a8abb4e01       |

  @CU-40306
  Scenario Outline: Verify Copy Link feature in Read View for Laws&Regulations
    * I am logged in
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    * I click "Toolbar Buttons > Copy Link Button"
    * "Blank Info Popup" should be visible
    * I remember clipboard content as "copyurl"
    * "{$copyurl}" string should be less than "256" characters
    * I open "{$copyurl}" url
    * "Document Frame > Document Content" should be visible
    * I scroll to the bottom
    * I click "Show Metadata"
    * I wait 2 seconds
    * I remember "value" of "dcterms:identifier" metadata parameter as "docId" for L&R
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocID                                       |
      | us-law-54030be40c0dbb52dd747f6cb39c2571-v1  |
      | us-regs-a876788ec66fb58b7c26245a4a12a911-v1 |
      | ny-law-d2fb5079bfdcf724f3117bdfc41ea20a-v1  |
      | ia-regs-ec12b6b146f59805aa4ef8a116089541-v1 |

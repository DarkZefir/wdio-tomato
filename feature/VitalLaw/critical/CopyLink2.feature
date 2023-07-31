@critical_path
@mvl
Feature: CopyLink

  @CU-34888
  Scenario Outline: URL does not exceed 256 characters #3
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
      | DocType                         | DocID                                     |
      | Court Rules                     | 601adc347b6c1000a73300237de5959c01        |
      | Final and Temporary Regulations | sec01d0229a887ce51000ae1b90b11c18c9020519 |
      | Proposed Regulations            | c81d2c247da610008e2a00505688693901        |
      | Standards                       | 09013e2c853aadcf                          |
      | Comment Letters                 | 582c3fba7b5b10008f15001b7840a5b201        |
      | Rulings                         | 2669c6c47da810008355005056881d2301        |
      | Agency Decisions                | ead0109013e2c857c6bb5                     |
      | Cases                           | 636399f87da61000839a005056886db701        |
      | Official Forms                  | tfm0149bc673a7bd7100080a490b11c2ac4f101   |
      | Sample Forms                    | 52e5fe7e7bd31000b0c890b11c18c90203        |

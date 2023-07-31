@smoke
@vlcc
@copy_link
Feature: CopyLink

  @CU-33227
  Scenario Outline: URL does not exceed 256 characters #1
    * I am logged in
    * I open "<DocID>" document
    * "Document Frame > Document Content" should be visible
    * I click "Toolbar Buttons > Copy Link Button"
    * "Blank Info Popup" should be visible
    * I remember clipboard content as "copyurl"
    * "{$copyurl}" string should be less than "256" characters
    * I open "{$copyurl}" url
    * "Document Frame > Document Content" should be visible
    * I click "Show Metadata"
    * I remember value of "docID" metadata parameter as "docId"
    * "{$docId}" text should contain "<DocID>" text

    Examples:
      | DocType                               | DocID                                    |
      | Internal Revenue Code — History Notes | irc01011e8d80bf0a5ea86573285e0669a396    |
      | Committee Reports                     | 71a4a9947d151000bc3290b11c18c90201       |
      | Indexes and Tables                    | 09013e2c85a0c358                         |
      | Primary Source in Treatise            | c58deeca7bd610009b6a90b11c18c90201       |
      | Proposed Regulations                  | c81d2c247da610008e2a00505688693901       |
      | Standards                             | 09013e2c853aadcf                         |
      | Comment Letters                       | 582c3fba7b5b10008f15001b7840a5b201       |
      | Rulings                               | 2669c6c47da810008355005056881d2301       |
      | Agency Decisions                      | ead0109013e2c857c6bb5                    |
      | Cases                                 | 636399f87da61000839a005056886db701       |
      | Official Forms                        | sec01067e36ae7bf71000b423d8d385ad1694066 |
      | Sample Forms                          | 52e5fe7e7bd31000b0c890b11c18c90203       |

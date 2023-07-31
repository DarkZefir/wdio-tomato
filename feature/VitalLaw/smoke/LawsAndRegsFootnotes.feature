@smoke
@mvl
@lawsAndRegs_footnotes
Feature: Laws And Regs Footnotes

  @CU-41475
  Scenario Outline: Footnotes box is displayed for Laws&Regs documents
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #1 of Footnote Body Anchors" should be visible
    * I remember number of "Document Frame > Footnote Body Anchors" as "anchors"
    # Scroll To the bottom
    * I scroll to the bottom
    # Verify that Footnotes box is collapsed
    * "Document Frame > Footnotes Header" should be visible
    * "Document Frame > #1 of Footnote Descriptions" should not be visible
    # Expand Footnotes box (click on header)
    * I click "Document Frame > Footnotes Header"
    * I scroll to the bottom
    # Verify that Footnotes box was expanded and Notes Refs and Descriptions are visible
    * "Document Frame > #1 of Footnote Descriptions" should be visible
    * I remember number of "Document Frame > Footnote Refs" as "refs"
    * I remember number of "Document Frame > Footnote Descriptions" as "descriptions"
    * "{$refs}" number should be equal to "{$anchors}"
    * "{$descriptions}" number should be equal to "{$anchors}"

    Examples:
      | doc                                        |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 |

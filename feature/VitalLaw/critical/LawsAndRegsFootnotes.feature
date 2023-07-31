@critical_path
@mvl
@lawsAndRegs_footnotes
Feature: Laws And Regs Footnotes

  @CU-41478
  Scenario Outline: Laws&Regs document is scrolled to the appropriate line when click on note ref from Left Footnotes Panel
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * "Document Frame > #<num> of Footnote Body Anchors" should be visible
    # Scroll to the bottom to move first Note anchor from view
    * I scroll to the bottom
    # Click Footnotes button to the left from ToC panel
    * I click "Tab Triggers > Footnotes"
    * "Footnotes Tab" should be visible
    * "#1 of Footnotes Tab Items" should be visible
    * I remember text of "#<num> of Footnotes Tab Refs" as "noteNum"
    # Click on any Note Ref which is not visible in the document view at the current moment
    * I click "#<num> of Footnotes Tab Refs"
    # Verify that was scrolled to the appropriate line and Note anchor is visible in the document view now
    * "Document Frame > #<num> of Footnote Body Anchors" should be in viewport
    * I remember text of "Document Frame > #<num> of Footnote Body Anchors" as "anchor"
    * "{$anchor}" text should contain "{$noteNum}" text

    Examples:
      | doc                                        | num |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 | 1   |

  @CU-41479
  Scenario Outline: Laws&Regs document is scrolled to the appropriate line when click on note ref from Footnotes box
    * I am logged in
    # Open any Laws & Regs document with Footnotes box
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    # Scroll to the bottom to move first Note anchor from view and to Footnotes box
    * I scroll to the bottom
    # Expand Footnotes box
    * I click "Document Frame > Footnotes Header"
    * I scroll to the bottom
    * I remember text of "Document Frame > #<num> of Footnote Refs" as "noteNum"
    # Click on any Note Ref which is not visible in the document view at the current moment
    * I click "Document Frame > #<num> of Footnote Refs"
    # Verify that was scrolled to the appropriate line and Note anchor is visible in the document view now
    * "Document Frame > #<num> of Footnote Body Anchors" should be in viewport
    * I remember text of "Document Frame > #<num> of Footnote Body Anchors" as "anchor"
    * "{$anchor}" text should contain "{$noteNum}" text

    Examples:
      | doc                                        | num |
      | fl-law-50c975fe424324b3de2bd32881e3addf-v1 | 1   |

@critical_path
@mvl
@Footnotes
Feature: Footnotes

  @CU-29809
  @local
  Scenario: Verify Footnote section is displayed on reading pane
    * I am logged in
    * I perform search of "dcb0138682eac7c211000b18d90b11c18cbab09"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Document Frame > Footnotes Header" should be visible
    * "Document Frame >#1 of Footnote Descriptions" should be visible

  @CU-29813
  @local
  Scenario: Verify Footnotes Panel icon is displayed in document widget
    * I am logged in
    * I perform search of "dcb0138682eac7c211000b18d90b11c18cbab09"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > Footnotes" should be visible
    * I click "Tab Triggers > Footnotes"
    * "Footnotes Tab" should be visible

  @CU-29814
  @local
  Scenario: Verify that page is scrolled to appropriate section of document when User clicks reference in Footnotes section
    * I am logged in
    * I perform search of "a8b7be667c08100088e6d8d385ad169406"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Document Frame > Footnotes Header" should be visible
    * I click "Document Frame > #2 in Footnote Refs"
    * "Document Frame >#2 of Footnote Body Anchors" should be visible

  @CU-29820
  @local
  Scenario: Verify that page is scrolled to appropriate section of document when User clicks reference in Footnotes panel
    * I am logged in
    * I perform search of "a8b7be667c08100088e6d8d385ad169406"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > Footnotes" should be visible
    * I click "Tab Triggers > Footnotes"
    * I click "#3 of Footnotes Tab Refs"
    * "Document Frame > #3 of Footnote Body Anchors" should be visible

  @CU-29826
  @local
  Scenario: Verify that call out overlay appears on hovering over Footnote reference in document body
    * I am logged in
    * I perform search of "a8b7be667c08100088e6d8d385ad169406"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > Footnotes" should be visible
    * I click "Tab Triggers > Footnotes"
    * "#1 of Footnotes Tab Refs" should be visible
    * "#2 of Footnotes Tab Refs" should be visible
    * "#3 of Footnotes Tab Refs" should be visible
    * "#4 of Footnotes Tab Refs" should be visible
    * "Document Frame > #1 of Footnote Descriptions" should be visible
    * "Document Frame > #2 of Footnote Descriptions" should be visible
    * "Document Frame > #3 of Footnote Descriptions" should be visible
    * "Document Frame > #4 of Footnote Descriptions" should be visible

  @CU-29828
  @local
  Scenario: Verify that call out overlay appears on hovering over Footnote reference in document body
    * I am logged in
    * I perform search of "a8b7be667c08100088e6d8d385ad169406"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Contents Tab > Selected Link" should be visible
    * "Tab Triggers > Footnotes" should be visible
    * "Document Frame > #1 of Footnote Body Anchors" should be visible
    * I move mouse over "Document Frame > #1 of Footnote Body Anchors"
    * "Document Frame > Footnote Tooltip" should be visible
    * I remember text of "Document Frame > Footnote Tooltip" as "tooltiptext"
    * I scroll to the bottom
    * "Document Frame > #1 of Footnote Descriptions" should be visible
    * I remember text of "Document Frame > #1 of Footnote Descriptions" as "description"
    * "{$description}" text should be equal to "{$tooltiptext}" text

  @CU-29829
  @local
  Scenario: Verify  corresponding document opens on clicking citation link in Footnotes Panel
    * I am logged in
    * I perform search of "53cc93627c541000ab39d8d385ad169408"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Tab Triggers > Footnotes" should be visible
    * I click "Tab Triggers > Footnotes"
    * "Footnotes Tab" should be visible
    * I click "#2 of Footnotes Tab Links"
    * I switch to last tab
    * "Document Frame > Document Content" should be visible

  @CU-34978
  Scenario: Verify that Footnotes are collapsed and expanded
    * I am logged in
    * I perform search of "09013e2c834fc093"
    * I click "#1 of Documents"
    * "Document Frame > Document Content" should be visible
    * "Document Frame > Footnotes Header" should be visible
    * "Document Frame >#1 of Footnote Descriptions" should be visible
    * I scroll to "Document Frame > Footnotes Header" element
    * I click "Document Frame > Footnotes Header"
    * "Document Frame >#1 of Footnote Descriptions" should not be visible
    * I click "Document Frame > Footnotes Header"
    * "Document Frame >#1 of Footnote Descriptions" should be visible
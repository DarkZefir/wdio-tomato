@smoke
@mvl
@ipa
@contents_panel
Feature: Contents Panel

  @CU-31652
  Scenario Outline: Verify that 'Contents' panel is displayed collapsed when user opens a document from dashboard
    * I am logged in
    # Open "ENERGY & ENVIRONMENT" by "#/home/Energy" url
    * I open base url with "#/home/Energy"
    * "Content Box" should be visible
    # Click on the <docTitle> in the remembered Content Type
    * I click "Content Box > #1 of Main Content Types > #<ContentGroup> in Content Types > #<docTitle> in Links"
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    # Verify First node in Contents Panel is selected and has background color of #d6d5d5
    * Background color of "Contents Tab > #<ParentNode> in Collapsed Parent Node > Path Header" should be "#d6d5d5"
    # Verify that all nodes in Contents Panel are collapsed
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "0"

    Examples:
      | docTitle                                       | ParentNode   | ContentGroup             |
      | Energy Policy Act of 2005: Law and Regulations | Explanations | TREATISES & EXPLANATIONS |

  @CU-31654
  Scenario Outline: Verify that for a publication without tree structure opened from dashboard, First document in the list is displayed selected in 'Contents' panel
    * I am logged in
    # Open "Tax - Federal" PA
    * I am on "<PA>" PA
    # Open "2020 Election" doc from dashboard (doc without tree structure)
    * I click "Content Box > #1 of Main Content Types > #<contentType> in Content Types > #<doc> in Links"
    # Observe TOC title of the active TOC tab
    * "Contents Tab > Selected Link" should be visible
    * I remember text of "Contents Tab > Selected Link" as "docTitle"
    # Active TOC tab should have #3385ac color
    * Background color of "Contents Tab > Selected Link" should be "#3385ac"
    # Active TOC tab title & Doc title in read view should be the same
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces
    # There shouldn't be TOC elements such as Expanded or Collapsed nodes
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible
    * "Contents Tab > #1 of Collapsed Parent Node" should not be visible

    Examples:
      | PA                             | contentType  | doc                           |
      | HEALTH REFORM KNOWLEDGE CENTER | NEWS & BLOGS | Affordable Care Act Briefings |

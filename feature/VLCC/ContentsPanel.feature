@smoke
@smoke_1
@vlcc
@ipa
@contents_panel
Feature: Contents Panel

  @CU-32392
  Scenario Outline: [VLCC] Verify that 'Contents' panel is displayed collapsed when user opens a document from dashboard
    * I am logged in
    * I open base url with "#/home/HR"
    * "Content Box" should be visible
    * I click "Content Box > #1 of Main Content Types > #<ContentGroup> in Content Types > #<docTitle> in Links"
    * "Contents Tab > #1 of Collapsed Parent Node > Header > Label" should be visible
    * Background color of "Contents Tab > #<ParentNode> in Collapsed Parent Node > Path Header" should be "#d6d5d5"
    * Count of "Contents Tab > Expanded Parent Node" should be equal to "0"

    Examples:
      | docTitle                                           | ParentNode  | ContentGroup             |
      | Americans With Disabilities Act Handbook - Perritt | FRONTMATTER | TREATISES & EXPLANATIONS |

  @CU-32395
  Scenario Outline: [VLCC] Verify that for a publication without tree structure opened from dashboard, First document in the list is displayed selected in 'Contents' panel
    * I am logged in
    * I am on "<PA>" PA
    * I click "Content Box > #1 of Main Content Types > #<contentType> in Content Types > #<doc> in Links"
    * "Contents Tab > Selected Link" should be visible
    * I remember text of "Contents Tab > Selected Link" as "docTitle"
    * Background color of "Contents Tab > Selected Link" should be "#3385ac"
    * Text of "Document Frame > Title" should contain "{$docTitle}" ignoring case ignoring whitespaces
    * "Contents Tab > #1 of Expanded Parent Node" should not be visible
    * "Contents Tab > #1 of Collapsed Parent Node" should not be visible

    Examples:
      | PA            | contentType              | doc                            |
      | CORPORATE LAW | NEWS & CURRENT AWARENESS | Corporation Service New Matter |

  @CU-32411
  Scenario: [VLCC] Verify that all the nodes user expands in 'Contents' panel remain expanded until collapsed by a user
    * I am logged in
    * I open "pir0109013e2c83dc77e1" document
    * Text of "Contents Tab > #1 of Expanded Parent Node > Path Header > Label" should contain "Subtitle D—Miscellaneous Excise Taxes [Secs. 4001-5000C]" ignoring case ignoring whitespaces
    * Text of "Contents Tab > #1 of Expanded First Child Node > Path Header > Label" should contain "CHAPTER 31—RETAIL EXCISE TAXES [Secs. 4001-4053]" ignoring case ignoring whitespaces
    * Text of "Contents Tab > #1 of Expanded Second Child Node > Path Header > Label" should contain "Subchapter A—Luxury Passenger Automobiles [Secs. 4001-4003] [Stricken]" ignoring case ignoring whitespaces
    * I click "Contents Tab > #Subtitle B—Estate and Gift Taxes [Secs. 2001-2801] in Collapsed Parent Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #CHAPTER 15—GIFTS AND BEQUESTS FROM EXPATRIATES in Collapsed First Child Node > Header > Label"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #1 of Expanded First Child Node > #1 of Links"
    * I move mouse over "Contents Tab > Root Title"
    * I click "Contents Tab > #Subtitle A—Income Taxes [Secs. 1-1563] in Collapsed Parent Node > Header > Label"
    * "Contents Tab > #Subtitle A—Income Taxes [Secs. 1-1563] in Expanded Parent Node" should be visible
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Subtitle D—Miscellaneous Excise Taxes [Secs. 4001-5000C] |
      | Subtitle B—Estate and Gift Taxes [Secs. 2001-2801]       |
      | Subtitle A—Income Taxes [Secs. 1-1563]                   |
    * I should see the following lines in "Contents Tab > Expanded First Child Node > Header > Label" ignoring order:
      | CHAPTER 31—RETAIL EXCISE TAXES [Secs. 4001-4053] |
      | CHAPTER 15—GIFTS AND BEQUESTS FROM EXPATRIATES   |
    * I should see the following lines in "Contents Tab > Expanded Second Child Node > Header > Label" ignoring order:
      | Subchapter A—Luxury Passenger Automobiles [Secs. 4001-4003] [Stricken] |
    * I click "Contents Tab > #Subtitle D—Miscellaneous Excise Taxes [Secs. 4001-5000C] in Expanded Parent Node > Header > Label"
    * I click "Contents Tab > #CHAPTER 15—GIFTS AND BEQUESTS FROM EXPATRIATES in Expanded First Child Node > Header > Label"
    * I should see the following lines in "Contents Tab > Expanded Parent Node > Header > Label" ignoring order:
      | Subtitle B—Estate and Gift Taxes [Secs. 2001-2801] |
      | Subtitle A—Income Taxes [Secs. 1-1563]             |
    * I click "Contents Tab > #Subtitle B—Estate and Gift Taxes [Secs. 2001-2801] in Expanded Parent Node > Header > Label"
    * I click "Contents Tab > #Subtitle A—Income Taxes [Secs. 1-1563] in Expanded Parent Node > Header > Label"
    * "Contents Tab > #1 of Expanded Parent Node" should not be present

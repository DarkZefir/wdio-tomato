@smoke
@mvl
@ipa
@tax_topics_list
Feature: Tax Topics List 1

  @CU-31327
  Scenario: Verify Expand/Collapse on Federal Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * I remember index of "Tax Federal Topics List > Top Level Node" exactly matching "S CORPORATIONS" as "index"
    * I click "Tax Federal Topics List > #{$index} of Top Level Node > Expand Button"
    * "Tax Federal Topics List > #{$index} of Top Level Node > #1 of Container Titles" should be visible
    * Text of "Tax Federal Topics List > #{$index} of Top Level Node > Top Level Node Link" should be "S CORPORATIONS" ignoring case
    * "Tax Federal Topics List > #{$index} of Top Level Node > #1 of Container Titles" should be visible
    * I remember number of "Tax Federal Topics List > #{$index} of Top Level Node > Container Titles" as "conTitleNum"
    * I remember number of "Tax Federal Topics List > #{$index} of Top Level Node > Topic Links" as "topLinksNum"
    * "{$conTitleNum}" number should be more than "0"
    * "{$topLinksNum}" number should be more than "0"
    * I click "Tax Federal Topics List > #{$index} of Top Level Node > Active Expand Button"
    * "Tax Federal Topics List > #{$index} of Top Level Node > #1 of Container Titles" should not be visible
    * "Tax Federal Topics List > #{$index} of Top Level Node > Container Titles" should not be visible
    * "Tax Federal Topics List > #{$index} of Top Level Node > Topic Links" should not be visible

    * I remember index of "Tax Federal Topics List > Top Level Node" exactly matching "BUSINESS DEDUCTIONS AND CREDITS" as "newIndex"
    * I scroll "Tax Federal Topics List > #{$newIndex} of Top Level Node > Title" to center of the window
    * I click "Tax Federal Topics List > #{$newIndex} of Top Level Node > Title"
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Container Titles" should be visible
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Container Titles" should be visible
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Topic Links" should be visible

    * I click "Tax Federal Topics List > #{$newIndex} of Top Level Node > Title"
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Container Titles" should not be visible
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Container Titles" should not be visible
    * "Tax Federal Topics List > #{$newIndex} of Top Level Node > #1 of Topic Links" should not be visible

  @CU-31359
  Scenario: Verify UI elements of International Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/intl/TaxInternational/PL"
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - INTERNATIONAL"
    * "Topics List Search Icon" should be visible
    * "Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."
    * "Tax International Topics List Country > Dropdown" should be visible
    * Text of "Tax International Topics List Country > Dropdown" should be "POLAND"
    * Count of "Tax International Topics List Country > Box Titles" should be more than "0"
    * Count of "Tax International Topics List Country > Topic Links" should be more than "0"

  @CU-31360
  Scenario: Verify opening of topics from International Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/intl/TaxInternational/PL"
    * "Tax International Topics List Country > Dropdown" should be visible
    * I remember text of "Tax International Topics List Country > Dropdown" as "country"
    * I remember text of "Tax International Topics List Country > #1 of Box Titles" as "categoryTitle"
    * I remember text of "Tax International Topics List Country > #1 of Topic Links" as "linkTitle"
    * I click "Tax International Topics List Country > #1 of Topic Links"
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$country}: {$categoryTitle}: {$linkTitle}" ignoring case

    * I click browser back button
    * Text of "Topics List Title" should be "TAX ESSENTIALS - INTERNATIONAL"
    * I click "Tax International Topics List Country > Dropdown"
    * Count of "Tax International Topics List Country > Dropdown Items" should be more than "2"
    * I click "Tax International Topics List Country > #Multi-Country in Dropdown Items"
    * "Tax International Topics List Country > #1 of Dropdown Items" should not be visible
    * "Tax International Topics List Country > Dropdown" should be visible
    * Text of "Tax International Topics List Country > Dropdown" should be "MULTI-COUNTRY"
    * I remember text of "Tax International Topics List Country > Dropdown" as "country"
    * I remember text of "Tax International Topics List Country > #1 of Box Titles" as "categoryTitle"
    * I remember text of "Tax International Topics List Country > #1 of Topic Links" as "linkTitle"
    * I click "Tax International Topics List Country > #1 of Topic Links"

    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "{$country}: {$categoryTitle}: {$linkTitle}" ignoring case

  @CU-31361
  Scenario: Verify UI elements of State Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/st/TaxStateAndLocal"
    * "Topics List Title" should be visible
    * "Tax State Topics List > #1 of Box Titles" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - STATE"
    * "Topics List Search Icon" should be visible
    * "Header" should be visible
    * "Search Bar" should be visible
    * Placeholder text for "Search Bar > Search Input" should be "Search Within ..."
    * Count of "Tax State Topics List > Box Titles" should be more than "30"
    * Count of "Tax State Topics List > Topic Links" should be more than "30"

  @CU-31364
  Scenario Outline: Verify opening of topics from State Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/st/TaxStateAndLocal"
    * "Tax State Topics List > #1 of <topicType>" should be visible
    * I remember number of "Tax State Topics List > <topicType>" as "topics"
    * I remember random integer below "{$topics}" and above "1" as "index"
    * I scroll "Tax State Topics List > #{$index} of <topicType>" to center of the window
    * I remember text of "Tax State Topics List > #{$index} of <topicType>" as "topicTitle"
    * I click "Tax State Topics List > #{$topicTitle} in <topicType>"
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should contain "{$topicTitle}" ignoring case ignoring punctuation marks
    Examples:
      | topicType   |
      # | Box Titles  |
      | Topic Links |

  @CU-32439
  Scenario: Verify that user can switch between "By Topic" and "IRC view"
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > IRC Tree Content" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By Topic"
    * I click "Tax Federal Topics List > Mode Switch"
    * "Tax Federal Topics List > Topics Tree Container" should be visible
    * Text of "Tax Federal Topics List > Mode Switch" should be "By IRC"

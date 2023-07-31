@critical_path
@mvl
Feature: Quick Reference by Country

  @CU-29823
  Scenario Outline: Verify that user is able to open Topic page from 'Quick Reference By Country' widget
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "Quick Reference By Country Box > Dropdown" should be visible
    * I click "Quick Reference By Country Box > Dropdown"
    * I click "Quick Reference By Country Box > Dropdown > #<LinkIndex> of Items"
    * I remember text of "Quick Reference By Country Box > Dropdown > Label" as "Country"
    * I click "Quick Reference By Country Box > #<FirstLevel> of Expandable Top Level Topics"
    * I click "Quick Reference By Country Box > #<SecondLevel> of Second Level Topics"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should contain "{$Country}"
    Examples:
      | LinkIndex | FirstLevel | SecondLevel |
      | 7         | 4          | 1           |
      | 9         | 1          | 2           |
      | 16        | 1          | 3           |
      | 1         | 2          | 1           |

  @CU-29830
  Scenario: Verify UI elements on 'Quick Reference by Country' widget on 'KITL' PA
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "Quick Reference By Country Box" should be visible
    * "Quick Reference By Country Box > Dropdown" should be visible
    * Text of "Quick Reference By Country Box" should contain "QUICK REFERENCE BY COUNTRY"
    * I click "Quick Reference By Country Box> Dropdown"
    * I click "Quick Reference By Country Box > Dropdown > #Argentina in Items"
    * Text of "Quick Reference By Country Box > Dropdown > Label" should contain "ARGENTINA"
    * Count of "Quick Reference By Country Box > Expandable Top Level Topics" should be equal to "19"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Base Erosion and Profit Shifting (BEPS)"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Business Formation"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Capital Gains"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Corporate Income Tax"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Currency"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Other Taxes"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Outbound Investment"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Status Changes and Liquidations"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Tax Incentives"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Transfer Pricing"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Value Added Tax (VAT)"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should contain "Withholding Tax"
    * Text in collection of "Quick Reference By Country Box > Expandable Top Level Topics" should not contain "Multi-Country"
    * I click "Quick Reference By Country Box > #1 of Expandable Top Level Topics"
    * Count of "Quick Reference By Country Box > Second Level Topics" should be equal to "3"
    * Text of "Quick Reference By Country Box > #1 of Second Level Topics" should contain "BEPS Quick Reference"
    * Text of "Quick Reference By Country Box > #2 of Second Level Topics" should contain "BEPS Anti-Avoidance and Revenue Protection Measures"
    * Text of "Quick Reference By Country Box > #3 of Second Level Topics" should contain "Response to the BEPS Action Plan"
    * I click "Quick Reference By Country Box > #1 of Expandable Top Level Topics"
    * "Quick Reference By Country Box > Second Level Topics" should not be visible

  @CU-29834
  Scenario: Verify that country selection on "Quick Reference by Country" widget is persistent both within and across sessions
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "Quick Reference By Country Box" should be visible
    * I click "Quick Reference By Country Box > Dropdown"
    * I click "Quick Reference By Country Box > Dropdown > #14 of Items"
    * I remember text of "Quick Reference By Country Box > Dropdown > Label" as "Country"
    * I click "Header > User Menu"
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > #KLUWER INTERNATIONAL TAX LAW in Practice Areas List Items"
    * "Quick Reference By Country Box > Dropdown > Label" should be visible
    * Text of "Quick Reference By Country Box > Dropdown > Label" should contain "{$Country}"
    * I click "Header > User Menu"
    * I click "Header > User Menu > #Logout in Items"
    * I am logged in without cleanup
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of Practice Areas List Items" should be visible
    * I click "Session Navigator > #KLUWER INTERNATIONAL TAX LAW in Practice Areas List Items"
    * "Quick Reference By Country Box > Dropdown > Label" should be visible
    * Text of "Quick Reference By Country Box > Dropdown > Label" should contain "{$Country}"

  @CU-29846
  @local
  Scenario: Verify that 'Quick Reference by Country list' can be opened from SRL
    * I am logged in
    * I perform search of "Quick Reference by Country"
    * Text of "#1 of Search Result Items" should contain "Quick Reference by Country"
    * I click "#1 of Search Result Items"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should contain "QUICK REFERENCE BY COUNTRY"
    * "Tax International Topics List Country > Dropdown" should be visible
    * Count of "Tax International Topics List Country > Topic Links" should be more than "2"

  @CU-31827
  Scenario: Verify that 'Quick Reference by Country list' can be opened from 'Titles' overlay
    * I am logged in
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * I type "Quick Reference by Country" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text of "Titles Popup > #1 of Publications Links" should contain "Quick Reference by Country" ignoring case
    * I click "Titles Popup > #1 of Publications Links"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should contain "QUICK REFERENCE BY COUNTRY"
    * "Tax International Topics List Country > Dropdown" should be visible
    * Count of "Tax International Topics List Country > Topic Links" should be more than "2"

  @CU-31828
  Scenario: Verify that correct Topic page opens from Quick Reference by Country list
    * I am logged in
    * I open base url with "#/topics/browse/kitl/kluwertaxlaw/AR"
    * "Tax International Topics List Country > Dropdown" should be visible
    * I click "Tax International Topics List Country > Dropdown"
    * I remember number of "Tax International Topics List Country > Dropdown Items" as "countries"
    * I remember random integer below "{$countries}" as "randomcountry"
    * I click "Tax International Topics List Country > #{$randomcountry} of Dropdown Items"
    * I wait 3 seconds
    * Text of "Tax International Topics List Country > Dropdown" should not be "ARGENTINA"
    * I remember text of "Tax International Topics List Country > Dropdown" as "country1"
    * I remember number of "Tax International Topics List Country > Topic Links" as "topics"
    * I remember random integer below "{$topics}" as "randomtopic"
    * I remember text of "Tax International Topics List Country > #{$randomtopic} of Topic Links" as "linkTitle"
    * I click "Tax International Topics List Country > #{$randomtopic} of Topic Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should contain "{$country1}"
    * Text of "Tax Topic Page > Topic Title" should contain "{$linkTitle}" ignoring case

  @CU-32622
  Scenario: Verify that hierarchy on QRBC widget is the same as on QRBC list page
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "Quick Reference By Country Box" should be visible
    * "Quick Reference By Country Box > Dropdown" should be visible
    * I click "Quick Reference By Country Box > Dropdown"
    * I remember number of "Quick Reference By Country Box > Dropdown > Items" as "countries"
    * I remember random integer below "{$countries}" as "randomcountry"
    * I remember text of "Quick Reference By Country Box > Dropdown > #{$randomcountry} of Items" as "country"
    * I click "Quick Reference By Country Box > Dropdown > #{$randomcountry} of Items"
    * "Quick Reference By Country Box > #1 of Expandable Top Level Topics" should be visible
    * I remember text of "Quick Reference By Country Box > Expandable Top Level Topics" as "titles"
    * I remember number of "Quick Reference By Country Box > Expandable Top Level Topics" as "top"
    * I remember random integer below "{$top}" as "randomtop"
    * I remember text of "Quick Reference By Country Box > #{$randomtop} of Expandable Top Level Topics" as "toptitle"
    * I click "Quick Reference By Country Box > #{$randomtop} of Expandable Top Level Topics"
    * "Quick Reference By Country Box > #1 of Second Level Topics" should be visible
    * I remember text of "Quick Reference By Country Box > Second Level Topics" as "second"
    * I open base url with "#/topics/browse/kitl/kluwertaxlaw/AR"
    * "Tax International Topics List Country > Dropdown" should be visible
    * I click "Tax International Topics List Country > Dropdown"
    * I remember index of "Tax International Topics List Country > Dropdown Items" matching "{$country}" as "index"
    * I click "Tax International Topics List Country > #{$index} of Dropdown Items"
    * I wait 3 seconds
    * Text of "Tax International Topics List Country > Dropdown" should be "{$country}" ignoring case
    * I remember index of "Tax International Topics List Country > Box Titles" matching "{$toptitle}" ignoring case as "boxindex"
    * I remember text of "Tax International Topics List Country > Box Titles" as "listtitles"
    * "{$titles}" text should be equal to "{$listtitles}" text ignoring case
    * I remember text of "Tax International Topics List Country > #{$boxindex} of Boxes > Box Links" as "links"
    * "{$links}" text should be equal to "{$second}" text ignoring case

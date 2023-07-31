@smoke
@mvl
@ipa
@tax_topics_list
Feature: Tax Topics List 2

  @CU-31334
  Scenario: Verify opening of topics from Federal Topic List page
    * I am logged in
    * I open base url with "#/topics/browse/fed/AllContent"
    * "Tax Federal Topics List > #1 of Top Level Node" should be visible
    * I remember index of "Tax Federal Topics List > Top Level Node" exactly matching "ACCOUNTING METHODS AND PERIODS" as "index"
    * I click "Tax Federal Topics List > #{$index} of Top Level Node > Expand Button"
    * "Tax Federal Topics List > #{$index} of Top Level Node > #1 of Container Titles" should be visible
    * "Tax Federal Topics List > #{$index} of Top Level Node > Top Level Node Link" should be visible
    * I click "Tax Federal Topics List > #{$index} of Top Level Node > Top Level Node Link"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "ACCOUNTING METHODS AND PERIODS" ignoring case

    * I click browser back button
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"

    * I click "Tax Federal Topics List > #{$index} of Top Level Node > #Accounting Methods and Changes in Accounting Methods in Container Titles"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "Accounting Methods and Changes in Accounting Methods" ignoring case

    * I click browser back button
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should be "TAX ESSENTIALS - FEDERAL"

    * I click "Tax Federal Topics List > #{$index} of Top Level Node > #Cash Method of Accounting in Topic Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should be "Cash Method of Accounting" ignoring case

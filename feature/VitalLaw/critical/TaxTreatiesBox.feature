@critical_path
@mvl
Feature: Tax Treaties Box

  @CU-29815
  Scenario: Verify that 3 links are displayed in "Model Tax Treaties" widget
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * "Treaties Box > Model Tax Treaties Box" should be visible
    * Count of "Treaties Box > Model Tax Treaties Box Links" should be equal to "3"

  @CU-29819
  Scenario: Verify default state of "Bilateral Tax Treaties" widget on 'KITL' PA
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * Text of "Treaties Box > Bilateral Treaties Box" should contain "BILATERAL TAX TREATIES"
    * "Treaties Box > Bilateral Treaties Box" should be visible
    * Count of "Treaties Box > Bilateral Treaties Box > Dropdowns" should be equal to "2"
    * Text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns" should contain "CHOOSE COUNTRY 1"
    * "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Button" should be enabled
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should contain "CHOOSE COUNTRY 2"
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Button" should not be enabled
    * "Treaties Box > Bilateral Treaties Box > Go Button" should be visible
    * "Treaties Box > Bilateral Treaties Box > Go Button" should not be enabled

  @CU-31791
  @logout
  Scenario: Verify display of Treaties box for users with limited subscription (NO 'Model Tax Treaties')
    * I am logged in as "LimitedKITL1@wk.com" with "password" password
    * I open base url with "#/home/kluwertaxlaw"
    * "Treaties Box > Bilateral Treaties Box" should be visible
    * Text of "Treaties Box > Bilateral Treaties Box > Header" should be "BILATERAL TAX TREATIES"
    * "Treaties Box > Model Tax Treaties Box" should not be visible

  @CU-31792
  @logout
  Scenario: Verify display of Treaties box for users with limited subscription (NO 'Bilateral Tax Treaties' and 'Model Tax Treaties')
    * I am logged in as "kitlonly@wk.com" with "password" password
    * I open base url with "#/home/kluwertaxlaw"
    * "Treaties Box" should not be visible

  @CU-31793
  @logout
  Scenario: Verify display of Treaties box for users with limited subscription (NO 'Bilateral Tax Treaties')
    * I am logged in as "LimitedKITL2@wk.com" with "password" password
    * I open base url with "#/home/kluwertaxlaw"
    * "Treaties Box" should not be visible
    * Text of "Treaties Box > Model Tax Treaties Box Header" should be "MODEL TAX TREATIES"
    * Count of "Treaties Box > Model Tax Treaties Box Links" should be equal to "1"

  @CU-31822
  Scenario: Verify that user is able to perform search using Bilateral Treaties widget
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Countries" as "countries"
    * I remember random integer below "{$countries}" and above "2" as "randomcountry"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries" as "country"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns" should be "{$country}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be enabled
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Countries" as "countries2"
    * I remember random integer below "{$countries2}" and above "2" as "randomcountry2"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries" as "country2"
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be "{$country2}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > Go Button" should be clickable
    * I click "Treaties Box > Bilateral Treaties Box > Go Button"
    * "Treaties Browse Overlay" should be visible

  @CU-32695
  Scenario: Verify UI elements on International Tax Treaties overlay
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Countries" as "countries"
    * I remember random integer below "{$countries}" and above "2" as "randomcountry"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries" as "country"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns" should be "{$country}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be enabled
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Countries" as "countries2"
    * I remember random integer below "{$countries2}" and above "2" as "randomcountry2"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries" as "country2"
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be "{$country2}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > Go Button" should be clickable
    * I click "Treaties Box > Bilateral Treaties Box > Go Button"
    * "Treaties Browse Overlay" should be visible
    * I wait until "Loading Indicator" is gone
    * Text of "Title" should contain "INTERNATIONAL TAX TREATIES"
    * Text of "Title" should contain "{$country}" ignoring case
    * Text of "Title" should contain "{$country2}" ignoring case
    * "X Icon" should be visible
    * "Active Tab" should be visible
    * Text of "Treaties Browse Overlay" should contain "CCH Amended Treaties"
    * Text of "Treaties Browse Overlay" should contain "World Tax Treaties"
    * Count of "Treaties Links" should be more than "0"
    * I click "X Icon"
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA

  @CU-31823
  Scenario: Verify that correct documents are opened from Bilateral Tax Treaties List
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Countries" as "countries"
    * I remember random integer below "{$countries}" and above "2" as "randomcountry"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries" as "country"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns" should be "{$country}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be enabled
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns"
    * I remember number of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Countries" as "countries2"
    * I remember random integer below "{$countries2}" and above "2" as "randomcountry2"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries" as "country2"
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be "{$country2}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > Go Button" should be clickable
    * I click "Treaties Box > Bilateral Treaties Box > Go Button"
    * "Treaties Browse Overlay" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember number of "Navigation Tabs" as "tabs"
    * I remember random integer below "{$tabs}" as "randomtab"
    * I remember text of "#{$randomtab} of Navigation Tabs" as "selectedtab"
    * I click "#{$randomtab} of Navigation Tabs"
    * I remember number of "Treaties Links" as "links"
    * I remember random integer below "{$links}" as "randomlink"
    * I remember text of "#{$randomlink} of Treaties Links" as "selectedlink"
    * I remember number of browser tabs
    * I click "#{$randomlink} of Treaties Links"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame" should contain "{$selectedlink}" ignoring whitespaces

  @CU-32749
  Scenario: Verify that value in second drop down in Bilateral Treaties widget set to default if user changes value in first drop down
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #1 of Countries" should be visible
    * I remember number of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Countries" as "countries"
    * I remember random integer below "{$countries}" and above "2" as "randomcountry"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries" as "country"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #{$randomcountry} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns" should be "{$country}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be enabled
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns"
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #1 of Countries" should be visible
    * I remember number of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Countries" as "countries2"
    * I remember random integer below "{$countries2}" and above "2" as "randomcountry2"
    * I remember text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries" as "country2"
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #{$randomcountry2} of Countries"
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should be "{$country2}" ignoring case
    * "Treaties Box > Bilateral Treaties Box > Go Button" should be clickable
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #2 of Countries"
    * "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > Button" should be enabled
    * Text of "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns" should contain "CHOOSE COUNTRY 2"
    * "Treaties Box > Bilateral Treaties Box > Go Button" should not be enabled

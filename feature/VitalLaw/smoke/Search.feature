@smoke
@mvl
@ipa
@search
Feature: Search

  @CU-29686
  @local
  Scenario: Verify that Post Search filters have 3 items for each facet
    * I am logged in
    * I am on "All Content" PA

    * I perform search of "energy design"
    * I remember index of "Filter Groups > Label" exactly matching "PRACTICE AREAS" as "pa"
    * I remember index of "Filter Groups > Label" exactly matching "DOCUMENT TYPE" as "doctype"
    * I remember index of "Filter Groups > Label" exactly matching "COURT" as "court"
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"

    * Count of "#{$pa} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$pa} of Filter Groups > More Label" should be visible

    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

    * Count of "#{$court} of Filter Groups > Filter Items" should not be less than "3"
    * "#{$court} of Filter Groups > More Label" should not be visible

    * Count of "#{$jurisdiction} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$jurisdiction} of Filter Groups > More Label" should not be visible

    * I click "#{$pa} of Filter Groups > More Label"
    * Count of "#{$pa} of Filter Groups > Filter Items" should be more than "3"
    * "#{$pa} of Filter Groups > Less Label" should be visible
    * I click "#{$doctype} of Filter Groups > More Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be more than "3"
    * "#{$doctype} of Filter Groups > Less Label" should be visible

    * I click "#{$pa} of Filter Groups > Less Label"
    * Count of "#{$pa} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$pa} of Filter Groups > More Label" should be visible
    * I click "#{$doctype} of Filter Groups > Less Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

  @CU-29689
  @local
  Scenario: Verify that Post Search filters have 3 items for each facet and Topics filters are displayed from Sec All PA
    * I am logged in
    * I am on "SECURITIES - ALL" PA

    * I perform search of "dividend policy"
    * "#1 of Filter Groups > #1 of Topic Labels" should be visible
    * Text in collection of "Filter Groups > Topic Labels" should contain "Governance & Compliance"
    * Text in collection of "Filter Groups > Topic Labels" should contain "Litigation & Enforcement Issues"
    * Text in collection of "Filter Groups > Topic Labels" should contain "Transactions & Activities"

    * I remember index of "Filter Groups > Label" exactly matching "DOCUMENT TYPE" as "doctype"
    * I remember index of "Filter Groups > Label" exactly matching "GOVERNING ACTS" as "govActs"
    * I remember index of "Filter Groups > Label" exactly matching "COURT" as "court"
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"
    * I remember index of "Filter Groups > Label" exactly matching "ISSUING BODY" as "issuingBody"
    * I remember index of "Filter Groups > Label" exactly matching "ENTITY & ROLE" as "entityRole"

    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

    * Count of "#{$govActs} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$govActs} of Filter Groups > More Label" should be visible

    * Count of "#{$court} of Filter Groups > Filter Items" should be less than "3"
    * "#{$court} of Filter Groups > More Label" should not be visible

    * Count of "#{$jurisdiction} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$jurisdiction} of Filter Groups > More Label" should not be visible

    * Count of "#{$issuingBody} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$issuingBody} of Filter Groups > More Label" should be visible

    * Count of "#{$entityRole} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$entityRole} of Filter Groups > More Label" should be visible

  @CU-29690
  Scenario: Verify that Topic filter works correctly in SEC-All PA - post-search multi selection
    * I am logged in
    * I am on "SECURITIES - ALL" PA

    * I perform search of "plan"

    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Filter Groups > #Governance & Compliance in Topic Labels"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups > #1 of Topic Filter Items" should be visible
    * Text in collection of "#1 of Filter Groups > Topic Filter Items" should contain "Market regulation"
    * I click "#1 of Filter Groups > #Market regulation in Topic Filter Items"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups > #1 of Topic Filter Items" should be visible
    * Text in collection of "#1 of Filter Groups > Topic Filter Items" should contain "Clearing and settlement"
    * I click "#1 of Filter Groups > #Clearing and settlement in Topic Filter Items"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups > #1 of Topic Labels" should be visible
    * Text in collection of "#1 of Filter Groups > Topic Labels" should contain "Transactions & Activities"
    * I click "#1 of Filter Groups > #Transactions & Activities in Topic Labels"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups > #1 of Topic Filter Items" should be visible
    * Text in collection of "#1 of Filter Groups > Topic Filter Items" should contain "Mergers, acquisitions and reorganizations"
    * I click "#1 of Filter Groups > #Mergers, acquisitions and reorganizations in Topic Filter Items"
    * "Results Toolbar > Hit Count" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame" should be visible

  @CU-36316
  Scenario Outline: Verify that user can delete/uncheck PA filter pills from Search Bar
    * I am logged in
    * I perform search of "law"
    * I wait until "Loading Indicator" is gone
    * "#1 of Filter Groups" should be visible
    * I click "#1 of Filter Groups > More Less Label"
    * I remember number of "#1 of Filter Groups > Filter Items" as "paFilter"
    * I remember random integer below "{$paFilter}" and above "3" as "firstPA"
    * I click "#1 of Filter Groups > #{$firstPA} of Filter Items Checkboxes"
    * I wait until "Loading Indicator" is gone
    # Subtract "2" from "{$firstPA}" and click on this number of Filter Items Checkboxes
    * I click "#1 of Filter Groups > #{$subtract($firstPA, 2)} of Filter Items Checkboxes"
    * I wait until "Loading Indicator" is gone
    * I remember text of "#1 of Filter Groups > #1 of Selected Items Label" as "pa1"
    * I remember text of "#1 of Filter Groups > #2 of Selected Items Label" as "pa2"
    * I remember text of "Results Toolbar > Hit Count" as "hitCount1"
    * I remember text of "Search Bar > #1 of PostSearch Filters > Filter Name" as "filter1"
    * "{$pa1}" text should contain "{$filter1}" text ignoring punctuation marks
    * I remember text of "Search Bar > #2 of PostSearch Filters > Filter Name" as "filter2"
    * "{$pa2}" text should contain "{$filter2}" text ignoring punctuation marks
    * I click "<path>"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Results Toolbar > Hit Count" as "hitCount2"
    * Text of "Search Bar > #1 of PostSearch Filters" should contain "{$pa2}" ignoring punctuation marks
    * "{$hitCount2}" number should be less than "{$hitCount1}"

    Examples:
      | path                                                 |
      | Search Bar > #1 of PostSearch Filters > Clear Filter |
      | #1 of Filter Groups > #1 of Selected Items Label     |

@smoke
@vlcc
@search
Feature: Search

  @CU-32428
  Scenario: [VLCC] Verify that Post Search filters have 3 items for each facet
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "energy design"
    * I remember index of "Filter Groups > Label" exactly matching "TOPICS" as "topics"
    * I remember index of "Filter Groups > Label" exactly matching "DOCUMENT TYPE" as "doctype"
    * I remember index of "Filter Groups > Label" exactly matching "COURT" as "court"
    * I remember index of "Filter Groups > Label" exactly matching "JURISDICTION" as "jurisdiction"
    * Count of "#{$topics} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$topics} of Filter Groups > More Label" should be visible
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible
    * Count of "#{$court} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$court} of Filter Groups > More Label" should not be visible
    * Count of "#{$jurisdiction} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$jurisdiction} of Filter Groups > More Label" should not be visible
    * I click "#{$topics} of Filter Groups > More Label"
    * Count of "#{$topics} of Filter Groups > Filter Items" should be more than "3"
    * "#{$topics} of Filter Groups > Less Label" should be visible
    * I click "#{$doctype} of Filter Groups > More Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be more than "3"
    * "#{$doctype} of Filter Groups > Less Label" should be visible
    * I click "#{$topics} of Filter Groups > Less Label"
    * Count of "#{$topics} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$topics} of Filter Groups > More Label" should be visible
    * I click "#{$doctype} of Filter Groups > Less Label"
    * Count of "#{$doctype} of Filter Groups > Filter Items" should be equal to "3"
    * "#{$doctype} of Filter Groups > More Label" should be visible

  @CU-33804
  Scenario Outline: [VLCC] Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part1)
    # test case needs to be updated by adding 'Consumer Law' PA in the list of PAs once https://jira.wolterskluwer.io/jira/browse/CNDUP-5818 is fixed
    * I am logged in
    * I am on "<PA>" PA
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                         |
      | BANKING & CONSUMER FINANCE |
      | BANKRUPTCY                 |
      | CONTRACTS & FORMS          |
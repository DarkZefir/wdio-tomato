@smoke
@mvl
@ipa
@search
Feature: Search 5

  @CU-33873
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part7)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                        |
      | #/home/Tax                |
      | #/home/TAG                |
      | #/home/Telecommunications |


  @CU-33788
  Scenario Outline: Verify that 'Treatise Title' post search filter is NOT displayed in 'Filter' panel on proper Practice Areas
  # 'BLOCKCHAIN & VIRTUAL CURRENCIES' PA should be added in the list of PAs once bugs https://jira.wolterskluwer.io/jira/browse/CU-33712 https://jira.wolterskluwer.io/jira/browse/GA-27746 are fixed
    * I am logged in
    * I am on "<PA>" PA
    * I perform search of "*"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Filter Groups > Label" as "labels"
    * "{$labels}" text should not contain "TREATISE TITLE" text

    Examples:
      | PA                           |
      | ALL CONTENT                  |
      | BLUE CHIP                    |
      | LIFE SCIENCES                |
      | SCION REFERENCE PUBLICATIONS |
      | SECURITIES - STATE           |
      | TRANSPORTATION               |
      | COVID-19 RESOURCES           |









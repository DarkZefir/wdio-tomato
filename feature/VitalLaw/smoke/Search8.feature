@smoke
@mvl
@ipa
@search
Feature: Search 8

  @CU-33787
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part1)
    * I am logged in
    * I am on "<PA>" PA
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                          |
      | Antitrust & Competition     |
      | Banking & Consumer Finance  |
      | Bankruptcy                  |
      | Cybersecurity & Privacy     |
      | Elder & Estates Law         |
      | Pension & Employee Benefits |

  @CU-33789
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part2)
    * I am logged in
    * I am on "<PA>" PA
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                             |
      | Energy & Environment           |
      | Family Law                     |
      | Government Contracts           |
      | Health Reform Knowledge Center |
      | Healthcare                     |
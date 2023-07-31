@smoke
@vlcc
@search
Feature: Search 6

  @CU-33805
  Scenario Outline: [VLCC] Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part2)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"
    Examples:
      | PA                         |
      | #/home/CorporateGovernance |
      | #/home/CorporateLaw        |
      | #/home/Distribution        |
      | #/home/GovernmentContracts |
      | #/home/HealthCare          |

  @CU-33866
  Scenario Outline: [VLCC] Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part3)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"
    Examples:
      | PA               |
      | #/home/HR        |
      | #/home/Insurance |
      | #/home/IP        |
      | #/home/MA        |
      | #/home/Payroll   |


@smoke
@mvl
@ipa
@search
Feature: Search 7

  @CU-33790
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part3)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                        |
      | #/home/HR                 |
      | #/home/IP                 |
      | #/home/TrademarkNavigator |
      | #/home/kluwertaxlaw       |
      | #/home/Labor              |

  @CU-33870
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part4)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                     |
      | #/home/Litigation      |
      | #/home/Payroll         |
      | #/home/PensionBenefits |
      | #/home/PracticeLaw     |

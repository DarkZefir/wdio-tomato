@smoke
@mvl
@ipa
@search
Feature: Search 6

  @CU-33871
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part5)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                         |
      | #/home/ProductsLiability   |
      | #/home/Property            |
      | #/home/SecuritiesCorporate |
      | #/home/SecuritiesFederal   |
      | #/home/Securities          |

  @CU-33872
  Scenario Outline: Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part6)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"

    Examples:
      | PA                              |
      | #/home/SexualHarassment         |
      | #/home/TaxEstatesGiftsAndTrusts |
      | #/home/TaxFederal               |
      | #/home/TaxInternational         |
      | #/home/TaxStateAndLocal         |


@smoke
@vlcc
@search
Feature: Search 5

  @CU-33867
  Scenario Outline: [VLCC] Verify that 'Treatise Title' post search filter is displayed in 'Filter' panel on proper Practice Areas (part4)
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember index of "Filter Groups > Label" exactly matching "TREATISE TITLE" as "treatiseTitle"
    * Count of "#{$treatiseTitle} of Filter Groups > Filter Items" should be more than "0"
    Examples:
      | PA                       |
      | #/home/Privacy           |
      | #/home/RealEstate        |
      | #/home/SecuritiesFederal |
      | #/home/Torts             |
      | #/home/Trade             |


  @CU-33806
  Scenario Outline: [VLCC] Verify that 'Treatise Title' post search filter is NOT displayed in 'Filter' panel on proper Practice Areas
    * I am logged in
    * I open base url with "<PA>"
    * I perform search of "*"
    * I remember text of "Filter Groups > Label" as "labels"
    * "{$labels}" text should not contain "TREATISE TITLE" text
    Examples:
      | PA                |
      | #/home/AllContent |
      | #/home/Tax        |
      | #/home/FoodDrug   |

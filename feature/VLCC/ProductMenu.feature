@smoke
@smoke_3
@ipa
@vlcc
@product_menu
Feature: Product Menu

  @CU-32338
  Scenario: Verify that Product Menu is opened on accessing Product button and proper items are displayed
    * I am logged in
    * I click "Header > My Solutions"
    * "Header > My Solutions > #1 of Items" should be visible
    * Count of "Header > My Solutions > Items" should be more than "3"
    * Text in collection of "Header > My Solutions > Items" should contain "CCH® IntelliConnect®"
    * Text in collection of "Header > My Solutions > Items" should contain "VitalLaw™"
    * Text in collection of "Header > My Solutions > Items" should contain "Paychex – Accountant Knowledge Center"
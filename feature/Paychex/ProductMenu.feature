@smoke
@px
@product_menu
Feature: Product Menu

  @CU-33158
  @logout
  Scenario: [PX] Verify that Product Menu is opened on accessing Product button and proper items are displayed
    * I am logged in as "pxonly@wk.com" with "password" password
    * "Header > My Solutions" should not be visible
@critical_path
@mvl
Feature: Product Menu

  @CU-28980
  @logout
  Scenario: Verify items in Product Menu is not displayed if user doesn't have supscriptions to them
    * I am logged in as "cht.rbs.filings@wk.com" with "password" password
    * "Header" should be present
    * I click "Header > My Solutions"
    * "Header > My Solutions > #1 of Items" should be visible
    * Text of "Header > My Solutions > #1 of Items" should be "RBsource|RBsourceFilings"
    * Count of "Header > My Solutions > Items" should be equal to "1"

  @CU-28981
  @logout
  Scenario:Verify that Product Menu is not displayed if user is subscribed to VitalLaw ONLY
    * I am logged in as "Cheetonly@wk.com" with "password" password
    * "Header" should be present
    * "Header > My Solutions" should not be visible
@critical_path
@mvl
Feature: Tax Topics List 1

  @CU-38865
  @local
  Scenario Outline: Verify that 'Bankruptcy/Tax Essentials' links can be opened from SRL
    * I am logged in
    * I perform search of "<Search term>"
    * Text of "#1 of Search Result Items" should contain "<Search term>"
    * I click "#1 of Search Result Items"
    * I wait until "Loading Indicator" is gone
    * "Topics List Title" should be visible
    * Text of "Topics List Title" should contain "<Title>"

    Examples:
      | Search term                    | Title                          |
      | Bankruptcy Essentials          | BANKRUPTCY ESSENTIALS          |
      | Tax Essentials - Federal       | TAX ESSENTIALS - FEDERAL       |
      | Tax Essentials - State         | TAX ESSENTIALS - STATE         |
      | Tax Essentials - International | TAX ESSENTIALS - INTERNATIONAL |
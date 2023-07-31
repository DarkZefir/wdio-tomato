@smoke
@mvl
@ipa
@citation_builder
Feature: Citation Builder 1

  @CU-32719
  Scenario Outline: Verify Citation Builder can be opened from Dashboard (part 1)
    * I am logged in
    # Open page with <url> from examples
    * I open base url with "<url>"
    * "Search Bar > Citation Search Builder Button" should be visible
    # Click on "Citation Search" button
    * I click "Search Bar > Citation Search Builder Button"
    # Verify that Header "Citation Template Search Box" has <PA> text from examples
    * Text of "Citation Template Search Box > Header" should be "<PA>" ignoring case
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates" should be visible
    # Verify that number of input fields in Templates of Citation Group  is more than <bottomLine>
    * Count of "Citation Template Search Box > Citation Groups > Templates > Inputs" should be more than "<bottomLine>"
    # Click on "Close" button in "Citation Template Search Box"
    * I click "Citation Template Search Box > X Close Button"
    # Veify that "Citation Template Search Box" is not visible anymore
    * "Citation Template Search Box" should not be present

    Examples:
      | PA                             | url                        | bottomLine |
      | Antitrust & Competition        | #/home/Antitrust           | 1          |
      | Banking & Consumer Finance     | #/home/Banking             | 1          |
      | Bankruptcy                     | #/home/Bankruptcy          | 1          |
      | Elder & Estates Law            | #/home/Elder               | 0          |
      | Pension & Employee Benefits    | #/home/PensionBenefits     | 1          |
      | Energy & Environment           | #/home/Energy              | 1          |
      | Government Contracts           | #/home/GovernmentContracts | 1          |
      | Labor & Employment Law         | #/home/Labor               | 1          |
      | Life Sciences                  | #/home/LifeSciences        | 1          |
      | Payroll & Entitlements         | #/home/Payroll             | 1          |
      | Products Liability & Insurance | #/home/ProductsLiability   | 1          |

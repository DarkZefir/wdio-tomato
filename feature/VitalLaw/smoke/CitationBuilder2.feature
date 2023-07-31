@smoke
@mvl
@ipa
@citation_builder
Feature: Citation Builder 1

  @CU-32726
  Scenario Outline: Verify Citation Builder can be opened from Dashboard (part 2)
    * I am logged in
    # Open page with <url> from examples
    * I open base url with "<url>"
    # Click on "Citation Search" button
    * I click "Search Bar > Citation Search Builder Button"
    * I wait until <waiter>
    # Verify that Header "Citation Template Search Box" has <PA> text from examples
    * Text of "Citation Template Search Box > Header" should be "<PA>" ignoring case
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates" should be visible
    # Verify that number of input fields in Templates of Citation Group  is more than 1
    * Count of "Citation Template Search Box > Citation Groups > Templates > Inputs" should be more than "1"
    # Click on "Close" button in "Citation Template Search Box"
    * I click "Citation Template Search Box > X Close Button"
    # Veify that "Citation Template Search Box" is not visible anymore
    * "Citation Template Search Box" should not be present

    Examples:
      | PA                                        | url                             | waiter                                                            |
      | Securities - All                          | #/home/Securities               | "Citation Template Search Box > Loading Indicator" is gone        |
      | Securities - Corporation Law & Governance | #/home/SecuritiesCorporate      | "Citation Template Search Box > Loading Indicator" is gone        |
      | Securities - Federal & International      | #/home/SecuritiesFederal        | "Citation Template Search Box > Loading Indicator" is gone        |
      | Securities - State                        | #/home/SecuritiesState          | "Citation Template Search Box > Loading Indicator" is gone        |
      | Tax - All                                 | #/home/Tax                      | "Citation Template Search Box > #1 of Citation Groups" is visible |
      | Tax - Estates, Gifts & Trusts             | #/home/TaxEstatesGiftsAndTrusts | "Citation Template Search Box > Loading Indicator" is gone        |
      | Tax - International                       | #/home/TaxInternational         | "Citation Template Search Box > Loading Indicator" is gone        |
      | Tax - Federal                             | #/home/TaxFederal               | "Citation Template Search Box > Loading Indicator" is gone        |
      | Tax - State & Local                       | #/home/TaxStateAndLocal         | "Citation Template Search Box > Loading Indicator" is gone        |
      | Healthcare                                | #/home/HealthCare               | "Citation Template Search Box > Loading Indicator" is gone        |
      | Intellectual Property                     | #/home/IP                       | "Citation Template Search Box > Loading Indicator" is gone        |
      | Transportation                            | #/home/Transportation           | "Citation Template Search Box > Loading Indicator" is gone        |

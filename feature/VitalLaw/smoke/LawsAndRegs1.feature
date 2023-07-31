@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegs

  @CU-40211
  @local
  Scenario Outline: Verify Laws&Regs SRL title format
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<doc>" on Laws & Regulations
    * "#1 of Documents" should be visible
    #Verify that SRL title format is: United States(for federal)/State name(for states), Statute/Regulation, short citation, document title
    * Text of "#1 of Documents > Document Title" should be "<federation>, <type>, <shortCitation>, <documentTitle>"

    Examples:
      | doc                                         | federation    | type       | shortCitation      | documentTitle                               |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | United States | Statute    | Tit. 1, § 1        | Words denoting number, gender, and so forth |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | United States | Regulation | Tit. 32, § 2.1     | Purpose                                     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | New York      | Statute    | Aband. Prop. § 403 | Payment of abandoned property               |
      | de-regs-e144e46e3ddba21933020f6be5e146ae-v1 | Delaware      | Regulation | Tit. 1, § 101-1.0  | Purpose and Authority                       |

  @CU-42752
  Scenario Outline: Filter dropdowns return into default state after selecting value, * deselecting
    * I am logged in
    # Open L&R dashboard
    * I open base url with "#/home/PrimarySource"
    * I wait until "#1 of Code Boxes" is visible
    # Verify that Jurisdiction dropdown is in default state
    * Text of "Search Bar > <filter> Dropdown > Placeholder" should be "<filter>"
    # Click filter dropdown
    * I click "Search Bar > <filter> Dropdown"
    * "Search Bar > <filter> Dropdown > #1 of Items" should be visible
    # Select random item from the dropdown
    * I remember number of "Search Bar > <filter> Dropdown > Items" as "number"
    * I remember random integer below "{$number}" as "index"
    * I click "Search Bar > <filter> Dropdown > #{$index} of Items"
    * I click "Search Bar > <filter> Dropdown"
    # Check that dropdown placeholder text was changed
    * Text of "Search Bar > <filter> Dropdown > Placeholder" should not be "<filter>"
    # Deselect item from the dropdown
    * I click "Search Bar > <filter> Dropdown"
    * I click "Search Bar > <filter> Dropdown > #{$index} of Items"
    * I click "Search Bar > <filter> Dropdown"
    # Check that dropdown placeholder text was changed to the default value
    * Text of "Search Bar > <filter> Dropdown > Placeholder" should be "<filter>"

    Examples:
      | filter        |
      | Jurisdiction  |
      | Document Type |

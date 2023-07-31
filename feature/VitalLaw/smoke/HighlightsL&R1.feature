@smoke
@mvl
@Highlighted
Feature: Highlighted

  @CU-40075
  Scenario Outline: Search term is highlighted in SRL for L&R
    * I am logged in
    # Perform search from Laws&regs dashboard
    * I perform search of "<SearchTerm1>" on Laws & Regulations
    * "#1 of Documents" should be visible
    # Search for the search term
    * I perform search of "<SearchTerm2>"
    * I wait until "Loading Indicator" is gone
    # Search term should be highlighted in SRL
    * Text in collection of "Highlighted Phrases" should contain "<SearchTerm2>" ignoring case

    Examples:
      | SearchTerm1                                 | SearchTerm2 |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | whenever    |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | purpose     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | forth       |
      | mi-regs-85ed04d1d9aa88231890b5316982d7fe-v1 | dogs        |

  @CU-40078
  Scenario Outline: Search term is highlighted in SRL for L&R Code boxes from dashboard with quick search button
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    # Click quick search button from USC/CFR Code Box
    * I remember random integer below "7" as "RandomLink"
    * I move mouse over "#<Box> of Code Boxes > #{$RandomLink} of Item Links"
    * I click "#<Box> of Code Boxes > #{$RandomLink} of Item Quick Select Icons"
    * "Advanced Search Popup" should be visible
    # Search for the search term
    * I type "tax" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Button" should be clickable
    * I click "Advanced Search Popup > Search Button"
    * Text of "Highlighted Phrase" should be "tax" ignoring case

    Examples:
      | Box |
      | 1   |
      | 2   |

  @CU-40079
  Scenario Outline: Search term is highlighted in SRL for L&R State boxes from dashboard with quick search button
    * I am logged in
    # Go to L&R dashboard
    * I click "Header > Laws And Regulations Button"
    # Click quick search button from SS/SR State Box
    * I scroll to the bottom
    * I click "State Box > #<Tab> of Tab Buttons"
    * I remember number of "State Box > Items" as "LinksNumber"
    * I remember random integer below "{$LinksNumber}" as "RandomLink"
    * I move mouse over "State Box > #{$RandomLink} of Items"
    * I click "State Box > #{$RandomLink} of Item Quick Select Icons"
    * "Advanced Search Popup" should be visible
    # Search for the search term
    * I type "tax" in "Advanced Search Popup > Search Input"
    * "Advanced Search Popup > Search Button" should be clickable
    * I click "Advanced Search Popup > Search Button"
    * Text of "Highlighted Phrase" should be "tax" ignoring case

    Examples:
      | Tab |
      | 1   |
      | 2   |

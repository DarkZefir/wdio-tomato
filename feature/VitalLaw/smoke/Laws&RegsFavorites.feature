@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegsFavorites

  @CU-42186
  Scenario Outline: Verify that user can add document to Favorites from Read view for Laws&Regulations (using star icon)
    * I am logged in
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I click "Header > Saved Items Dropdown"
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should contain "<federation>, <type>, <shortCitation>, <documentTitle>"
    * I click "Favorites Popup > X Close Button"
    * "Favorites Popup" should not be visible

    Examples:
      | doc                                         | federation    | type       | shortCitation      | documentTitle                               |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | United States | Statute    | Tit. 1, § 1        | Words denoting number, gender, and so forth |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | United States | Regulation | Tit. 32, § 2.1     | Purpose                                     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | New York      | Statute    | Aband. Prop. § 403 | Payment of abandoned property               |
      | wy-regs-ce7427d473840fadcd650add71d6b17b-v1 | Wyoming       | Regulation | 061-0001-1         | § 1-1, Authority                            |

  @CU-42187
  Scenario Outline: Verify that user can add document to Favorites from Read view for Laws&Regulations (using Add to button)
    * I am logged in
    * I open "<doc>" document
    * "Contents Tab > Selected Link" should be visible
    * "Document Frame > Document Content" should be visible
    * I click "Toolbar Buttons > Add To Button"
    * Text of "Add To Popup > #1 of Dropdowns" should be "- SELECT -"
    * I click "Add To Popup > #1 of Dropdowns"
    * I click "Add To Popup > #1 of Dropdowns >#Favorites in Items"
    * Text of "Add To Popup > #1 of Dropdowns" should be "FAVORITES"
    * I click "Add To Popup > Save And Close"
    * "Add To Popup" should not be visible
    * "Favorite Button Checked" should be visible
    * I click "Header > Saved Items Dropdown"
    * I click "Header > Saved Items Dropdown >#Favorites in Items"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > #1 of Item Names" should contain "<federation>, <type>, <shortCitation>, <documentTitle>"
    * I click "Favorites Popup > X Close Button"
    * "Favorites Popup" should not be visible

    Examples:
      | doc                                         | federation    | type       | shortCitation      | documentTitle                               |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  | United States | Statute    | Tit. 1, § 1        | Words denoting number, gender, and so forth |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 | United States | Regulation | Tit. 32, § 2.1     | Purpose                                     |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  | New York      | Statute    | Aband. Prop. § 403 | Payment of abandoned property               |
      | wy-regs-ce7427d473840fadcd650add71d6b17b-v1 | Wyoming       | Regulation | 061-0001-1         | § 1-1, Authority                            |

  @CU-42188
  Scenario Outline: Verify that user can remove document from Favorites on Laws&Regulations
    * I am logged in
    * I add "<doc>" document to favorites
    * I click browser refresh button
    * I wait until "Loading Indicator" is gone
    * I open "<doc>" document
    * I click "Favorite Button Checked"
    * "Favorite Button" should be visible
    * I click "Header > Home"
    * "Favorites Box" should be visible
    * "Favorites Box > No Results" should be visible

    Examples:
      | doc                                         |
      | us-law-17ad8ac7cd02c72594be33c891495eb5-v1  |
      | us-regs-e7921d9606ac35482090cbcab3b5f246-v1 |
      | ny-law-8b16662de2f00b9c1084de0a7fc272e0-v1  |
      | wy-regs-ce7427d473840fadcd650add71d6b17b-v1 |

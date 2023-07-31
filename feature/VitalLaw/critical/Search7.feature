@critical_path
@mvl
Feature: Search 7

  @CU-32734
  @local
  Scenario Outline: Quick Answers on Different PAs
    * I am logged in
    * I open base url with "<url>"
    * "Search Bar > Search Input" should be visible
    * I perform search of "<term>"
    * "Quick Answer" should be visible
    * Count of "Quick Answer Titles" should be more than "0"
    * Count of "Documents" should be more than "0"

    Examples:
      | url                    | term                                     |
      | #/home/Antitrust       | antitrust injury                         |
      | #/home/AllContent      | merger                                   |
      | #/home/PensionBenefits | Nonqualified Deferred Compensation Plans |
      | #/home/Securities      | beneficial owner                         |

  @CU-32737
  @local
  Scenario Outline: Search results contain Practice Tools
    * I am logged in
    * "Search Bar > Search Input" should be visible
    * I perform search of "<term>"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Result Items" should be more than "0"
    * Count of "UCM Documents" should be equal to "0"
    * Each element of "Search Result Items" should contain "<term>" ignoring case
    * Each element of "Highlighted Phrases" should contain "<term>" ignoring case
    * I remember index of "Non UCM Documents" matching "<term>" as "index"
    * Text of "#{$index} of Document Type" should be "PRACTICE TOOLS"

    Examples:
      | term                                              |
      | Determining Tax Status of an Entity Decision Tree |

  @CU-32739
  @local
  Scenario Outline: Verify that search terms is highlighted correctly when search with proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * "Search Bar > Search Input" should be visible
    * I perform search of "<term1> <connector> <term2>"
    * I wait until "Loading Indicator" is gone
    * Count of "Documents" should be more than "0"
    * I click "#{$randomInt(1, 2)} of Documents > Document Title"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Document Frame > Highlights" as "highlights"
    * "{$highlights}" text should contain "<term1NoQuotes>" text ignoring whitespaces ignoring case
    * "{$highlights}" text should contain "<term2NoQuotes>" text ignoring whitespaces ignoring case
    * "{$highlights}" text should not contain "w/par" text ignoring whitespaces ignoring case

    Examples:
      | term1                       | term1NoQuotes             | connector | term2             | term2NoQuotes   |
      | "wear and tear"             | wear and tear             | w/par     | landlord          | landlord        |
      | "credit enhancement"        | credit enhancement        | f/4       | "REMIC provision" | REMIC provision |
      | "lack of operating history" | lack of operating history | w/sen     | "risk factor"     | risk factor     |

  @CU-37247
  @local
  Scenario: Verify that user selection of "Open in New Tab" checkbox is sticky after logout
    * I am logged in
    * I perform search of "audit partnership"
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should not be selected
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * "Results Toolbar > Open In New Tab Checkbox" should be selected
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu > #Logout in Items"
    * I am logged in without cleanup
    * I perform search of "tax"
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be selected

  @CU-37261
  @local
  Scenario: Verify that state of 'Open in a new tab' checkbox corresponds the current selection of its state when user opens search from Saved Searches
    * I am logged in
    * I perform search of "audit partnership"
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should not be selected
    * "Results Toolbar > Save Search Button" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Saved Searches Popup" should be visible
    * I type "CU-37261" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * "Results Toolbar > Open In New Tab Checkbox" should be selected
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Header > Saved Items Dropdown"
    * "Header > Saved Items Dropdown > #1 of Items" should be visible
    * I click "Header > Saved Items Dropdown > #Saved Searches in Items"
    * "Saved Searches Popup" should be visible
    * "Saved Searches Popup > #1 of Items" should be visible
    * Text of "Saved Searches Popup > #1 of Items > Name" should contain "CU-37261"
    * I click "Saved Searches Popup > #1 of Items > Name"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be selected

  @CU-37262
  @local
  Scenario: Verify that state of 'Open in a new tab' checkbox corresponds the current selection of its state when user opens search from History
    * I am logged in
    * I perform search of "audit partnership"
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should not be selected
    * "Results Toolbar > Save Search Button" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Saved Searches Popup" should be visible
    * I type "CU-37262" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * "Results Toolbar > Open In New Tab Checkbox" should be selected
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * I click "Header > History Dropdown"
    * "Header > History Dropdown > #1 of Items Title" should be visible
    * I click "Header > History Dropdown > #1 of Items Title"
    * "Header > History Dropdown > #1 of Items Title" should not be visible
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be selected

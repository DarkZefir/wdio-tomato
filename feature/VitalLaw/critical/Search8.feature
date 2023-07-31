@critical_path
@mvl
Feature: Search 8

  @CU-37395
  @local
  Scenario Outline: Verify that ‘Quick Answers’ box is displayed when user executes search within document opened from SRL
    * I am logged in
    * I am on "<PA>" PA
    * "Search Bar > Search Input" should be visible
    * I perform search of "<term>"
    * "#1 of Documents" should be visible
    * I click "#1 of Documents"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I click "Search Bar > Search Delete"
    * Value in "Search Bar > Search Input" should be ""
    * I type "<term1>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * "Quick Answer" should be visible

    Examples:
      | PA                          | term                                                                      | term1              |
      | ANTITRUST & COMPETITION     | definition of Accountable Care organizations Policy Statement             | Active supervision |
      | ALL CONTENT                 | stock                                                                     | exception          |
      | PENSION & EMPLOYEE BENEFITS | Nonqualified Deferred Compensation Plans                                  | stock              |
      | SECURITIES - ALL            | Regulation (EU) No 909/2014 of the European Parliament and of the Council | beneficial owner   |

  @CU-37263
  @local
  Scenario: Verify that state of 'Open in a new tab' checkbox corresponds the current selection of its state when user opens search from Session Navigator
    * I am logged in
    * I perform search of "audit partnership"
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should not be selected
    * "Results Toolbar > Save Search Button" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Saved Searches Popup" should be visible
    * I type "CU-37263" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible
    * I click "Results Toolbar > Open In New Tab Checkbox"
    * "Results Toolbar > Open In New Tab Checkbox" should be selected
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * I remember index of "Session Navigator > Practice Areas List Items" matching "ALL CONTENT" as "PA"
    * I click "Session Navigator > #{$PA} of Practice Areas List Items > Expand"
    * "Session Navigator > #{$PA} of Practice Areas List Items > Events Panel" should be visible
    * "Session Navigator > #{$PA} of Practice Areas List Items > Events Panel > #1 of Event > Title" should be visible
    * I click "Session Navigator > #{$PA} of Practice Areas List Items > Events Panel > #1 of Event > Title"
    * I wait until "Loading Indicator" is gone
    * "#1 of Documents" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be visible
    * "Results Toolbar > Open In New Tab Checkbox" should be selected

  @CU-37653
  Scenario Outline: Verify that when user removes post search filters, results number increases
    * I am logged in
    * I perform search of "<term>"
    * I click "#1 of Filter Groups > #<Filter1> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I click "#3 of Filter Groups > #<Filter2> in Filter Items"
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsWithFilters"
    * Count of "Search Bar > Post Search Filters" should be equal to "2"
    * I click "Search Bar > #1 of Post Search Filters > Clear Filter"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsWith1Filter"
    * "{$hitsWithFilters}" number should be less than "{$hitsWith1Filter}"
    * I click "#1 of Filter Groups > #<Filter1> in Filter Items"
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    * I remember text of "Results Toolbar > Hit Count" as "hitsWithoutFilter"
    * "{$hitsWith1Filter}" number should be less than "{$hitsWithoutFilter}"
    Examples:
      | term | Filter1                    | Filter2 |
      | case | Banking & Consumer Finance | State   |

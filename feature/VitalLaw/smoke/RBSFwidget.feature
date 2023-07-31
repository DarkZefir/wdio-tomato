@smoke
@mvl
@ipa
@rbsf_widget
Feature: RBSF Widget

  @CU-31834
  Scenario Outline: Verify UI elements of RBSF widget on <PA>
    * I am logged in
    * I am on "<PA>" PA

    * "RBsourceFilings" should be visible
    * "RBsourceFilings > Header" should be visible
    * Text of "RBsourceFilings > Header" should be "SEARCH RBSOURCEFILINGS"
    * "RBsourceFilings > #1 of Labels" should be visible
    * Text of "RBsourceFilings > #1 of Labels" should be "Scope"
    * "RBsourceFilings > #2 of Labels" should be visible
    * Text of "RBsourceFilings > #2 of Labels" should be "Company"
    * "RBsourceFilings > #3 of Labels" should be visible
    * Text of "RBsourceFilings > #3 of Labels" should be "Form Type"
    * "RBsourceFilings > #4 of Labels" should be visible
    * Text of "RBsourceFilings > #4 of Labels" should be "Search Term"
    * "RBsourceFilings > #5 of Labels" should be visible
    * Text of "RBsourceFilings > #5 of Labels" should be "Date"
    * "RBsourceFilings > Content > Scope Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Scope Dropdown > Button" should be "EDGAR"
    * "RBsourceFilings > Content > Company Input" should be visible
    * Placeholder text for "RBsourceFilings > Content > Company Input" should be "Company Name, Ticker or CIK"
    * "RBsourceFilings > Content > Edgar Form Type Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Edgar Form Type Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Content > Search Term Input" should be visible
    * Value in "RBsourceFilings > Content > Search Term Input" should be ""
    * "RBsourceFilings > Content > Edgar Form Type Dropdown" should be visible
    * Text of "RBsourceFilings > Content > Edgar Form Type Dropdown > Button" should be "- SELECT -"
    * "RBsourceFilings > Go Button" should be visible
    * "RBsourceFilings > Go Button" should not be enabled

    * I click "RBsourceFilings > Content > Scope Dropdown > Button"
    * "RBsourceFilings > Content > Scope Dropdown > #1 of Items" should be visible
    * Count of "RBsourceFilings > Content > Scope Dropdown > Items" should be more than "2"
    * I click "RBsourceFilings > Content > Scope Dropdown > Button"
    * "RBsourceFilings > Content > Scope Dropdown > #1 of Items" should not be visible

    * I click "RBsourceFilings > Content > Edgar Form Type Dropdown > Button"
    * "RBsourceFilings > Content > Edgar Form Type Dropdown > #1 of Items" should be visible
    * Count of "RBsourceFilings > Content > Edgar Form Type Dropdown > Items" should be more than "2"
    * Text in collection of "RBsourceFilings > Content > Edgar Form Type Dropdown > Items" should contain "- SELECT -"
    * I click "RBsourceFilings > Content > Edgar Form Type Dropdown > Button"
    * "RBsourceFilings > Content > Edgar Form Type Dropdown > #1 of Items" should not be visible

    * I click "RBsourceFilings > Content > Edgar Form Type Dropdown > Button"
    * "RBsourceFilings > Content > Edgar Form Type Dropdown > #1 of Items" should be visible
    * Count of "RBsourceFilings > Content > Edgar Form Type Dropdown > Items" should be more than "2"
    * I click "RBsourceFilings > Content > Edgar Form Type Dropdown > Button"
    * "RBsourceFilings > Content > Edgar Form Type Dropdown > #1 of Items" should not be visible

    Examples:
      | PA                                   |
      | Securities - Federal & International |
      | Securities - All                     |

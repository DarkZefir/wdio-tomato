@mvl
@critical_path
Feature: Drag & Drop

  @CU-33666
  Scenario Outline: Verify that user can reorder links in content group (drop down)
    * I am logged in
    * I am on "<Practice Area>" PA
    * I click "Content Box > #<Type> in Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #LLCs and Pass-throughs in Items"
    * I remember text of "Select Dashboard Content Popup > Items" as "order1"
    * I click "Select Dashboard Content Popup > Reorder Button"
    * I drag "Select Dashboard Content Popup > #1 of Items" to "Select Dashboard Content Popup > #2 of Items"
    * I click "Select Dashboard Content Popup > Reorder Button"
    * I remember text of "Select Dashboard Content Popup > Items" as "order2"
    * "$order1" collection should not be equal to "$order2" collection
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types" should be visible
    * I remember text of "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > Links" as "order"
    * "$order" collection should be equal to "$order2" collection ignoring whitespaces

    * I click "Header > Home"
    * "Practice Areas Box" should be visible
    * I am on "<Practice Area>" PA
    * "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I remember text of "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > Links" as "order"
    * "$order" collection should be equal to "$order2" collection ignoring whitespaces

    Examples:
      | Practice Area       | Type    | Box Title              |
      | TAX - STATE & LOCAL | CONTENT | LLCS AND PASS-THROUGHS |

  @CU-33667
  Scenario Outline: Verify that user can reorder links in content group (two drop downs)
    * I am logged in
    * I am on "<Practice Area>" PA
    * I click "Content Box > #<Type> in Main Content Types > Header Config"
    * "Select Dashboard Content Popup > Header > Group Dropdown" should be visible
    * I click "Select Dashboard Content Popup > Header > Group Dropdown"
    * I click "Select Dashboard Content Popup > Header > Group Dropdown > #United Kingdom in Items"
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns"
    * I click "Select Dashboard Content Popup > Content > #1 of Dropdowns > #UK Regulators & Bodies in Items"
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns"
    * I click "Select Dashboard Content Popup > Content > #2 of Dropdowns > #FCA (Financial Conduct Authority) in Items"
    * "Select Dashboard Content Popup > Content > #1 of Item Titles" should be visible
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "order1"
    * I click "Select Dashboard Content Popup > Reorder Button"
    * I drag "Select Dashboard Content Popup > Content > #1 of Item Titles" to "Select Dashboard Content Popup > Content > #3 of Item Titles"
    * I click "Select Dashboard Content Popup > Reorder Button"
    * I remember text of "Select Dashboard Content Popup > Content > Item Titles" as "order2"
    * "$order1" collection should not be equal to "$order2" collection
    * I click "Select Dashboard Content Popup > Save And Close"
    * "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > Loading Indicator" should not be visible
    * "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I remember text of "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > Links" as "order"
    * "$order" collection should be equal to "$order2" collection ignoring whitespaces

    * I click "Header > Home"
    * "Practice Areas Box" should be visible
    * I am on "<Practice Area>" PA
    * "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > #1 of Links" should be visible
    * I remember text of "Content Box > #<Type> in Main Content Types > #<Box Title> in Content Types > Links" as "order"
    * "$order" collection should be equal to "$order2" collection ignoring whitespaces

    Examples:
      | Practice Area                        | Type          | Box Title      |
      | SECURITIES - FEDERAL & INTERNATIONAL | INTERNATIONAL | UNITED KINGDOM |

@smoke
@mvl
@ipa
@session_navigator
Feature: Session Navigator

  @CU-28995
  Scenario Outline: Verify that proper Dashboard is opened by clicking item in Session Navigator
    * I am logged in
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #<PA> in <List> Items"
    * "<Box>" should be visible
    * Text of "Session Navigator > Session Navigator Tab" should be "<PA1>"

    Examples:
      | PA                  | List                | Box                                    | PA1                 | Home               |
      | ALL CONTENT         | Practice Areas List | Practice Areas Box                     | ALL CONTENT         | Home               |
      | TAX - INTERNATIONAL | Practice Areas List | Content Box > #1 of Main Content Types | TAX - INTERNATIONAL | Home               |
      | LAWS & REGULATIONS  | Resourses List      | #1 of Code Boxes                       | All Content         | Laws & Regulations |
      | PRACTICAL CONTENT   | Resourses List      | Practical Content Filter               | All Content         | Practical Content  |

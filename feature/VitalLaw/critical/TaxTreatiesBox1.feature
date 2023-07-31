@critical_path
@mvl
Feature: Tax Treaties Box 1

  @CU-29816
  Scenario Outline: Verify that correct documents open from "Model Tax Treaties" widget
    * I am logged in
    * I am on "KLUWER INTERNATIONAL TAX LAW" PA
    * Text of "Treaties Box > #<LinkIndex> of Model Tax Treaties Box Links" should contain "<LinkTitle>"
    * I click "Treaties Box > #<LinkIndex> of Model Tax Treaties Box Links"
    * I wait until "Loading Indicator" is gone
    * Text of "DA Title" should contain "<DATitle>"
    * I click "Show Metadata"
    * I should see "da-id" metadata parameter with "<MetaData>" value
    Examples:
      | LinkIndex | LinkTitle                            | DATitle                                                | MetaData       |
      | 1         | OECD Model Treaties and Commentaries | OECD Model Treaties and Commentaries                   | WKUS_TAL_18646 |
      | 2         | UN Model Treaties and Commentaries   | United Nations Models, Other Treaties and Commentaries | WKUS_TAL_13021 |
      | 3         | US Model Treaties and Commentaries   | US Model Treaties and Commentaries                     | WKUS_TAL_18647 |

@critical_path
@mvl
Feature: Dashboard

  @CU-30956
  Scenario: Verify that 'Content' box is displayed on 'TAG' PA
    * I am logged in
    * I am on "CYBERSECURITY & PRIVACY" PA
    * "Content Box > #1 of Main Content Types" should be visible
    *  Text of "Content Box > #1 of Main Content Types > Header Title" should contain "CONTENT"
    * "Content Box > #1 of Main Content Types > Header Config" should be visible

  @CU-29550
  Scenario Outline: Verify that "<SeeMore>" link is present in "<Type>" section of <PA> PA dashboard
    * I am logged in
    * I am on "<PA>" PA
    * "Content Box > #1 of Main Content Types" should be visible
    * "Content Box > #<Type> in Main Content Types > See More" should be visible
    * Text of "Content Box > #<Type> in Main Content Types > See More" should be "<SeeMore>"
    * "Content Box > #<Type> in Main Content Types > See More" should be clickable
    Examples:
      | PA               | Type                    | SeeMore                                     |
      | SECURITIES - ALL | EXCHANGES & SROS        | See More Exchanges & SROS Content >>        |
      | SECURITIES - ALL | FEDERAL                 | See More Federal Content >>                 |
      | TAX - ALL        | STATE & LOCAL           | See More State & Local Content >>           |
      | TAX - ALL        | ESTATES, GIFTS & TRUSTS | See More Estates, Gifts & Trusts Content >> |
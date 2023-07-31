@mvl
@critical_path
Feature: HistAndFav@wk.com user configuration

  @CU-38404
  @histFavConfig
  @logout
  Scenario Outline: Configure histAndFav user for Favorites tests
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    * I am on "ALL CONTENT" PA
    * I perform search of "<doc>"
    * I click "<resP>"
    * I wait until "Loading Indicator" is gone
    * "<favClick>" should be visible
    * I click "<favClick>"
    * "<favRes>" should be visible
    * I click "<favResClick>"
    * "<favResWait>" should not be visible
    Examples:
      | doc                                        | resP                   | page        | favClick                          | favRes                                    | favResClick                                          | favResWait                   |
      | Smart Chart: Physical Presence Requirement | Smart Charts Title Box | SmartCharts | Utility Bar > Favorites Button    | Smart Charts Favorites Popup              | Smart Charts Favorites Popup > Save And Close Button | Smart Charts Favorites Popup |
      | 98ca8f447dd71000985c000d3a8daaf402         | #1 of Documents        | Read        | Favorite Button                   | Favorite Button Checked                   | Header > Home                                        | Loading Indicator            |
      | 2a37c8f87cba1000b85e90b11c18c90209         | #1 of Documents        | Topics      | Tax Topic Page >  Favorite Button | Tax Topic Page >  Favorite Button Checked | Header > Home                                        | Loading Indicator            |

  @CU-38405
  @histFavConfig
  @logout
  Scenario: Configure general saved search for histAndFav user
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    * I perform search of "*"
    * "Results Toolbar > Hit Count" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup > Input" should be clickable
    * I type "CU-32325" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible

  @CU-41194
  @histFavConfig
  @logout
  Scenario Outline: Configure Laws&Regs saved search for histAndFav user
    * I am logged in as "histAndFav@wk.com" with "password" password without cleanup
    * I perform search of "<searchTerm>" on Laws & Regulations
    * "Results Toolbar > HitCount" should be visible
    * I click "Results Toolbar > Save Search Button"
    * "Save This Search Popup" should be visible
    * I type "<ssName>" in "Save This Search Popup > Input"
    * "Save This Search Popup > Save And Close" should be clickable
    * I click "Save This Search Popup > Save And Close"
    * "Save This Search Popup" should not be visible

    Examples:
      | searchTerm | ssName        |
      | milk       | goat for L&R  |
      | job        | car for L&R   |
      | person     | human for L&R |

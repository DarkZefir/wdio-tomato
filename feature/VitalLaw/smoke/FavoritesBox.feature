@smoke
@mvl
@favorites_box
Feature: favorites box

  @CU-35938
  @local
  Scenario Outline: Verify that added to Favorite Smart Chart/Document/Topic is displayed on the top of Favorites box on All Content page
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I perform search of "<doc>"
    * I click "<resP>"
    * I wait until "Loading Indicator" is gone

    * "<favTitle>" should be visible
    * "<favClick>" should be visible
    * I remember text of "<favTitle>" as "name"
    * I click "<favClick>"
    * "<favRes>" should be visible
    * I click "<favResClick>"
    * "<favResWait>" should not be visible
    * I click "Header > Home"
    * I wait until "Loading Indicator" is gone

    * "Favorites Box" should be visible
    * "Favorites Box > #1 of Links" should be visible
    * Text of "Favorites Box > #1 of Links" should contain "<contain>" ignoring case
    Examples:
      | doc                                     | resP                   | favClick                          | favTitle                                                | favRes                                    | favResClick                                          | favResWait                   | contain              |
      | Employee and Officer Compensation       | Smart Charts Title Box | Utility Bar > Favorites Button    | #1 of Results Nodes > #1 of Section Titles > Leaf Title | Smart Charts Favorites Popup              | Smart Charts Favorites Popup > Save And Close Button | Smart Charts Favorites Popup | Smart Chart: {$name} |
      | hrc02327dd9767d8710008844005056881d2302 | #1 of Documents        | Favorite Button                   | DA Title                                                | Favorite Button Checked                   | Header > Home                                        | Loading Indicator            | {$name}              |
      | 829326aa7c921000ba1290b11c2ac4f104      | #1 of Documents        | Tax Topic Page >  Favorite Button | Tax Topic Page > Topic Title                            | Tax Topic Page >  Favorite Button Checked | Header > Home                                        | Loading Indicator            | {$name}              |


  @CU-35937
  Scenario: Verify Favorites box on All Content page
    * I am logged in
    * I add "hrc02327dd9767d8710008844005056881d2302" document to favorites
    * I am on "All Content" PA
    * "Favorites Box" should be visible
    * Text of "Favorites Box > Title" should be "Favorites" ignoring case
    * Count of "Favorites Box > Links" should be more than "0"
    * I remember number of "Favorites Box > Links" as "num"
    * Count of "Favorites Box > Star Icons" should be equal to "{$num}"
    * "Favorites Box > See All" should be visible


  @CU-35957
  @logout
  Scenario Outline: Verify that document/Smart Chart/Topic can be opened from Favorites Box
    * I am logged in as "histandfav@wk.com" with "password" password without cleanup
    * "Favorites Box > #<num> of Links" should be visible
    * I remember "title" attribute of "Favorites Box > #<num> of Links" as "boxTitle"
    * I click "Favorites Box > #<num> of Links"
    * I wait until "Loading Indicator" is gone
    * "<favCheck>" should be visible
    * I remember text of "<pageTitle>" as "pageTitle"
    * "{$boxTitle}" text should contain "{$pageTitle}" text ignoring case
    Examples:
      | num | favCheck                                  | pageTitle                                               |
      | 1   | Tax Topic Page >  Favorite Button Checked | Tax Topic Page > Topic Title                            |
      | 2   | Favorite Button Checked                   | DA Title                                                |
      | 3   | Utility Bar > Checked Favorites Button    | #1 of Results Nodes > #1 of Section Titles > Leaf Title |


  @CU-35961
  Scenario: Verify Favorites overlay is opened on See All button from All Content Favorites box
    * I am logged in
    * I add "hrc02327dd9767d8710008844005056881d2302" document to favorites
    * "Favorites Box > See All" should be visible
    * I am on "All Content" PA
    * I click "Favorites Box > See All"
    * "Favorites Popup" should be visible
    * Text of "Favorites Popup > Title" should be "Favorites" ignoring case
    * Count of "Favorites Popup > Item Names" should be more than "0"

@critical_path
@mvl
@backbutton
Feature: Back Button

  @CU-36855
  Scenario Outline: Verify that user is able to return back to the Practice Area dashboard by click on browser 'Back' button after opening a document from dashboard
    * I am logged in
    # Open the URL from examples
    * I open base url with "<url>"
    * "Content Box > #1 of Main Content Types > #1 of Content Types > #1 of Links" should be visible
    * I remember number of "Content Box > #1 of Main Content Types > #1 of Content Types > Links" as "linksNum"
    # Click on any link in the first content box
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > #{$randomInt(1, $linksNum)} of Links"
    * "Document Frame > Document Content" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that the text of the Session Navigator is 'Human Resources'
    * "Session Navigator" should be visible
    * Text of "Session Navigator" should be "<PA>"
    Examples:
      | url       | PA              |
      | #/home/HR | HUMAN RESOURCES |

  @CU-36856
  Scenario: Verify that user is able to return back to dashboard by click on browser 'Back' button after opening a TLP doc from SRL
    * I am logged in
    * I am on "ALL CONTENT" PA
    # Perform search for 'law' with the following filters below
    * I perform search of "law" with the following presearch filters:
      | SELECT FILTERS > Document Type > Topic Pages |
    * "#1 of Documents" should be visible
    # Open the first document in SRL
    * I click "#1 of Documents"
    * "Tax Topic Page > Table Of Contents" should be visible
    * "Tax Topic Page > #1 of Table Of Contents Items" should be clickable
    # Click on browser back button
    * I click browser back button
    * "#1 of Documents" should be visible
    * "#1 of Search Result Items" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that user is on Home page and 'All Content' is displayed in SN
    * "Session Navigator" should be visible
    * Text of "Session Navigator" should be "ALL CONTENT"

  @CU-36858
  Scenario Outline: Verify that user is able to return back to dashboard after opening an On Platform Smart Chart from TLP doc
    * I am logged in
    # Open the URL from examples
    * I open base url with "<url>"
    * I am on "<PA>" PA
    * "Essentials Box" should be visible
    * I remember index of "Essentials Box > Tax Links" exactly matching "<link>" as "linkNum"
    # Click on 'BROWSE STATE CONTENT CURATED BY TOPIC' link
    * I click "Essentials Box > #{$linkNum} of Tax Links"
    * I wait until "Loading Indicator" is gone
    # Verify that Tax State Topics List is displayed
    * "Tax State Topics List" should be visible
    * I remember index of "Tax State Topics List > Box Titles" exactly matching "Drop Shipments" as "number"
    # Click on 'Drop Shipments' link in the left box
    * I click "Tax State Topics List > #{$number} of Box Titles"
    * "Tax Topic Page > Smart Charts Widget" should be visible
    # Click on 'Sales and Use Tax Drop Shipments' Smart Chart
    * I click "Tax Topic Page > Smart Charts Widget > #Sales and Use Tax Drop Shipments in Box Links"
    # Click on browser back button
    * I click browser back button
    # Verify that Tax State Topics List is displayed
    * "Tax State Topics List" should be visible
    Examples:
      | url                     | PA                  | link                                  |
      | #/home/TaxStateAndLocal | TAX - STATE & LOCAL | BROWSE STATE CONTENT CURATED BY TOPIC |
      | #/home/Tax              | TAX - ALL           | BROWSE STATE CONTENT CURATED BY TOPIC |

  @CU-36857
  Scenario Outline: Verify that user is able to return back to State Topics List by click on browser 'Back' button after opening a TLP doc from Tax Topics List
    * I am logged in
    # Open the URL from examples
    * I open base url with "<url>"
    * I am on "<PA>" PA
    * "Essentials Box" should be visible
    * I remember index of "Essentials Box > Tax Links" exactly matching "<link>" as "linkNum"
    # Click on 'BROWSE STATE CONTENT CURATED BY TOPIC' link
    * I click "Essentials Box > #{$linkNum} of Tax Links"
    # Verify that user is on Topics page
    * "Tax State Topics List" should be visible
    # Open any topic
    * I click "Tax State Topics List > #2 of Topic Links"
    * "Tax Topic Page > Table Of Contents" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that Tax State Topics List is displayed
    * "Tax State Topics List" should be visible
    Examples:
      | url                     | PA                  | link                                  |
      | #/home/TaxStateAndLocal | TAX - STATE & LOCAL | BROWSE STATE CONTENT CURATED BY TOPIC |

  @CU-36862
  Scenario Outline: Verify that user is able to return back to Federal Topics List by click on browser 'Back' button after opening a TLP doc from the list
    * I am logged in
    # Open the URL from examples
    * I open base url with "<url>"
    * I am on "<PA>" PA
    * "Essentials Box" should be visible
    * I remember index of "Essentials Box > Tax Links" exactly matching "<link>" as "linkNum"
    # Click on 'BROWSE FEDERAL CONTENT CURATED BY TOPIC' link
    * I click "Essentials Box > #{$linkNum} of Tax Links"
    # Verify that Tax Federal Topics List is displayed
    * "Tax Federal Topics List" should be visible
    # Expand the first title in Tax Federal Topics List
    * I click "Tax Federal Topics List > #1 of Top Level Node > Title"
    * "Tax Federal Topics List > #1 of Active Top Level Node > #1 of Node Containers" should be visible
    # Click on the first link in the expanded title
    * I click "Tax Federal Topics List > #1 of Active Top Level Node > #1 of Node Containers"
    * "Tax Topic Page > Table Of Contents" should be visible
    # Verify that Tax Federal Topics List is displayed
    * "Tax Federal Topics List" should be visible
    Examples:
      | url               | PA            | link                                    |
      | #/home/TaxFederal | TAX - FEDERAL | BROWSE FEDERAL CONTENT CURATED BY TOPIC |

  @CU-36892
  Scenario Outline: Verify that user is able to return back to International Topics List by click on browser 'Back' button after opening a TLP doc from the list
    * I am logged in
    # Open the URL from examples
    * I open base url with "<url>"
    * I am on "<PA>" PA
    * "Essentials Box" should be visible
    * I remember index of "Essentials Box > Tax Links" exactly matching "<link>" as "linkNum"
    # Click on 'BROWSE INTERNATIONAL CONTENT CURATED BY TOPIC' link
    * I click "Essentials Box > #{$linkNum} of Tax Links"
    # Verify that Tax International Topics List Country is displayed
    * "Tax International Topics List Country" should be visible
    * "Tax International Topics List Country > #1 of Topic Links" should be visible
    # Click on the first link in Tax International Topics List
    * I click "Tax International Topics List Country > #1 of Topic Links"
    * "Tax Topic Page > Table Of Contents" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that Tax International Topics List is displayed
    * "Tax International Topics List Country" should be visible
    Examples:
      | url                     | PA                  | link                                          |
      | #/home/TaxInternational | TAX - INTERNATIONAL | BROWSE INTERNATIONAL CONTENT CURATED BY TOPIC |

  @CU-36859
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button after search within 'Citation Lookup' widget
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    # Expand the Session Navigator
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of <List>" should be visible
    # Click on the PA from examples
    * I click "Session Navigator > #<PA> in <List>"
    * "Citation Lookup Box" should be visible
    # Perform search for term from examples in Citation Lookup box
    * I type "<Term>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    # Verify that Citation Matches are displayed
    * "Citation Matches Header" should be visible
    * I wait until "Loading Indicator" is gone
    # Click on browser back button
    * I click browser back button
    # Verify that 'All Content' is displayed in SN
    * "Session Navigator" should be visible
    * Text of "Session Navigator" should be "ALL CONTENT"
    Examples:
      | PA            | List                      | Term    |
      | TAX - FEDERAL | Practice Areas List Items | 1.355-1 |


  @CU-36860
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button from Citation Results List
    * I am logged in
    # Open the PA from examples
    * I click "Practice Areas Box > #<PA> in Practice Area Links"
    * I wait 3 seconds
    * "Search Bar > Citation Search Builder Button" should be visible
    # Click on 'Citation Search' button near the search field
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    # Perform search for term from examples in the first Citation Search template
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    # Click on 'Go' button
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that 'All Content' is displayed in SN
    * "Practice Areas Box" should be visible
    * "Session Navigator" should be visible
    * Text of "Session Navigator" should be "ALL CONTENT"
    Examples:
      | PA                                   | citationSearch |
      | Securities - Federal & International | 27             |

  @CU-36861
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button after search from ‘Sample Forms’ widget
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    * "Sample Forms Box" should be visible
    * Text of "Session Navigator > Session Navigator Tab" should be "<PA>"
    # Perform search for term from examples in 'Sample Forms' box
    * I type "<term>" in "Sample Forms Box > Search Term Input"
    * "Sample Forms Box > Search Button" should be clickable
    * I click "Sample Forms Box > Search Button"
    * "Results Toolbar > Hit Count" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that 'All Content' is displayed in SN
    * Text of "Session Navigator > Session Navigator Tab" should be "ALL CONTENT"
    Examples:
      | PA         | term |
      | BANKRUPTCY | tax  |

  @CU-36927
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button from document reached after Citation Search
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    * "Search Bar > Citation Search Builder Button" should be visible
    # Click on 'Citation Search' button near the search field
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * I scroll "Citation Template Search Box > #1 of Citation Groups" to center of the window
    # Perform search for term from examples in the first Citation Search template
    * I type "<citationSearch>" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"
    * I wait until "Loading Indicator" is gone
    # Click on browser back button
    * I click browser back button
    # Verify that 'SECURITIES - FEDERAL & INTERNATIONAL' is displayed in SN
    * "Session Navigator" should be visible
    * Text of "Session Navigator" should be "<PA>"
    Examples:
      | PA                                   | citationSearch |
      | SECURITIES - FEDERAL & INTERNATIONAL | 27(a)(3)       |

@critical_path
@mvl
@practical_content
Feature: Practical Content

  @CU-35100
  @logout
  Scenario Outline: Verify that user is redirected to 'Practical Content' Dashboard after click on corresponding link on 'No Results' page reached after search within all practical content
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "Search Bar > Search Input" should be visible
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I type "<term>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "<term>"
    * "No Results Box" should be visible
    * "No Results Search Icon" should be visible
    * "Back To Practical Content Dashboard Link" should be visible
    * I click "Back To Practical Content Dashboard Link"
    * I wait until "Loading Indicator" is gone
    * "Search Bar > #1 of Search Pills" should not be visible
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "{$boxes}"
    Examples:
      | term   |
      | 8kjdls |

  @CU-35102
  @logout
  Scenario Outline: Verify that user is able to execute search within a definite group of Practical Content within a content box
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * I remember text of "#{$randombox} of Content Boxes > Title" as "title"
    * I type "<term>" in "#{$randombox} of Content Boxes > Search Input Field"
    * I click "#{$randombox} of Content Boxes > Search Button"
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "1"
    * "#1 of Results Clusters > Header" should be visible
    * Text of "#1 of Results Clusters > Header Title" should be "{$title}"
    * "#1 of Results Clusters > Results Panel" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should contain "results for"
    * Text of "#1 of Results Clusters > Results Panel" should contain "<term>"
    Examples:
      | term |
      | *    |

  @CU-35168
  @logout
  Scenario Outline: Verify that Practical Content Dashboard is available for a user with limited subscription
    * I am logged in as "taglimi@wk.com" with "password" password
    * "Practice Areas Box > #1 of Practice Area Links" should be visible
    * I remember number of "Practice Areas Box > Practice Area Links" as "PAs"
    * "Header > Practical Content Button" should be visible
    * "Header > Practical Content Button" should be enabled
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes" should be visible
    * Count of "Content Boxes" should be equal to "<boxesCount>"
    * Text of "#1 of Content Boxes > Title" should be "<box>"
    * "#1 of Content Boxes > #1 of Items" should be visible
    * Count of "#1 of Content Boxes > Items" should be more than "0"
    * "Practice Areas Filter" should be visible
    * "Practical Content Filter" should be visible
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should be visible
    * Count of "Practice Areas Filter > Options" should be equal to "{$add($PAs, 1)}"
    * I click "Practice Areas Filter > Label"
    * "Practice Areas Filter > #1 of Options" should not be visible
    * I click "Practical Content Filter > Label"
    * "Practical Content Filter > #1 of Options" should be visible
    * Count of "Practical Content Filter > Options" should be equal to "<contentTypes>"
    * Count of "Practical Content Filter > Selected Options" should be equal to "{$subtract(<contentTypes>, 1)}"
    * Count of "Practical Content Filter > Selected Disabled Options" should be equal to "{$subtract(<contentTypes>, <boxesCount>, 1)}"
    * "Practical Content Filter > Select All Selected" should be visible
    * I click "Practical Content Filter > Select All Selected CheckBox"
    * "Practical Content Filter > Select All Selected" should not be visible
    * "Practical Content Filter > Select All" should be visible
    * I click "Practical Content Filter > Select All CheckBox"
    * "Practical Content Filter > Select All Selected" should be visible
    * "Practical Content Filter > #1 of Selected Options" should be visible
    * Count of "Practical Content Filter > Selected Options" should be equal to "<boxesCount>"
    * Text of "Practical Content Filter > #1 of Selected Options" should contain "<box>" ignoring case
    * Text of "Practical Content Filter > Select All" should be "All Practical Content" ignoring case
    Examples:
      | boxesCount | contentTypes | box          |
      | 1          | 9            | ANSWER BOOKS |

  @CU-35169
  @logout
  Scenario Outline: Verify that user is able to execute search within found results for practical content
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "<term1>" on practical content
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "<term1>"
    * Placeholder text for "Search Bar > Search Input" should contain "Search here within"
    * Placeholder text for "Search Bar > Search Input" should contain "results for"
    * Placeholder text for "Search Bar > Search Input" should contain "<term1>"
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clusterNumber"
    * I type "<term2>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember number of "Results Clusters" as "clusterNumber1"
    * "{$clusterNumber1}" number should be less than "{$clusterNumber}"
    * Placeholder text for "Search Bar > Search Input" should contain "<term2>"
    * I type "<term3>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * "#1 of Results Clusters" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember number of "Results Clusters" as "clusterNumber2"
    * "{$clusterNumber2}" number should be less than "{$clusterNumber1}"
    * Placeholder text for "Search Bar > Search Input" should contain "<term3>"
    Examples:
      | term1    | term2   | term3 |
      | Transfer | Pricing | Guide |

  @CU-35170
  @logout
  Scenario Outline: Verify that user can edit applied search query on Practical Content Results page
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "<term1>" on practical content
    * "Search Bar > #1 of Search Pills" should be visible
    * I type "<term2>" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * I wait until "Loading Indicator" is gone
    * Count of "Search Bar > Search Pills" should be equal to "2"
    * I remember number of "Results Clusters" as "clusterNumber"
    * I click "Search Bar > #2 of Search Pills > Remove"
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * "Search Bar > #2 of Search Pills" should not be visible
    * "Search Bar > #1 of Search Pills" should be visible
    * Count of "Search Bar > Search Pills" should be equal to "1"
    * Count of "Results Clusters" should be more than "{$clusterNumber}"
    * I remember number of "Results Clusters" as "clusterNumber1"
    * I click "Search Bar > #1 of Search Pills > Edit"
    * "Search Bar > #1 of Search Pills > Input" should be visible
    * I send sequence of keys "Control, A" to element "Search Bar > #1 of Search Pills > Input"
    * I send sequence of keys "Backspace" to active element
    * I type "<term3>" in "Search Bar > #1 of Search Pills > Input"
    * I click "Search Bar > #1 of Search Pills > Update"
    * I wait until "Loading Indicator" is gone
    * Text of "Search Bar > #1 of Search Pills" should be "<term3>"
    * "#1 of Results Clusters" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember number of "Results Clusters" as "clusterNumber2"
    * "{$clusterNumber2}" number should be less than "{$clusterNumber1}"
    Examples:
      | term1    | term2   | term3 |
      | Transfer | Pricing | Guide |

  @CU-35337
  @logout
  Scenario Outline: Verify that results are loaded by 100 on "Practical Content Results" page
    * I am logged in as "TMNWithoutTTAB@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes" should be visible
    * I click "#<number> of Content Boxes > See All Button"
    * "Results List" should be visible
    * "#1 of Results Clusters" should be visible
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters > #1 of Items" should be visible
    * Count of "#1 of Results Clusters > Items" should be equal to "100"
    * I scroll "Results List" element down "6000" pixels
    * I wait until "Loading Indicator" is gone
    * Count of "#1 of Results Clusters > Items" should be equal to "200"
    Examples:
      | number |
      | 3      |

  @CU-35345
  @logout
  Scenario Outline: Verify that user is able to switch between books and documents within Guide Books/Answer Books practical content type being on Results list of single practical content type
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * "#1 of Content Boxes" should be visible
    * I remember index of "Content Boxes > Title" matching "<text>" ignoring case as "number"
    * I click "#{$number} of Content Boxes > See All Button"
    * "Results List" should be visible
    * "#1 of Results Clusters" should be visible
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters > #1 of Items" should be visible
    * Count of "#1 of Results Clusters > Items" should not be equal to "100"
    * Text of "#1 of Results Clusters > Results Panel" should not contain "<text>"
    * "#1 of Results Clusters > Toggle Switch" should be visible
    * "#1 of Results Clusters > Active Label" should be visible
    * Count of "#1 of Results Clusters > Labels" should be equal to "2"
    * Text of "#1 of Results Clusters > #1 of Labels" should be "Books"
    * Text of "#1 of Results Clusters > #2 of Labels" should be "Documents"
    * I click "#1 of Results Clusters > #2 of Labels"
    * I wait 2 seconds
    * "#1 of Results Clusters > #1 of Items" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should contain "<text>"
    * Count of "#1 of Results Clusters > Items" should be equal to "100"
    * I scroll to "Results List" element
    * I scroll "Results List" element down "6000" pixels
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * Count of "#1 of Results Clusters > Items" should be equal to "200"
    * I click "#1 of Results Clusters > #1 of Labels"
    * I wait 2 seconds
    * "#1 of Results Clusters > Results Panel" should be visible
    * Text of "#1 of Results Clusters > Results Panel" should not contain "<text>"
    * Count of "#1 of Results Clusters > Items" should not be equal to "100"
    Examples:
      | text         |
      | Guide Books  |
      | Answer Books |

  @CU-35365
  @logout
  Scenario Outline: Verify that user is able to switch between books and documents within Guide Books/Answer Books practical content type being on Results list with all practical content types
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I click "Header > Practical Content Button"
    * I wait until "Loading Indicator" is gone
    * I perform search of "*" on practical content
    * "Results List" should be visible
    * "#1 of Results Clusters" should be visible
    * I wait until "Loading Indicator" is gone
    * I remember index of "Results Clusters > Header Title" matching "<type>" ignoring case as "number"
    * Text of "#{$number} of Results Clusters > Header Title" should contain "<type>" ignoring case
    * "#{$number} of Results Clusters > Toggle Switch" should be visible
    * "#{$number} of Results Clusters > #1 of Labels" should be visible
    * "#{$number} of Results Clusters > #2 of Labels" should be visible
    * Text of "#{$number} of Results Clusters > #1 of Labels" should be "Books"
    * Text of "#{$number} of Results Clusters > #2 of Labels" should be "Documents"
    * I remember text of "#{$number} of Results Clusters > #1 of Items" as "booksItem1"
    * I remember text of "#{$number} of Results Clusters > #2 of Items" as "booksItem2"
    * I remember text of "#{$number} of Results Clusters > #3 of Items" as "booksItem3"
    * I click "#{$number} of Results Clusters > #2 of Labels"
    * I wait 2 seconds
    * Text of "#{$number} of Results Clusters > #1 of Items" should not be "{$booksItem1}"
    * Text of "#{$number} of Results Clusters > #2 of Items" should not be "{$booksItem2}"
    * Text of "#{$number} of Results Clusters > #3 of Items" should not be "{$booksItem3}"
    * I click "#{$number} of Results Clusters > #1 of Labels"
    * I wait 2 seconds
    * Text of "#{$number} of Results Clusters > #1 of Items" should be "{$booksItem1}"
    * Text of "#{$number} of Results Clusters > #2 of Items" should be "{$booksItem2}"
    * Text of "#{$number} of Results Clusters > #3 of Items" should be "{$booksItem3}"
    Examples:
      | type         |
      | Guide Books  |
      | Answer Books |

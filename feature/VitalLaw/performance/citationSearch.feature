@performance
Feature: Citation Search

  Scenario Outline: Citation Search Builder Load opening of citation search builder #<n>
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #SECURITIES - ALL in Practice Areas List Items"
    * I click "Search Bar > Citation Search Builder Button"

    * I start "Citation Search Builder Load" measurement
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates" should be visible
    * I stop "Citation Search Builder Load" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Citation Search Builder Search perform a search from citation search builder #<n>
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    * I click "Session Navigator > Session Navigator Tab"
    * I click "Session Navigator > #TAX - ALL in Practice Areas List Items"
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be clickable
    * I type "160" in "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs"
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button" should be clickable
    * I wait 2 seconds
    * I click "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > Go Button"

    * I start "Citation Search Builder Search" measurement
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Document Content" should be visible
    * I stop "Citation Search Builder Search" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Global Citation Search Perform citation search #<n>
    * I am logged in
    * I open base url with "#/home/PensionBenefits"
    * I click "Search Bar > Search Input"
    * I type "26 C.F.R. 1.1361-3(a)" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"

    * I start "Global Citation Search" measurement
    * "Results Toolbar > Hit Count" should be visible
    * "#1 of Search Result Items" should be visible
    * "Results Toolbar > Current Search Query" should be visible
    * I stop "Global Citation Search" measurement
    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Tax - State Citation Search Builder Load #<n>
    * I am logged in
    * I open base url with "#/home/TaxStateAndLocal"
    * I click "Search Bar > Citation Search Builder Button"

    * I start "Tax - State Citation Search Builder Load" measurement
    * "Search Bar > Citation Search Builder Button" should be visible
    * I wait until "Loading Indicator" is gone
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be visible
    * I stop "Tax - State Citation Search Builder Load" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Securities - State Citation Search Builder Load #<n>
    * I am logged in
    * I open base url with "#/home/SecuritiesState"
    * I click "Search Bar > Citation Search Builder Button"

    * I start "Securities - State Citation Search Builder Load" measurement
    * "Search Bar > Citation Search Builder Button" should be visible
    * I wait until "Loading Indicator" is gone
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be visible
    * I stop "Securities - State Citation Search Builder Load" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Tax - State Return Home From Citation Builder #<n>
    * I am logged in
    * I open base url with "#/home/TaxStateAndLocal"
    * I click "Search Bar > Citation Search Builder Button"
    * "Search Bar > Citation Search Builder Button" should be visible
    * I wait until "Loading Indicator" is gone
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be visible
    * I click "Header > Home"

    * I start "Tax - State Return Home From Citation Builder" measurement
    * "#1 of White Papers And Special Reports Box > Title" should be visible
    * I stop "Tax - State Return Home From Citation Builder" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Securities - State Return Home From Citation Builder #<n>
    * I am logged in
    * I open base url with "#/home/SecuritiesState"
    * I click "Search Bar > Citation Search Builder Button"
    * "Search Bar > Citation Search Builder Button" should be visible
    * I wait until "Loading Indicator" is gone
    * "Citation Template Search Box > #1 of Citation Groups" should be visible
    * "Citation Template Search Box > #1 of Citation Groups > #1 of Templates > #1 of Inputs" should be visible
    * I click "Header > Home"

    * I start "Securities - State Return Home From Citation Builder" measurement
    * "#1 of White Papers And Special Reports Box > Title" should be visible
    * I stop "Securities - State Return Home From Citation Builder" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

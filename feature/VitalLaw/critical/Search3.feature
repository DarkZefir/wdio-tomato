@critical_path
@mvl
Feature: Search 3

  @CU-29852
  @local
  Scenario Outline: Proximity search operator - w proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Problem Encountered Popup" should not be visible
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should match "<searchTerm>" ignoring whitespaces

    Examples:
      | searchTerm                      |
      | connecticut w/200 fiduciary     |
      | connecticut w/63 fiduciary      |
      | connecticut w/1 fiduciary       |
      | marketplace w/10 lending        |
      | 50% bonus depreciation w/10 law |

  @CU-29853
  @local
  Scenario Outline: Proximity search operator - par proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Problem Encountered Popup" should not be visible
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should match "<searchTerm>" ignoring whitespaces

    Examples:
      | searchTerm                        |
      | fraud w/par duty                  |
      | "qualifying asset" w/par mortgage |

  @CU-29854
  @local
  Scenario Outline: Proximity search operator - sen proximity connector
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    * I perform search of "<searchTerm>"
    * Count of "Documents" should be more than "0"
    * "Problem Encountered Popup" should not be visible
    * "Results Toolbar > Search Information Icon" should be clickable
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Applied Terms" should match "<searchTerm>" ignoring whitespaces

    Examples:
      | searchTerm                |
      | insurance w/sen ownership |

  @CU-29722
  @local
  Scenario Outline: Search term highlights verification in snippet
    * I am logged in
    * I perform search of "<Term>"
    * Each element of "Highlighted Phrases" should contain "<Term to Highlight>" ignoring case

    Examples:
      | Term              | Term to Highlight |
      | investment        | investment        |
      | "margin interest" | margin interest   |


@critical_path
@mvl
@practical_content
Feature: Practical Content

  @CU-36356
  @logout
  Scenario Outline: Verify that after toggle switch to documents of Guide Books/Answer Books on "See All" link click list of documents is displayed
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "#1 of Results Clusters" should be visible
    * I remember index of "Results Clusters > Header Title" matching "<text>" as "num"
    * I click "#{$num} of Results Clusters > #2 of Labels"
    * I remember text of "#{$num} of Results Clusters > Hits Number" as "1st"
    * I click "#{$num} of Results Clusters > See All"
    * "#1 of Results Clusters > Toggle Switch" should be visible
    * I remember text of "#1 of Results Clusters > Documents Number" as "2nd"
    * "{$1st}" text should contain "{$2nd}" text
    * Text of "#1 of Results Clusters > Active Label" should be "Documents"
    * Text of "Practical Content Filter > Label" should be "<text>" ignoring case
    Examples:
      | text         |
      | GUIDE BOOKS  |
      | ANSWER BOOKS |

  @CU-41354
  Scenario Outline: Verify search term highlights in doc titles on Practical content
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I disable thesaurus
    * I perform search of "<term>" on practical content
    * Each element of "Results Clusters > Highlighted Phrases In Document Titles" should contain "<termToHighlight>" ignoring case

    Examples:
      | term   | termToHighlight |
      | answer | answer          |

  @CU-41355
  @local
  Scenario Outline: Verify that search terms on Practical Content are highlighted correctly when search with proximity connector
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I disable thesaurus
    * I perform search of "<term1> <connector> <term2>" on practical content
    * Each element of "Results Clusters > Highlighted Phrases In Document Titles" should contain "<term1>" ignoring case

    Examples:
      | term1     | connector | term2    |
      | valuation | NOT       | property |

  @CU-41356
  Scenario Outline: Verify that search terms on Practical Content are highlighted correctly when search with AND connector
    * I am logged in as "practCont@wk.com" with "password" password
    * I am on "All content" PA
    * I disable thesaurus
    * I perform search of "<term1> <connector> <term2>" on practical content
    * Each element of "Results Clusters > Highlighted Phrases In Document Titles" should match "(<term1>|<term2>)" ignoring case

    Examples:
      | term1     | connector | term2    |
      | valuation | AND       | critique |

  @CU-41357
  Scenario Outline: Verify search term highlights in doc titles on Practical content when switch from Books to Documents
    # Login as "practCont@wk.com" with "password" password
    * I am logged in as "practCont@wk.com" with "password" password
    # Uncheck 'Apply Thesaurus' checkbox
    * I am on "ALL CONTENT" PA
    * I disable thesaurus
    # Perform search from Practical Content for the term from examples
    * I perform search of "<term>" on practical content
    # Verify that the appropartiate words are highlighted in titles
    * Each element of "Results Clusters > Highlighted Phrases In Document Titles" should contain "<termToHighlight>" ignoring case
    * "#2 of Results Clusters > Toggle Switch" should be visible
    * "#2 of Results Clusters > Active Label" should be visible
    * Count of "#2 of Results Clusters > Labels" should be equal to "2"
    * Text of "#2 of Results Clusters > #1 of Labels" should be "Books"
    * Text of "#2 of Results Clusters > #2 of Labels" should be "Documents"
    # Switch to Documents in the second results cluster
    * I click "#2 of Results Clusters > #2 of Labels"
    * I wait 2 seconds
    * "#1 of Results Clusters > #1 of Items" should be visible
    # Verify that the appropartiate words are highlighted in titles
    * Each element of "Results Clusters > Highlighted Phrases In Document Titles" should contain "<termToHighlight>" ignoring case

    Examples:
      | term      | termToHighlight |
      | provision | provision       |

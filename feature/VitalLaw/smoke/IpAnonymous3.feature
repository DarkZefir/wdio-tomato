@smoke
@mvl
@ipa_only
Feature: IP Anonymous

  @CU-37893
  Scenario: Search Within DA - Searching with Pre- and Post-search Filters for IP Anonymous user
    * I am logged in
    * I open "fbl014174f1c07b801000855200215ad74790095" document
    * I remember text of "DA Title" as "DAtitle"
    * I click "Search Bar > Advanced Search"
    * "Advanced Search Popup" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * I type "tax" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > #1 of Presearch Filters > Title"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Presearch Filter Titles"
    * I click "Advanced Search Popup > #1 of Presearch Filters > #1 of Filter Items > #1 of Filter Item Level0 > Input"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    * "Filter Groups > #1 of Filter Items" should be visible
    * I click "#3 of Filter Groups > #Federal in Filter Items"
    * I wait until "Loading Indicator" is gone
    * I remember text of "Search Bar > Search Title" as "searchTitle"
    * "{$DAtitle}" text should contain "{$searchTitle}" text
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "Explanations and Annotations"
    * Text in collection of "Search Bar > PostSearch Filters > Filter Name" should contain "Federal"
    * Text of "Results Toolbar > Current Search Query" should be "“tax”"
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Document Type: Explanations and Annotations"
    * Text of "Search Information Popup > Post Search Selections Group" should contain "Jurisdiction: Federal"

  @CU-40294
  Scenario: Verify UI of 'Practical Content Results' page for IP Anonymous User
    * I am logged in
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I remember number of "Content Boxes" as "contentBoxes"
    * I perform search of "*" on practical content
    * I wait until "Loading Indicator" is gone
    * "Search Bar" should be visible
    * "Search Bar > #1 of Search Pills" should be visible
    * Text of "Search Bar > #1 of Search Pills" should be "*"
    * "Search Bar > Search Delete" should be visible
    * "Search Bar > Search Button" should be visible
    * "Search Bar > Thesaurus Checkbox" should be visible
    * "Practice Areas Filter" should be visible
    * "Practical Content Filter" should be visible
    * "#1 of Results Clusters" should be visible
    * Count of "Results Clusters" should be equal to "{$contentBoxes}"

  @CU-40295
  Scenario: Verify that appropriate content boxes are displayed on 'Practical Content' dashboard for user with full subscription
    * I am logged in
    * I click "Header > Practical Content Button"
    * "#1 of Content Boxes" should be visible
    * I should see the following lines in "Content Boxes > Title":
      | SMART CHARTS   |
      | SMARTTASKS     |
      | GUIDE BOOKS    |
      | FORMS          |
      | CALCULATORS    |
      | DECISION TREES |
      | ANSWER BOOKS   |
      | CHECKLISTS     |
    * "#1 of Content Boxes > Notification" should be visible
    * I should see the following lines in "Content Boxes > Notification":
      | Multi-jurisdictional surveys or comprehensive answers on a given topic based upon your selections of interest                            |
      | Guided workflow tools, supplemented by expert content, to complete a particular task                                                     |
      | Provide practical tips and insights on how to be compliant related to a topic                                                            |
      | Common sample forms or agreements with expert commentary when available                                                                  |
      | Workflow tools that provide step-by-step calculations for a topic                                                                        |
      | Workflow tools that require answers to questions at each step and guide one through completion resulting in a finished task or an answer |
      | Written in a Q & A format, providing straightforward answers to compliance related topics                                                |
      | Topics to consider or task-based list of items required                                                                                  |

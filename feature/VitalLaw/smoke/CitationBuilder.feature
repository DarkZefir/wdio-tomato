@smoke
@mvl
@ipa
@citation_builder
Feature: Citation Builder

  @CU-32727
  Scenario Outline: Citation Builder search - 1 result (Read view)
    * I am logged in
    # Open any PA with Citation Search button
    * I open base url with "<url>"
    # Open Citation Builder
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    # Select any search box and input valid citation search to get only one citation result (eg placeholder)
    * I wait until "Citation Template Search Box > Loading Indicator" is gone
    * I remember index of "Citation Template Search Box > Citation Groups > Group Title" matching "<Group>" as "titleIndex"
    * I remember number of "Citation Template Search Box > #{$titleIndex} of Citation Groups > Templates > Title" as "inputNum"
    * I remember random integer below "{$inputNum}" and above "2" as "random"
    * I remember "placeholder" attribute of "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > #1 of Inputs" as "text"
    * I type "{$text}" in "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > #1 of Inputs"
    # Click Go Button
    * I click "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > Go Button"
    # Verify that Read view is opened and Citation document is displayed
    * Text of "Session Navigator" should be "<PA>" ignoring case
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame" should contain "{$text}"

    Examples:
      | PA               | url               | Group           |
      | Securities - All | #/home/Securities | Acts & Statutes |
      | Tax - Federal    | #/home/TaxFederal | Reporters       |

  @CU-32728
  Scenario Outline: Citation Builder search - 1+ results
    * I am logged in
    # Open any PA with Citation Search button
    * I open base url with "<url>"
    # Open Citation Builder
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    # Select any search box and input valid citation search to get only several citation result (eg in the table)
    * "Citation Template Search Box > Loading Indicator" should not be visible
    * I remember index of "Citation Template Search Box > Citation Groups > Group Title" matching "<Group>" as "titleIndex"
    * I remember index of "Citation Template Search Box > #{$titleIndex} of Citation Groups > Templates > Title" matching "<DA Title>" as "inputIndex"
    * I type "<Citation>" in "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$inputIndex} of Templates > #1 of Inputs"
    * I click "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$inputIndex} of Templates > Go Button"
    # SRL should be displayed with several citation results
    * I wait until "Loading Indicator" is gone
    * "Search Bar > Search Input" should not be visible
    * "Citation Matches Header" should be visible
    * Count of "Citation Results" should be more than "1"
    # Search Bar should be "Citation Search: <DA Title> §<Citation>"
    * Text of "Search Bar" should contain "Citation Search: <DA Title> §<Citation>"
    # Open Search Information Popup
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    # Verify that Pre Search filters contain PA and Citation Search info - DA and Citation
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Practice Area: <PA>" ignoring whitespaces
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "Citation Search: <DA Title> §<Citation>" ignoring whitespaces
    * I click "Search Information Popup > Close Button"
    * "Search Information Popup" should not be visible

    Examples:
      | PA               | url               | Citation | DA Title               | Group           |
      | Securities - All | #/home/Securities | 27       | Securities Act of 1933 | Acts & Statutes |

  @CU-32729
  Scenario Outline: Open document from Citation Builder results
    * I am logged in
    # Open any PA with Citation Search button
    * I open base url with "<url>"
    # Open Citation Builder
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > Loading Indicator" should not be visible
    # Select any search box and input valid citation search to get only several citation result (eg in the table)
    * I remember index of "Citation Template Search Box > Citation Groups > Group Title" matching "<Group>" as "titleIndex"
    * I remember index of "Citation Template Search Box > #{$titleIndex} of Citation Groups > Templates > Title" matching "<DA Title>" as "inputIndex"
    * I type "<Citation>" in "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$inputIndex} of Templates > #1 of Inputs"
    # Click "Go" button appeared next to input field where <Citation> text was input
    * I click "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$inputIndex} of Templates > Go Button"
    * I wait until "Loading Indicator" is gone
    # SRL should be displayed with several citation results
    * Count of "Citation Results" should be more than "1"
    # Click random Citation Result
    * I remember number of "Citation Results" as "results"
    * I remember random integer below "{$results}" as "random"
    * I click "#{$random} of Citation Results"
    # Verify that "<PA>" text from examples is displayed in Session Navigator
    * Text of "Session Navigator" should be "<PA>" ignoring case
    * I wait until "Loading Indicator" is gone
    # Verify that "DA Title" displayed in Read View contains <DA Title> from examples
    * Text of "DA Title" should contain "<DA Title>"
    # Verify thattext of the opened document contains <Citation> text
    * Text of "Document Frame" should contain "<Citation>"

    Examples:
      | PA               | url               | Citation | DA Title               | Group           |
      | Securities - All | #/home/Securities | 27       | Securities Act of 1933 | Acts & Statutes |

  @CU-32730
  Scenario Outline: Submit wrong citation to Citation builder template
    * I am logged in
    # Open any PA with Citation Search button
    * I open base url with "<url>"
    # Open Citation Builder
    * I click "Search Bar > Citation Search Builder Button"
    * "Citation Template Search Box" should be visible
    * "Citation Template Search Box > Loading Indicator" should not be visible
    # Select any search box and input invalid citation search to get no result (eg 123456789)
    * I remember index of "Citation Template Search Box > Citation Groups > Group Title" matching "<Group>" as "titleIndex"
    * I remember number of "Citation Template Search Box > #{$titleIndex} of Citation Groups > Templates > Title" as "inputNum"
    * I remember random integer below "{$inputNum}" as "random"
    * I type "123456789" in "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > #1 of Inputs"
    # Click Go button
    * I click "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > Go Button"
    * "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > Error Message" should be visible
    # Verify that Error Message is displayed and text is "No documents found for the citation entered. Please double check your entry."
    * Text of "Citation Template Search Box > #{$titleIndex} of Citation Groups > #{$random} of Templates > Error Message" should be "No documents found for the citation entered. Please double check your entry." ignoring whitespaces

    Examples:
      | PA               | url               | Group           |
      | Securities - All | #/home/Securities | Acts & Statutes |
      | Tax - Federal    | #/home/TaxFederal | Reporters       |

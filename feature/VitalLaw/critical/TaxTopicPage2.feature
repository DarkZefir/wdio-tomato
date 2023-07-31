@critical_path
@mvl
Feature: Tax Topics List 2

  @CU-34026
  Scenario Outline: Verify 'Key Primary Sources' section of International Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Key Primary Sources in Table Of Contents Items"
    * Text of "Tax Topic Page > Key Primary Sources Widget > Title" should be "Key Primary Sources" ignoring case
    * "Tax Topic Page > Key Primary Sources Widget" should be in viewport
    * Count of "Tax Topic Page > Key Primary Sources Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Key Primary Sources Widget > Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * Text of "Tax Topic Page > Key Primary Sources Widget > #{$randombox} of Box Titles" should be "Smart Chart" ignoring case
    * I click "Tax Topic Page > Key Primary Sources Widget > #{$randombox} of Links"
    * I switch to last tab
    * I wait 10 seconds
    * I should see "Smart Chart" text on page
    Examples:
      | type of Tax Topic Page | TLPdoc                             |
      | international          | 82d5f3727c92100090f290b11c2ac4f10f |

  @CU-34028
  Scenario Outline: Verify 'News' Section of Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #News in Table Of Contents Items"
    * "Tax Topic Page > News Widget" should be in viewport
    * Text of "Tax Topic Page > News Widget > Title" should be "News" ignoring case
    * Count of "Tax Topic Page > News Widget > News Items" should be more than "0"
    * I remember number of "Tax Topic Page > News Widget > News Items" as "items"
    * I remember random integer below "{$items}" as "randomitem"
    * I remember text of "Tax Topic Page > News Widget > #{$randomitem} of News Items" as "linkTitle"
    * I click "Tax Topic Page > News Widget > #{$randomitem} of News Items"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * I remember text of "Document Frame > Title" as "openedDocTitle"
    * "{$linkTitle}" text should contain "{$openedDocTitle}" text ignoring whitespaces ignoring case ignoring punctuation marks
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc01cb4454827d8c1000955100505688693901 |
      | state                  | tes01944f13847c761000a6eed8d385ad169402  |
      | international          | 9b6ae4967ce310009a7b90b11c18cbab04       |

  @CU-34029
  Scenario Outline: Verify 'Practice Aids' section of Tax Topics Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Practice Aids in Table Of Contents Items"
    * "Tax Topic Page > Practice Aids Widget" should be in viewport
    * Text of "Tax Topic Page > Practice Aids Widget > Title" should be "Practice Aids" ignoring case
    * Count of "Tax Topic Page > Practice Aids Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Practice Aids Widget > Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * "Tax Topic Page > Practice Aids Widget > #{$randombox} of Box Titles" should be visible
    * "Tax Topic Page > Practice Aids Widget > #{$randombox} of Links" should be visible
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc0119ab11747c6b1000a95a90b11c2ac4f106 |
      | state                  | tes01b48ff1ea7c6c1000b7b0d8d385ad169407  |

  @CU-34031
  Scenario Outline: Verify 'Forms & Instructions' section of Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Forms & Instructions in Table Of Contents Items"
    * "Tax Topic Page > Forms And Instructions Widget" should be in viewport
    * Text of "Tax Topic Page > Forms And Instructions Widget > Title" should be "Forms & Instructions" ignoring case
    * Count of "Tax Topic Page > Forms And Instructions Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Forms And Instructions Widget > Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * "Tax Topic Page > Forms And Instructions Widget > #{$randombox} of <Element>" should be visible
    * "Tax Topic Page > Forms And Instructions Widget > #{$randombox} of Document Title" should be visible
    Examples:
      | type of Tax Topic Page | TLPdoc                                    | Element    |
      | federal                | tppc0119ab13cc7c6b10009cc490b11c2ac4f1041 | Form Id    |
      | state                  | tes01c327ee367d6810008ffb005056881d2302   | Form Id    |
      | international          | 829329a27c9210008d4590b11c2ac4f1027       | Box Titles |

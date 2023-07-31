@critical_path
@mvl
Feature: Tax Topics List 1

  @CU-34036
  Scenario Outline: Verify 'Client Letters' section of Tax Topics Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Client Letters in Table Of Contents Items"
    * "Tax Topic Page > Client Letters Widget" should be in viewport
    * Text of "Tax Topic Page > Client Letters Widget > Title" should be "Client Letters" ignoring case
    * Count of "Tax Topic Page > Client Letters Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Client Letters Widget > Boxes" as "boxes"
    * Text of "Tax Topic Page > Client Letters Widget > #{$randomInt(1, $boxes)} of Box Titles" should be "Client Letter" ignoring case
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc0141b309647cee1000a9b790b11c18c90201 |
      | state                  | tes0142378d1c7d7310009804005056881d2302  |

  @CU-34037
  Scenario Outline: Verify 'Smart Charts' section of Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Smart Charts in Table Of Contents Items"
    * "Tax Topic Page > Smart Charts Widget" should be in viewport
    * Text of "Tax Topic Page > Smart Charts Widget > Title" should be "Smart Charts" ignoring case
    * Count of "Tax Topic Page > Smart Charts Widget > Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Smart Charts Widget > Boxes" as "boxes"
    * "Tax Topic Page > Smart Charts Widget > #{$randomInt(1, $boxes)} of Box Links" should be visible
    * Each element of "Tax Topic Page > Smart Charts Widget > Boxes" should contain "Smart Chart" ignoring case
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc0119ab10e87c6b1000aa0f90b11c2ac4f102 |
      | state                  | tes01c67dcc7e7d251000a601d8d385ad169402  |
      | international          | 82a1edde7c921000851390b11c2ac4f103       |

  @CU-34043
  Scenario Outline: Verify 'IRS Publications' section of Tax Topic Page
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #IRS Publications in Table Of Contents Items"
    * "Tax Topic Page > IRS Publications Widget" should be in viewport
    * Text of "Tax Topic Page > IRS Publications Widget > Title" should be "IRS Publications" ignoring case
    * Count of "Tax Topic Page > IRS Publications Widget > Boxes" should be more than "0"
    * Each element of "Tax Topic Page > IRS Publications Widget > Boxes" should contain "IRS Publication" ignoring case
    * I remember number of "Tax Topic Page > IRS Publications Widget > Boxes" as "boxes"
    * "Tax Topic Page > IRS Publications Widget > #{$randomInt(1, $boxes)} of Links" should be visible
    Examples:
      | type of Tax Topic Page | TLPdoc                                  |
      | federal                | tes0144bf60327d731000946700505688693902 |

  @CU-34045
  Scenario Outline: Verify 'Citations' section of Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Citations in Table Of Contents Items"
    * "Tax Topic Page > Citations Widget" should be in viewport
    * Text of "Tax Topic Page > Citations Widget > Title" should be "Citations" ignoring case
    * Count of "Tax Topic Page > Citations Widget > Links" should be more than "0"
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc014f5792487c6b100093b690b11c2ac4f10a |

  @CU-34046
  Scenario Outline: Verify that the same doc can be opened from analytical section and by click on correspondent link in 'Citations' section of TLP doc
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Citations in Table Of Contents Items"
    * "Tax Topic Page > Citations Widget" should be in viewport
    * I click "Tax Topic Page > Citations Widget > #2. REVPROC2015-13 in Links"
    * I switch to last tab
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * I remember text of "Document Frame > Title" as "docTitle"
    * I switch to first tab
    * I remember number of browser tabs
    * I click "Tax Topic Page > #two or more consecutively filed returns in Citation Links"
    * I switch to new tab
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    * Text of "Document Frame > Title" should be "$docTitle"
    Examples:
      | type of Tax Topic Page | TLPdoc                                    |
      | federal                | tppc0121df0fd27c691000891b90b11c18cbab046 |

  @CU-34049
  Scenario Outline: Verify 'Forms' section of Tax Topic Page
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * I click "Tax Topic Page > #Forms in Table Of Contents Items"
    * "Tax Topic Page > Forms Widget" should be in viewport
    * Text of "Tax Topic Page > Forms Widget > Title" should be "Forms" ignoring case
    * Count of "Tax Topic Page > Forms Widget> Boxes" should be more than "0"
    * I remember number of "Tax Topic Page > Forms Widget > Boxes" as "boxes"
    * I remember random integer below "{$boxes}" as "randombox"
    * "Tax Topic Page > Forms Widget > #{$randombox} of <Element>" should be visible
    * "Tax Topic Page > Forms Widget > #{$randombox} of Document Title" should be visible
    Examples:
      | type of Tax Topic Page | TLPdoc                                   | Element |
      | federal                | tppc011bb53b8e7c6b1000965490b11c2ac4f10d | Form Id |


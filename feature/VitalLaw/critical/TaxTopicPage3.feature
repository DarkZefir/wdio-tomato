@critical_path
@mvl
Feature: Tax Topics List 3

  @CU-34022
  Scenario Outline: Verify 'Recommended Topics' section of Tax Topic Pages
    * I am logged in
    * I open "<TLPdoc>" topics document
    * "Tax Topic Page > Topic Title" should be visible
    * "Tax Topic Page > Table Of Contents" should be visible
    * "Tax Topic Page > #1 of Table Of Contents Items" should be visible
    * I click "Tax Topic Page > #Recommended Topics in Table Of Contents Items"
    * "Tax Topic Page > Recommended Topics Widget" should be visible
    * "Tax Topic Page > Recommended Topics Widget" should be in viewport
    * Text of "Tax Topic Page > Recommended Topics Widget > Subsection Title" should be "Explore this Topic" ignoring case
    * I remember number of "Tax Topic Page > Recommended Topics Widget > Child Documents Links" as "topics"
    * I remember random integer below "{$topics}" as "randomtopic"
    * I remember text of "Tax Topic Page > Recommended Topics Widget > #{$randomtopic} of Child Documents Links" as "docTitle"
    * I click "Tax Topic Page > Recommended Topics Widget > #{$randomtopic} of Child Documents Links"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > Topic Title" should be visible
    * Text of "Tax Topic Page > Topic Title" should contain "{$docTitle}" ignoring case
    Examples:
      | type of Tax Topic Page | TLPdoc                                   |
      | federal                | tppc0121df0dfc7c691000b77690b11c18cbab02 |
      | state                  | tes0192a303427c761000ab8ad8d385ad169402  |
      | international          | 9b15cbfa7ce31000a60390b11c18cbab03       |

  @CU-37686
  Scenario Outline: Verify that 'Tax Essentials' box is not displayed on corresponding PAs for users with limited subscription
    * I am logged in as "<User>" with "password" password
    * I am on "<PA>" PA
    * I wait until "Loading Indicator" is gone
    * "Essentials Box" should not be visible
    Examples:
      | User              | PA                  |
      | TLPuser@wk.com    | TAX - FEDERAL       |
      | TLPnostate@wk.com | TAX - STATE & LOCAL |
      | TLPmixed@wk.com   | TAX - INTERNATIONAL |

  @CU-37687
  Scenario Outline: Verify that Tax Topic Pages can be found in 'Titles' overlay
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    * I type "<Term>" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * Text of "Titles Popup > #1 of Publications Links" should be "<Term>"
    * I click "Titles Popup > #1 of Publications Links"
    * I wait until "Loading Indicator" is gone
    * "<List>" should be visible
    Examples:
      | Term                           | List                                  |
      | Tax Essentials - State         | Tax State Topics List                 |
      | Tax Essentials - Federal       | Tax Federal Topics List               |
      | Tax Essentials - International | Tax International Topics List Country |
      | Tax Essentials - Argentina     | Tax International Topics List Country |

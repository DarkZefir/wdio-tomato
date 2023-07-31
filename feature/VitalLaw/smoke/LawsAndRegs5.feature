@smoke
@mvl
@LawsAndRegs
Feature: LawsAndRegs5

  @CU-39867
  Scenario Outline: Verify that user can switch between versions of Laws&Regulations document
    * I am logged in
    # Open L&R document with future version
    * I open "<doc>" document
    * "Document Frame > Document Content" should be visible
    # Verify that caution line is displayed with <message> message ("legislative activity" for statutes, and "regulatory activity" for regulations)
    * Text of "Document Frame > Document Content > Caution Line" should be "<message>"
    * "Document Frame > Document Content > #1 of History Menu Items" should be visible
    * I remember current url as "currentUrl"
    * I remember number of "Document Frame > Document Content > History Menu Items" as "numOfItems"
    * I remember random integer below "{$numOfItems}" as "linkToClick"
    * I remember text of "Document Frame > Document Content > #{$linkToClick} of History Menu Items" as "textHistoryItem"
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    * I remember value of "dcterms:identifier" metadata parameter as "identifierValue"
    # Click on any version tab under caution line
    * I click "Document Frame > Document Content > #{$linkToClick} of History Menu Items"
    * I remember current url as "historyUrl"
    * I click "Show Metadata"
    * "Metadata Loading Indicator" should not be visible
    # Verify that document body was switched to the new version (same url as for original one, but another document id)
    * "Document Frame > Document Content" should be visible
    * Text of "Document Frame > Document Content > Active History Menu Items" should be "{$textHistoryItem}"
    * "{$currentUrl}" text should be equal to "{$historyUrl}" text
    * Value of "dcterms:identifier" metadata parameter should not be equal to "{$identifierValue}" value

    Examples:
      | DocType | doc                                         | message                                                 |
      | SR      | va-regs-24dceeda94545570fab40182b15bed51-v1 | This section has been affected by regulatory activity.  |
      | SS      | wy-law-26a5e675a810e588a70f82373d8e62e9-v1  | This section has been affected by legislative activity. |
      | CFR     | us-regs-ca79dcaac449983b94dbeb5b78f35c62-v1 | This section has been affected by regulatory activity.  |

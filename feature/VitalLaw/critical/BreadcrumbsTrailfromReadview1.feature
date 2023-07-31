@critical_path
@mvl
Feature: Breadcrumbs Trail from Read view

  @CU-37011
  Scenario Outline: Verify displaying of Breadcrumb Trails for Federal Tax Topics
    * I am logged in
    # Open 'tppc018dcd37347cb21000b76190b11c18cbab01' doc
    * I open "tppc018dcd37347cb21000b76190b11c18cbab01" topics document
    * I wait until "Loading Indicator" is gone
    # Verify that Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    * "Tax Topic Page > Topic Title" should be visible
    # Remember the title of the topic
    * I remember text of "Tax Topic Page > Topic Title" as "FirstLevelTopic"
    * "Tax Topic Page > Recommended Topics Widget" should be visible
    * "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" should be visible
    # Remember the title of the first child doc in Recommended Topic box
    * I remember text of "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" as "SecondLevelTopic"
    # Click on the first child doc in Recommended Topic box
    * I click "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the first part of the Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    # Verify that the second part of the Breadcrumb trail is equal to the title of the topic that was memorized
    * Text of "Tax Topic Page > #2 of Topic Breadcrumbs" should be "{$FirstLevelTopic}" ignoring case
    # Verify that the title of the topic is equal to the title of the child doc in Recommended Topic box that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$SecondLevelTopic}" ignoring case
    * "Tax Topic Page > Table Of Contents" should be visible
    * I remember index of "Tax Topic Page > Table Of Contents Items" matching "Recommended Topics" as "recTopics"
    # Click on Recommended Topic in TOC
    * I click "Tax Topic Page > #{$recTopics} of Table Of Contents Items"
    * "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" should be visible
    # Remember the first child doc in Recommended Topic box
    * I remember text of "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" as "3rdLevelTopic"
    # Click on the first child doc in Recommended Topic box
    * I click "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #3 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the first part of the Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    # Verify that the second part of the Breadcrumb trail is equal the title of the topic that was memorized
    * Text of "Tax Topic Page > #2 of Topic Breadcrumbs" should be "{$FirstLevelTopic}" ignoring case
    # Verify that the third part of the Breadcrumb trai is equal to the title of the child doc in Recommended Topic box that was memorized
    * Text of "Tax Topic Page > #3 of Topic Breadcrumbs" should be "{$SecondLevelTopic}" ignoring case
    # Verify that the title of the topic is equal to the title of the child doc in Recommended Topic box that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$3rdLevelTopic}" ignoring case
    # Click on the third part of Breadcrumb trail
    * I click "Tax Topic Page > #3 of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the third part of Breadcrumb trail is not displayed
    * "Tax Topic Page > #3 of Topic Breadcrumbs" should not be visible
    # Verify that the title of the topic is equal to the first child doc that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$SecondLevelTopic}" ignoring case
    # Click on the second part of the Breadcrumb trail
    * I click "Tax Topic Page > #2 of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the second part of Breadcrumb trail is not displayed
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should not be visible
    # Verify that Breadcrumb trail is equal to the topic title that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$FirstLevelTopic}" ignoring case
    # Click on the Breadcrumb trail
    * I click "Tax Topic Page > #1 of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    # Verify that Tax Federal Topics List is displayed
    * "Tax Federal Topics List" should be visible

    Examples:
      | Topics List Breadcrumb   |
      | Tax Essentials - Federal |

  @CU-37013
  Scenario Outline: Verify displaying of Breadcrumb Trails for State Tax Topics
    * I am logged in
    # Open 'tes01b37dfc8e7c6c1000b459d8d385ad169402' doc
    * I open "tes01b37dfc8e7c6c1000b459d8d385ad169402" topics document
    # Verify that Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    * "Tax Topic Page > Topic Title" should be visible
    # Remember the title of the topic
    * I remember text of "Tax Topic Page > Topic Title" as "FirstLevelTopic"
    * "Tax Topic Page > Table Of Contents" should be visible
    * I remember index of "Tax Topic Page > Table Of Contents Items" matching "Recommended Topics" as "recTopics"
    # Click on Recommended Topic in TOC
    * I click "Tax Topic Page > #{$recTopics} of Table Of Contents Items"
    * "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" should be visible
    # Remember the title of the first child doc in Recommended Topic box
    * I remember text of "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links" as "SecondLevelTopic"
    # Click on the first child doc in Recommended Topic box
    * I click "Tax Topic Page > Recommended Topics Widget > #1 of Child Documents Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the first part of the Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    # Verify that the second part of the Breadcrumb trail is equal to the title of the topic that was memorized
    * Text of "Tax Topic Page > #2 of Topic Breadcrumbs" should be "{$FirstLevelTopic}" ignoring case
    # Verify that the title of the topic is equal to the title of the child doc that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$SecondLevelTopic}" ignoring case
    # Click on the second part of the Breadcrumb trail
    * I click "Tax Topic Page > #2 of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the second part of Breadcrumb trail is not displayed
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should not be visible
    # Verify that Breadcrumb trail is equal to the topic title that was memorized
    * Text of "Tax Topic Page > Topic Title" should be "{$FirstLevelTopic}" ignoring case
    # Click on the Breadcrumb trail
    * I click "Tax Topic Page > #1 of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    # Verify that Tax Federal Topics List is displayed
    * "Tax State Topics List" should be visible

    Examples:
      | Topics List Breadcrumb |
      | Tax Essentials - State |

  @CU-37014
  Scenario Outline: Verify displaying of Breadcrumb Trail for International Topic Page
    * I am logged in
    # Open the URL from examples
    * I open base url with "<topicsList>"
    * I wait until "Loading Indicator" is gone
    # Verify that Tax International Topics List is displayed
    * "Tax International Topics List Country > #1 of Boxes" should be visible
    # Remember the title of the first topics box
    * I remember text of "Tax International Topics List Country > #1 of Box Titles" as "boxTitle"
    # Remember the title of the first link in the first topics box
    * I remember text of "Tax International Topics List Country > #1 of Topic Links" as "topicTitle"
    # Click on the first link in the first topics box
    * I click "Tax International Topics List Country > #1 of Topic Links"
    * I wait until "Loading Indicator" is gone
    * "Tax Topic Page > #1 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > #2 of Topic Breadcrumbs" should be visible
    * "Tax Topic Page > Topic Title" should be visible
    # Verify that the first part of the Breadcrumb trail is equal to the one from examples
    * Text of "Tax Topic Page > #1 of Topic Breadcrumbs" should be "<Topics List Breadcrumb>" ignoring case
    # Verify that the second part of the Breadcrumb trail is equal to the title of the first topics box that was memorized
    * Text of "Tax Topic Page > #2 of Topic Breadcrumbs" should be "{$boxTitle}" ignoring case
    # Verify that topic title contains the title of the first link in the first topics box that was memorized
    * Text of "Tax Topic Page > Topic Title" should contain "{$topicTitle}" ignoring case
    * I remember number of "Tax Topic Page > Topic Breadcrumbs" as "breadcrumbNum"
    * I remember random integer below "{$breadcrumbNum}" as "breadcrumbToClick"
    # Click on any part of the Breadcrumb trail
    * I click "Tax Topic Page > #{$breadcrumbToClick} of Topic Breadcrumbs"
    * I wait until "Loading Indicator" is gone
    # Verify that Tax International Topics List is displayed
    * "Tax International Topics List Country" should be visible

    Examples:
      | topicsList                           | Topics List Breadcrumb         |
      | #/topics/browse/kitl/kluwertaxlaw/AM | QUICK REFERENCE BY COUNTRY     |
      | #/topics/browse/intl/Tax/AM          | TAX ESSENTIALS - INTERNATIONAL |

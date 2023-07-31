@critical_path
@mvl
Feature: Breadcrumbs Trail from Read view

  @CU-29104
  Scenario Outline: Verify the absence of Breadcrumb trail for hidden publications
    * I am logged in
    * I am on "ALL CONTENT" PA
    # Click on 'Titles' in Header
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    # Insert search terms from examples
    * I type "<hiddenDATitle>" in "Titles Popup > Search Input"
    * "Titles Popup > #1 of Publications Links" should be visible
    # Click on 'Go' button
    * I click "Titles Popup > Search Button"
    # Click on the first doc in SRL
    * I click "Titles Popup > #1 of Publications Links"
    * I wait until "Loading Indicator" is gone
    * "Document Frame > Title" should be visible
    # Verify that Breadcrumbs are not displayed
    * "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should not be visible

    Examples:
      | hiddenDATitle                      |
      | Kluwer International Tax Blog      |
      | ERISA Code and Regulations TI      |
      | Federal Advertising laws and rules |
      | SEC Today (2004 - 2007)            |

  @CU-29105
  Scenario Outline: Verify that breadcrumbs for one publication are the same on Titles overlay and on Breadcrumb trail
    * I am logged in
    * I am on "ALL CONTENT" PA
    # Click on 'Titles' in Header
    * I click "Header > Titles Button"
    * "Titles Popup" should be visible
    # Perform search for 'Advertising Law Guide Finding Lists'
    * I type "Advertising Law Guide Finding Lists" in "Titles Popup > Search Input"
    * I click "Titles Popup > Search Button"
    * "Titles Popup > #1 of Publications Links" should be visible
    * I move mouse over "Titles Popup > #1 of Publications Links"
    # Click on Info button near the first publication in SRL
    * I click "Titles Popup > #1 of Publication Containers > Info Button"
    * I wait until "Loading Indicator" is gone
    * "Titles Popup > Info Box" should be visible
    # Verify that Breadcrubms from examples are displayed
    * "Titles Popup > Info Box > #1 of Info Container Breadcrumbs" should be visible
    * Text of "Titles Popup > Info Box > #1 of Info Container Breadcrumbs" should contain "<1stBreadcrumb>"
    * Text of "Titles Popup >  Info Box > #1 of Info Container Breadcrumbs" should contain "<2ndBreadcrumb>"
    # Click on 'Close' button
    * I click "Titles Popup > Close Button"
    # Open '09013e2c826d25f0' doc
    * I open "09013e2c826d25f0" document
    # Verify that the doc contains breadcrumbs from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should contain "<1stBreadcrumb>"
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should contain "<2ndBreadcrumb>"

    Examples:
      | 1stBreadcrumb           | 2ndBreadcrumb    |
      | Antitrust & Competition | Indexes & Tables |

  @CU-36990
  Scenario: Verify that user is able to navigate to a dashboard by click on breadcrumb trail from Bradcrumbs Dropdown
    * I am logged in
    # Open 'aa9de1de7c021000b957d8d385ad169405' doc
    * I open "aa9de1de7c021000b957d8d385ad169405" document
    * "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be visible
    # Expand the breadcrumb trail
    * I click "Search Bar > Document Breadcrumbs > Expand Button"
    * I remember number of "Search Bar > Document Breadcrumbs > Additional Breadcrumb Links" as "linksNum"
    * I remember random integer below "{$linksNum}" as "linkToClick"
    # Remember text of any link of the additional breadcrumb trail
    * I remember text of "Search Bar > Document Breadcrumbs >  #{$linkToClick} of Additional Breadcrumb Links" as "linkText"
    # Click on the link that was memorized
    * I click "Search Bar > Document Breadcrumbs > #{$linkToClick} of Additional Breadcrumb Links"
    * I wait until "Loading Indicator" is gone
    # Remember text of Session NAvigator
    * I remember text of "Session Navigator" as "PA"
    # Verify that text of the breadcrumb link that was memorized contains PA from Session Navigator
    * "{$linkText}" text should contain "{$PA}" text ignoring case

  @CU-36997
  @logout
  Scenario Outline: Verify that breadcrumbs are displayed only for PAs for which user has subscription
    * I am logged in
    # Open '09013e2c827d1af0' doc
    * I open "09013e2c827d1af0" document
    # Verify that the main breadcrumb is equal to the one from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "<Main Breadcrumb1>"
    * "Search Bar > Document Breadcrumbs > Expand Button" should be visible
    # Expand the breadcrumb trail
    * I click "Search Bar > Document Breadcrumbs > Expand Button"
    * "Search Bar > Document Breadcrumbs > Additional Breadcrumb Trails" should be visible
    # Verify that the following links are displayed in the expanded breadcrumb trail
    * I should see the following lines in "Search Bar > Document Breadcrumbs > Additional Breadcrumb Links":
      | Tax - Federal > Treatises       |
      | Tax - International > Treatises |
    # Click on Logout in User Menu in Header
    * I click "Header > User Menu"
    * "Header > User Menu > #1 of Items" should be visible
    * I click "Header > User Menu >#Logout in Items"
    # Insert 'cptest@wk.com' into 'User ID' field and 'password' into 'Password' field
    * "Login Form > Login Button" should be visible
    * "Login Form > Username Input" should be visible
    * I type "interlimit@wk.com" in "Login Form > Username Input"
    * I type "password" in "Login Form > Password Input"
    # Click on 'Login' button
    * I click "Login Form > Login Button"
    # Open '09013e2c827d1af0' doc
    * I open "09013e2c827d1af0" document
    # Verify that breadcrumb is equal to one from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "<Main Breadcrumb2>"
    # Verify that breadcrumb trail cannot be expanded
    * "Search Bar > Document Breadcrumbs > Expand Button" should not be visible
    Examples:
      | Main Breadcrumb1              | Main Breadcrumb2                |
      | Tax - Federal > C-Corps & M&A | Tax - International > Treatises |

  @CU-36998
  Scenario Outline: Verify that breadcrumb trails for synthetic dashboards are not displayed
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    # Click on the second link in the first content box
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > #2 of Links"
    * I wait until "Loading Indicator" is gone
    # Verify that Breadcrumb trail does not contain PA from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should not contain "<PA>" ignoring case
    # Click on Breadcrumbs link
    * I click "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail"
    * I wait until "Loading Indicator" is gone
    # Verify that Session Navigator does not contain PA from examples
    * Text of "Session Navigator" should not be "<PA>"
    Examples:
      | PA               |
      | TAX - ALL        |
      | SECURITIES - ALL |

  @CU-37008
  Scenario Outline: Verify that paths to the same PA but for different content boxes are displayed in breadcrumbs if document is displayed in several content boxes
    * I am logged in
    # Open 'dft01b74e803c7cf7100091cb90b11c18c90201' doc
    * I open "dft01b74e803c7cf7100091cb90b11c18c90201" document
    * "DA Title" should be visible
    # Remember the title of the DA
    * I remember text of "DA Title" as "title"
    # Verify that Breadcrumb trail contains PA and name of content box1 from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should contain "<PA>" ignoring case
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should contain "<ContentBox1>" ignoring case
    # Expand the Breadcrumb trail
    * I click "Search Bar > Document Breadcrumbs > Expand Button"
    # Verify that Additional Breadcrumb trail contains PA and name of content box2 from examples
    * Text of "Search Bar > Document Breadcrumbs > #1 of Additional Breadcrumb Links" should contain "<PA>" ignoring case
    * Text of "Search Bar > Document Breadcrumbs > #1 of Additional Breadcrumb Links" should contain "<ContentBox2>" ignoring case
    # Click on the link in Additional Breadcrumb trail
    * I click "Search Bar > Document Breadcrumbs > #1 of Additional Breadcrumb Links"
    * I wait until "Loading Indicator" is gone
    # Verify that Session Navigator contains PA from examples
    * Text of "Session Navigator" should be "<PA>"
    * "Content Box > #1 of Main Content Types > #1 of Content Types" should be visible
    * I click "Content Box > #1 of Main Content Types > #<ContentBox1> in Content Types > See All"
    * "See All Popup" should be visible
    # Verify that the overlay contains the doc with the title that was memorized
    * Text in collection of "See All Popup > Links" should contain "{$title}" ignoring case
    # Click on 'Close' button
    * "See All Popup > Close Button" should be clickable
    * I click "See All Popup > Close Button"
    * I scroll to "Content Box > #1 of Main Content Types > #<ContentBox2> in Content Types" element
    * "Content Box > #1 of Main Content Types > #<ContentBox2> in Content Types > See All" should be visible
    # CLick on 'See All' button in 'Treatises' box
    * I click "Content Box > #1 of Main Content Types > #<ContentBox2> in Content Types > See All"
    * "See All Popup" should be visible
    # Verify that the overlay contains the doc with the title that was memorized
    * Text in collection of "See All Popup > Links" should contain "{$title}" ignoring case
    Examples:
      | PA            | ContentBox1   | ContentBox2 |
      | TAX - FEDERAL | C-CORPS & M&A | TREATISES   |

  @CU-37009
  Scenario Outline: Verify that for sub-DA level titles only the direct path to the section shown in the read panel will display in the Breadcrumb Trail
    * I am logged in
    # Open the doc from examples
    * I open "<id>" document
    # Verify that Breadcrumb trail is equal to the one from examples
    * Text of "Search Bar > Document Breadcrumbs > Main Breadcrumb Trail" should be "<breadcrumbText>"
    Examples:
      | id                    | breadcrumbText                      |
      | big0109013e2c83ae406a | Tax - State & Local > State & Local |

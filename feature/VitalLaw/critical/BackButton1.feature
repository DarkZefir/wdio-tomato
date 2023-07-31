@critical_path
@mvl
@backbutton
Feature: Back Button

  @CU-36928
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button after search from 'Search Case Database' widget
    * I am logged in
    # Open the PA from examples
    * I click "Practice Areas Box > #<PA> in Practice Area Links"
    * I wait 3 seconds
    # Verify that 'Search Case Database' box is displayed
    * "Search Case Databases Box" should be visible
    # Verify that 'IP - WK TRADEMARK NAVIGATOR' is displayed in SN
    * Text of "Session Navigator > Session Navigator Tab" should be "<PA>" ignoring case
    # Perform search for 'tax' within the box
    * I type "<term>" in "Search Case Databases Box > Search Term"
    * "Search Case Databases Box > Go Button" should be clickable
    # Click on 'Go' button
    * I click "Search Case Databases Box > Go Button" 
    # Verify that SRL is displayed
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    * "Search Case Databases Box" should not be visible
    * "Results Toolbar > Hit Count" should be visible
    # Click browser back button
    * I click browser back button
    # Verify that 'All Content' is displayed in SN
    * "Practice Areas Box" should be visible
    * Text of "Session Navigator > Session Navigator Tab" should be "ALL CONTENT"
    Examples:
      | PA                          | term |
      | IP - WK Trademark Navigator | tax  |

  @CU-36929
  Scenario Outline: Verify that user is able to return to PA by click on browser 'Back' button after usage of 'Treatises' box
    * I am logged in
    # Open the PA from examples
    * I am on "<PA>" PA
    * "Session Navigator > Session Navigator Tab" should be visible
    # Verify that 'KLUWER INTERNATIONAL TAX LAW' is displayed in SN
    * Text of "Session Navigator > Session Navigator Tab" should be "<PA>"
    # Verify that 'Bilateral Treaties' box is displayed
    * "Treaties Box > Bilateral Treaties Box" should be visible
    # Select the second value in the first drop-down
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns"
    * I click "Treaties Box > Bilateral Treaties Box > #1 of Dropdowns > #2 of Countries"
    # Verify that the second drop-down is clickable and select the second value
    * "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Button" should be clickable
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > Button"
    * I click "Treaties Box > Bilateral Treaties Box > #2 of Dropdowns > #2 of Countries"
    # Click on 'Go' button
    * I click "Treaties Box > Bilateral Treaties Box > Go Button"
    * "Treaties Browse Overlay" should be visible
    # Click on browser back button
    * I click browser back button
    # Verify that KITL PA is displayed in SN
    * Text of "Session Navigator > Session Navigator Tab" should be "<PA>"
    Examples:
      | PA                           |
      | KLUWER INTERNATIONAL TAX LAW |

  @CU-36942
  Scenario Outline: Verify that user is able to return back to dashboard by click on browser 'Back' button * search through 'Citation Lookup' box turns one result
    * I am logged in
    * "Session Navigator > Session Navigator Tab" should be visible
    # Expand Session Navigator
    * I click "Session Navigator > Session Navigator Tab"
    * "Session Navigator > #1 of <List>" should be visible
    # Click on 'Tax - All' PA
    * I click "Session Navigator > #<PA> in <List>"
    # Verify that 'Citation Lookup' box is displayed
    * "Citation Lookup Box" should be visible
    # Perform search for 'Pub 17'
    * I type "<Term>" in "Citation Lookup Box > Input Field"
    * I click "Citation Lookup Box > Go Button"
    * I wait until "Loading Indicator" is gone
    # Click on browser back button
    * I click browser back button
    * "Session Navigator" should be visible
    # Verify that 'Tax - All' PA is displayed in SN
    * Text of "Session Navigator" should be "<PA>"
    Examples:
      | PA        | List                      | Term   |
      | TAX - ALL | Practice Areas List Items | Pub 17 |

@smoke
@mvl
@history_overlay
Feature: History Overlay 2

  @CU-29763
  Scenario Outline: Verify that Sample Form search is present in History overlay on top position
    * I am logged in
    # Navigate to "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Sample Forms Box" should be visible
    *  I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    # Click dropdown in "Sample Forms Box"
    * I click "Sample Forms Box > #1 of Dropdowns"
    * "Sample Forms Box > #1 of Dropdowns > #2 of Items" should be visible
    # Remember text of Second item of the opened dropdown as "chosenSFTopic"
    * I remember text of "Sample Forms Box > #1 of Dropdowns > #2 of Items" as "chosenSFTopic"
    * I scroll "Sample Forms Box > #1 of Dropdowns > #2 of Items" to center of the window
    # Click Second item in dropdown
    * I click "Sample Forms Box > #1 of Dropdowns > #2 of Items"
    * "Sample Forms Box > #1 of Dropdowns > Label" should be visible
    # Type <sampleFormsearch> in Input Field of "Sample Forms Box"
    * I type "<sampleFormsearch>" in "Sample Forms Box > Search Term Input"
    # Click "GO" button within "Sample Forms Box"
    * I click "Sample Forms Box > Search Button"
    # Verify  that "Results" page is displayed
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify text of First item in "History" dropdown contains "SAMPLE FORMS: <sampleFormsearch> - {$chosenSFTopic}"
    * Text of "History Popup > #1 of Items > Link" should be "SAMPLE FORMS: <sampleFormsearch> - {$chosenSFTopic}" ignoring case

    Examples:
      | sampleFormsearch |
      | tax              |

  @CU-29769
  Scenario Outline: Verify that Search Case Database is present in History overlay on top position
    * I am logged in
    # Navigate to "IP - WK TRADEMARK NAVIGATOR" PA
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "Search Case Databases Box > Search Term" should be visible
    * I scroll "Search Case Databases Box > Search Term" to center of the window
    # Type <searchCaseDatabasesTerm> into "Search Term" input field of "Search Case Databases" box
    * I type "<searchCaseDatabasesTerm>" in "Search Case Databases Box > Search Term"
    # Click "Go" button
    * I click "Search Case Databases Box > Go Button"
    # Verify that "Results" page is displayed
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Click "See All" in "History" dropdown
    * I click "Header > History Dropdown > See All"
    # Verify that "History" popup is displayed
    * "History Popup" should be visible
    # Verify that text of First item in "History" dropdown contains "CASE DATABASES: <searchCaseDatabasesTerm>"
    * Text of "History Popup > #1 of Items > Link" should be "CASE DATABASES: <searchCaseDatabasesTerm>" ignoring case

    Examples:
      | searchCaseDatabasesTerm |
      | tax                     |

  @CU-29762
  Scenario Outline: Verify that Sample Form search is present in History dropdown on top position
    * I am logged in
    # Navigate to "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * I am on "SECURITIES - FEDERAL & INTERNATIONAL" PA
    * "Sample Forms Box" should be visible
    * I scroll "Sample Forms Box > #1 of Dropdowns" to center of the window
    # Click dropdown in "Sample Forms Box"
    * I click "Sample Forms Box > #1 of Dropdowns"
    * "Sample Forms Box > #1 of Dropdowns > #1 of Items" should be visible
    * I scroll "Sample Forms Box > Active Dropdown > #1 of Items" to center of the window
    # Click "Corporations" item in opened dropdown
    * I click "Sample Forms Box > Active Dropdown > #Corporations in Items"
    # Verify that "CORPORATIONS" text is displayed in First dropdown in "Sample Forms Box"
    * Text of "Sample Forms Box > #1 of Dropdowns > Label" should be "CORPORATIONS"
    # Type <sampleFormsearch> in "Search Input" field of "Sample Forms Box"
    * I type "<sampleFormsearch>" in "Sample Forms Box > Search Term Input"
    # Click "GO" button within "Sample Forms Box"
    * I click "Sample Forms Box > Search Button"
    # Verify that "Results" page is displayed
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in Header
    * I click "Header > History Dropdown"
    # Verify that text of First item in "History" dropdwon contains "SAMPLE FORMS: <sampleFormsearch> - Corporations" text
    * Text of "Header > History Dropdown > #1 of Items Title" should be "SAMPLE FORMS: <sampleFormsearch> - Corporations" ignoring case

    Examples:
      | sampleFormsearch |
      | tax              |

  @CU-29768
  Scenario Outline: Verify that Search Case Database search is present in History dropdown on top position
    * I am logged in
    # Navigate to "IP - WK TRADEMARK NAVIGATOR" PA
    * I am on "IP - WK TRADEMARK NAVIGATOR" PA
    * "Search Case Databases Box > Search Term" should be visible
    * I scroll "Search Case Databases Box > Search Term" to center of the window
    # Type <searchCaseDatabasesTerm> in "Search Term" field of "Search Case Databases Box"
    * I type "<searchCaseDatabasesTerm>" in "Search Case Databases Box > Search Term"
    # Click "Go" button of "Search Case Databases Box"
    * I click "Search Case Databases Box > Go Button"
    # Verify that "Results" page is opened
    * I wait until "Loading Indicator" is gone
    * "Results Toolbar > Hit Count" should be visible
    # Navigate to "Home" page
    * I click "Header > Home"
    # Click "History" in "Header"
    * I click "Header > History Dropdown"
    # Verify that text of First item in "History" dropdown contains "CASE DATABASES: <searchCaseDatabasesTerm>" text
    * Text of "Header > History Dropdown > #1 of Items Title" should be "CASE DATABASES: <searchCaseDatabasesTerm>" ignoring case

    Examples:
      | searchCaseDatabasesTerm |
      | tax                     |

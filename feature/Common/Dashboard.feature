@smoke
@mvl @vlcc
@dashboard
Feature: Dashboard


  @ipa
  @CU-31559 @CU-32233
  Scenario Outline: Verify User is able to open PAs from All Content
    * I am logged in
    * I am on "All content" PA
    * "Practice Areas Box" should be visible
    # Remember title of #<order> of Links in "Practice Areas Box"
    * I remember text of "Practice Areas Box > #<order> of Practice Area Links" as "title"
    # Click link with remembered text
    * I click "Practice Areas Box > #{$title} in Practice Area Links"
    * "Session Navigator" should be visible
    # Verify that PA with remembered title is opened and remembered text is displayed in "Session Navigator"
    * Text of "Session Navigator" should be "{$title}" ignoring case

    Examples:
      | order |
      | 1     |
      | 3     |
      | 5     |
      | 7     |

  @CU-32053 @CU-32262
  Scenario: Verify Home page is opened on clicking the Application logo
    * I am logged in
    # Click "Header > User Menu"
    * I click "Header > User Menu"
    # Click "Site Preferences" option in the opened menu
    * I click "Header > User Menu > #Site Preferences in Items"
    # Click "Practice Area" dropdown in "Site Preferences" popup
    * I click "Site Preferences Popup > Practice Area Dropdown"
    # Click on any item in the opened dropdown
    * I remember number of "Site Preferences Popup > Practice Area Dropdown > Items" as "items"
    * I remember random integer below "{$items}" and above "2" as "index"
    * I click "Site Preferences Popup > Practice Area Dropdown > #{$index} of Items"
    * "Site Preferences Popup > Practice Area Dropdown > #1 of Items" should not be visible
    # Remember text displayed in "Practice Area Dropdown"
    * I remember text of "Site Preferences Popup > Practice Area Dropdown" as "chosenPA"
    # Click "Save & Close" button
    * I click "Site Preferences Popup > Save And Close"
    * "Site Preferences Popup" should not be visible
    # Search for "tax" term
    * I perform search of "tax"
    # Click on "VitalLaw" logo
    * I click "Header > WK Logo"
    # Verify that user is returned to Home page with default {$chosenPA} Practice Area as it was saved through "Site Preferences" dropdown
    * "Session Navigator > Session Navigator Tab" should be visible
    * Text of "Session Navigator" should be "{$chosenPA}" ignoring whitespaces

  @CU-33127 @CU-33128
  Scenario: Verify THE UKRAINE CRISIS: SPECIAL REPORTS box
    * I am logged in
    # Check that THE UKRAINE CRISIS: SPECIAL REPORTS box "See All button" is visible
    * Text of "Ukraine Crisis Box > Title" should be "CRISIS IN UKRAINE: SPECIAL REPORTS"
    * "Ukraine Crisis Box > See All Button" should be visible
    # Check that 3 links is visible in THE UKRAINE CRISIS: SPECIAL REPORTS box
    * Count of "Ukraine Crisis Box > Links" should be equal to "3"
    # Check links' names
    * I should see the following lines in "Ukraine Crisis Box > Links":
      | War in Ukraine: Humanitarian Aid, and the Neutrality Act (March 28, 2022)         |
      | Conflict in Ukraine: Confronting contracts risks and obligations (March 25, 2022) |
      | War in Ukraine: Addressing Business Risks and Crisis Management (March 25, 2022)  |
    # Check links' URLs
    * "Ukraine Crisis Box > Links" urls should contain the following lines:
      | business.cch.com/UKRC/SR_Russian-Ukraine-humanitarian-aid_03-28-2022_final_locked.pdf           |
      | business.cch.com/UKRC/SR_Russian-Ukraine-business-interruption_03-25-2022_final_locked.pdf      |
      | business.cch.com/UKRC/SR_Russian-Ukraine_Risk-and-Crisis-Management_03-25-2022_final_locked.pdf |

  @CU-40907 @CU-40908
  Scenario: Verify UI of CRISIS IN UKRAINE: SPECIAL REPORTS See All overlay
    * I am logged in
    * I am on "All content" PA
    * "Ukraine Crisis Box" should be visible
    # Click See All button in CRISIS IN UKRAINE: SPECIAL REPORTS container
    * I click "Ukraine Crisis Box > See All Button"
    # Check that CRISIS IN UKRAINE: SPECIAL REPORTS popup appeared
    * "See All Popup" should be visible
    # Check that popup title is CRISIS IN UKRAINE: SPECIAL REPORTS
    * Text of "See All Popup > Title" should be "CRISIS IN UKRAINE: SPECIAL REPORTS" ignoring case ignoring whitespaces
    # Check that there is X button
    * "See All Popup > X Close Button" should be visible
    # Check that there is Close button
    * "See All Popup > Close Button" should be visible
    # Check that links count is 10
    * Count of "See All Popup > Links" should be equal to "10"
    # Check links names
    * I should see the following lines in "See All Popup > Links":
      | War in Ukraine: Humanitarian Aid, and the Neutrality Act (March 28, 2022)                                          |
      | Conflict in Ukraine: Confronting contracts risks and obligations (March 25, 2022)                                  |
      | War in Ukraine: Addressing Business Risks and Crisis Management (March 25, 2022)                                   |
      | EU response to Ukraine's plight puts bloc into spotlight (March 24, 2022)                                          |
      | Russian sanctions: Compliance, enforcement, and the prevention of sanctions evasion (March 23, 2022)               |
      | U.S. and allied sanctions cut off Russia from financial world (March 22, 2022)                                     |
      | War and Globalization: Invasion of Ukraine brings surging energy and food prices around the world (March 22, 2022) |
      | Russia-Ukraine Conflict: Surveying SEC disclosure requirements and related topics (March 21, 2022)                 |
      | IP rights are both victims and weapons in Russia’s war on Ukraine (March 18, 2022)                                 |
      | Russia-Ukraine: Businesses assess cyber threat as U.S. moves to tighten cybersecurity (March 18, 2022)             |
    # Check links URLs
    * "See All Popup > Links" urls should contain the following lines:
      | business.cch.com/UKRC/SR_Russian-Ukraine-humanitarian-aid_03-28-2022_final_locked.pdf           |
      | business.cch.com/UKRC/SR_Russian-Ukraine-business-interruption_03-25-2022_final_locked.pdf      |
      | business.cch.com/UKRC/SR_Russian-Ukraine_Risk-and-Crisis-Management_03-25-2022_final_locked.pdf |
      | business.cch.com/UKRC/SR_Russian-Ukraine-EU-membership_03-24-2022_final_locked.pdf              |
      | business.cch.com/bfld/SR_Russian-sanctions-compliance-enforcement_03-22-2022_final_locked.pdf   |
      | business.cch.com/BFLD/SR_Russian-sanctions-update_03-21-2022_final_locked.pdf                   |
      | business.cch.com/UKRC/SR_Russian-Ukraine-energy-commodities_03-22-2022_final_locked.pdf         |
      | business.cch.com/srd/SR_Russian-Ukraine-SEC-Disclosure_03-17-2022_final_locked.pdf              |
      | business.cch.com/ipld/SR_Russian-Ukraine-Impact_03-16-2022_final_locked.pdf                     |
      | business.cch.com/CybersecurityPrivacy/SRCPRRussian_UkraineImpact3182022.pdf                     |
    # Click Close button
    * I click "See All Popup > Close Button"
    # Check that popup was closed
    * "See All Popup" should not be visible
    # Click See All button
    * I click "Ukraine Crisis Box > See All Button"
    # Check that popup appeared
    * "See All Popup" should be visible
    # Click X button
    * I click "See All Popup > X Close Button"
    # Check that popup was closed
    * "See All Popup" should not be visible

  @CU-40910 @CU-40909
  Scenario: CRISIS IN UKRAINE: SPECIAL REPORTS See All overlay is closed by clicking Close/X button
    * I am logged in
    * I am on "All content" PA
    * "Ukraine Crisis Box" should be visible
    # Click See All button in CRISIS IN UKRAINE container
    * I click "Ukraine Crisis Box > See All Button"
    # Check that CRISIS IN UKRAINE popup appeared
    * "See All Popup" should be visible
    # Click Close button
    * I click "See All Popup > Close Button"
    # Check that popup was closed
    * "See All Popup" should not be visible
    # Click See All button
    * I click "Ukraine Crisis Box > See All Button"
    # Check that popup appeared
    * "See All Popup" should be visible
    # Click X button
    * I click "See All Popup > X Close Button"
    # Check that popup was closed
    * "See All Popup" should not be visible

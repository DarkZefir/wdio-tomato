@smoke
@mvl
@dashboard_boxes
Feature: Dashboard Boxes

  @ipa
  @CU-35670
  Scenario: Verify UI of White Papers & Special Reports See All overlay
    * I am logged in
    * "#1 of White Papers And Special Reports Box > Title" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button" should be visible
    # Click "See All" button within "WHITE PAPERS & SPECIAL REPORTS" box
    * I click "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button"
    # Verify that "White Papers" popup is displaye
    * "White Papers Popup" should be visible
    # Verify that following elements within opened popup:
    * Text of "White Papers Popup > Title" should be "White Papers & Special Reports" ignoring case ignoring whitespaces
    * "White Papers Popup > Search Input" should be visible
    * "White Papers Popup > Search Button" should be visible
    * "White Papers Popup > X Close Button" should be visible
    * "White Papers Popup > Close Button" should be visible
    * Count of "White Papers Popup > Links" should be equal to "22"
    * I should see the following lines in "White Papers Popup > Links":
      | Top Tax Law Developments for April–June 2022                                                               |
      | Fierce opposition to SEC's sweeping climate regulations                                                    |
      | Disclosure requirements: a guide to SEC's climate risk proposal                                            |
      | WilmerHale: bipartisan and bicameral comprehensive privacy legislation                                     |
      | Azish Filabi. J.D. M.A.: ESG expert examines elusive meaning of ‘materiality’ in an ESG context            |
      | State Taxation of Cryptocurrency                                                                           |
      | U.S. Supreme Court to hear health law cases soon, and here is a preview                                    |
      | The COVID-19 impact on attorneys: lessons learned and best practices                                       |
      | Will the U.S. Supreme Court take up FTC enforcement again this term?                                       |
      | Supreme Court to weigh in on copyright registration errors; mulls pending petitions in IP cases            |
      | Supreme Court preview: cases and pending petitions on the L&E radar                                        |
      | Jackson Lewis: attorneys examine the socially conscious employer’s DEI data dilemma                        |
      | 'No-hire' provision in commercial contract between two businesses is unenforceable in Pennsylvania         |
      | Developing a hybrid/remote work policy as worksites reopen                                                 |
      | What happened? A post-mortem on labor’s defeat at the Battle of Bessemer                                   |
      | Context of Bessemer’s loss bodes ill for organized labor                                                   |
      | A Challenge to Growing Union Density: Expanding employment regulation diminishes labor’s value proposition |
      | The Zinus Mattress and Product Liability Litigation                                                        |
      | Ogletree Deakins Practical NLRB Advisor: New administration—Changing labor policies                        |
      | President Signs American Rescue Plan Act to aid Americans, Boost Economy                                   |
      | McDermott Will & Emery: COVID-19 Global Guide for Business                                                 |
      | Contract Negotiation Best Practices, Do’s and Don’ts                                                       |
    * "White Papers Popup > Links" urls should contain the following lines:
      | business.cch.com/AllContentPageWhitePapers/Tax_devs_apr_jun_22.pdf                          |
      | business.cch.com/AllContentPageWhitePapers/Securities_climate_battle_emerg.pdf              |
      | business.cch.com/AllContentPageWhitePapers/Securities_climate_risk_prop.pdf                 |
      | business.cch.com/AllContentPageWhitePapers/Securities_compr_priv_leg.pdf                    |
      | business.cch.com/AllContentPageWhitePapers/Securities_Filabi_materiality.pdf                |
      | business.cch.com/AllContentPageWhitePapers/Tax_State_tax_crypto.pdf                         |
      | business.cch.com/AllContentPageWhitePapers/Health_SC_cases.pdf                              |
      | business.cch.com/AllContentPageWhitePapers/All_Content_attorneys_covid.pdf                  |
      | business.cch.com/AllContentPageWhitePapers/Antitrust_SC_FTC.pdf                             |
      | business.cch.com/AllContentPageWhitePapers/IP_SC_cases.pdf                                  |
      | business.cch.com/AllContentPageWhitePapers/L&E_SC_cases.pdf                                 |
      | business.cch.com/AllContentPageWhitePapers/L&E_JackLew_DEI_data_dilemma.pdf                 |
      | business.cch.com/AllContentPageWhitePapers/L&E_no_hire_provision.pdf                        |
      | business.cch.com/AllContentPageWhitePapers/L&E_Hybrid_remote_work_policy.pdf                |
      | business.cch.com/AllContentPageWhitePapers/L&E_Battle_of_Bessemer.pdf                       |
      | business.cch.com/AllContentPageWhitePapers/L&E_Bessemer_loss_orglbr.pdf                     |
      | business.cch.com/AllContentPageWhitePapers/L&E_growing_union_density.pdf                    |
      | business.cch.com/AllContentPageWhitePapers/PL_zinus_mattress_litigation.pdf                 |
      | business.cch.com/AllContentPageWhitePapers/L&E_New_admin_labor_policies.pdf                 |
      | business.cch.com/AllContentPageWhitePapers/All_contentareas_Am_rescplan_act.pdf             |
      | business.cch.com/AllContentPageWhitePapers/L&E_COVID_19_Global_Guide_for_Bus.pdf            |
      | business.cch.com/AllContentPageWhitePapers/GovernmentContracts-Negotiations-DosandDonts.pdf |
    # Click "Close" button within "White Papers" popup
    * I click "White Papers Popup > Close Button"
    * "White Papers Popup" should not be visible
    # Open "See All" popup of 1st "White Papers And Special Reports Box"
    * I click "#1 of White Papers And Special Reports Box > See All Button"
    * "White Papers Popup" should be visible
    # Close "White Papers" popup by click on "Close" button
    * I click "White Papers Popup > X Close Button"
    * "White Papers Popup" should not be visible

  @ipa
  @CU-35674
  Scenario Outline: Verify Search of White Papers & Special Reports See All overlay
    * I am logged in
    * "#1 of White Papers And Special Reports Box > Title" should be visible
    * "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button" should be visible
    # Click "See All" button within "WHITE PAPERS & SPECIAL REPORTS" box
    * I click "#WHITE PAPERS & SPECIAL REPORTS in White Papers And Special Reports Box > See All Button"
    * "White Papers Popup" should be visible
    * Text of "White Papers Popup > Title" should be "White Papers & Special Reports" ignoring case ignoring whitespaces
    * "White Papers Popup > Search Input" should be visible
    * "White Papers Popup > Search Button" should be visible
    # Type <term> in "Search Input" within "White Papers Popup"
    * I type "<term>" in "White Papers Popup > Search Input"
    # Click "Search" button
    * I click "White Papers Popup > Search Button"
    # Verify that <results> are displayed
    * Count of "White Papers Popup > Links" should be equal to "<result>"
    # Verify that each result contains <term>
    * Each element of "White Papers Popup > Highlights Links" should contain "<term>" ignoring case

    Examples:
      | term     | result |
      | COVID-19 | 2      |

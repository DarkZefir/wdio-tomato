@smoke
@mvl
@dashboard_boxes
Feature: Dashboard Boxes

  @CU-42957
  Scenario Outline: Verify UI elements of VITALLAW AGREEMENT & CLAUSE BUILDER container #1
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * Text of "Lawgood Box > Title" should be "VITALLAW™ AGREEMENT & CLAUSE BUILDER"
    * Text of "Lawgood Box > Subtitle" should be "Powered by Lawgood"
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * Text of "Lawgood Box > Select Dropdown > #1 of Items" should be "Agreements" ignoring case
    * Text of "Lawgood Box > Select Dropdown > #2 of Items" should be "Clauses" ignoring case
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality Agreements |
      | Employment Agreements      |
      | Service Agreements         |
    * I click "Lawgood Box > Select Dropdown"
    * I click "Lawgood Box > Select Dropdown > #Clauses in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality                |
      | Covenants                      |
      | Dispute Resolution             |
      | Force Majeure                  |
      | Further Assurances             |
      | Indemnification                |
      | Intellectual Property          |
      | Internet                       |
      | Liability                      |
      | Limited Liability Companies    |
      | Miscellaneous                  |
      | Payment                        |
      | Privacy                        |
      | Remedies                       |
      | Representations and Warranties |
      | Subcontracting                 |
      | Term + Termination             |

    Examples:
      | Practice Area          |
      | Labor & Employment Law |
      | Human Resources        |

  @CU-42958
  Scenario Outline: Verify UI elements of VITALLAW AGREEMENT & CLAUSE BUILDER container #2
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * Text of "Lawgood Box > Title" should be "VITALLAW™ AGREEMENT & CLAUSE BUILDER"
    * Text of "Lawgood Box > Subtitle" should be "Powered by Lawgood"
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * Text of "Lawgood Box > Select Dropdown > #1 of Items" should be "Agreements" ignoring case
    * Text of "Lawgood Box > Select Dropdown > #2 of Items" should be "Clauses" ignoring case
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Assignment Agreements      |
      | Cease and Desist Letters   |
      | Confidentiality Agreements |
      | Licensing Agreements       |
      | Technology Agreements      |
    * I click "Lawgood Box > Select Dropdown"
    * I click "Lawgood Box > Select Dropdown > #Clauses in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality                |
      | Covenants                      |
      | Dispute Resolution             |
      | Force Majeure                  |
      | Further Assurances             |
      | Indemnification                |
      | Intellectual Property          |
      | Internet                       |
      | Liability                      |
      | Limited Liability Companies    |
      | Miscellaneous                  |
      | Payment                        |
      | Privacy                        |
      | Remedies                       |
      | Representations and Warranties |
      | Subcontracting                 |
      | Term + Termination             |

    Examples:
      | Practice Area         |
      | Intellectual Property |

  @CU-42959
  Scenario Outline: Verify UI elements of VITALLAW AGREEMENT & CLAUSE BUILDER container #3
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * Text of "Lawgood Box > Title" should be "VITALLAW™ AGREEMENT & CLAUSE BUILDER"
    * Text of "Lawgood Box > Subtitle" should be "Powered by Lawgood"
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * Text of "Lawgood Box > Select Dropdown > #1 of Items" should be "Agreements" ignoring case
    * Text of "Lawgood Box > Select Dropdown > #2 of Items" should be "Clauses" ignoring case
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Formation/Incorporation Documents |
      | M&A Agreements                    |
      | Start-Up Documents                |
    * I click "Lawgood Box > Select Dropdown"
    * I click "Lawgood Box > Select Dropdown > #Clauses in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality                |
      | Covenants                      |
      | Dispute Resolution             |
      | Force Majeure                  |
      | Further Assurances             |
      | Indemnification                |
      | Intellectual Property          |
      | Internet                       |
      | Liability                      |
      | Limited Liability Companies    |
      | Miscellaneous                  |
      | Payment                        |
      | Privacy                        |
      | Remedies                       |
      | Representations and Warranties |
      | Subcontracting                 |
      | Term + Termination             |

    Examples:
      | Practice Area                             |
      | Securities - Corporation Law & Governance |

  @CU-42960
  Scenario Outline: Verify UI elements of VITALLAW AGREEMENT & CLAUSE BUILDER container #4
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Title" should be visible
    * Text of "Lawgood Box > Title" should be "VITALLAW™ AGREEMENT & CLAUSE BUILDER"
    * Text of "Lawgood Box > Subtitle" should be "Powered by Lawgood"
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * Text of "Lawgood Box > Select Dropdown > #1 of Items" should be "Agreements" ignoring case
    * Text of "Lawgood Box > Select Dropdown > #2 of Items" should be "Clauses" ignoring case
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Service Agreements                |
      | Confidentiality Agreements        |
      | Technology Agreements             |
      | Employment Agreements             |
      | Intellectual Property Agreements  |
      | Formation/Incorporation Documents |
      | Start-Up Documents                |
      | Sale of Goods Agreements          |
      | M&A Agreements                    |
    * I click "Lawgood Box > Select Dropdown"
    * I click "Lawgood Box > Select Dropdown > #Clauses in Items"
    * I should see the following lines in "Lawgood Box > Links":
      | Confidentiality                |
      | Covenants                      |
      | Dispute Resolution             |
      | Force Majeure                  |
      | Further Assurances             |
      | Indemnification                |
      | Intellectual Property          |
      | Internet                       |
      | Liability                      |
      | Limited Liability Companies    |
      | Miscellaneous                  |
      | Payment                        |
      | Privacy                        |
      | Remedies                       |
      | Representations and Warranties |
      | Subcontracting                 |
      | Term + Termination             |

    Examples:
      | Practice Area   |
      | Practice of Law |

  @CU-42961
  Scenario Outline: VITALLAW AGREEMENT & CLAUSE BUILDER links are opened in a new tab
    * I am logged in
    * I am on "<Practice Area>" PA
    * "Lawgood Box > Select Dropdown" should be visible
    * I click "Lawgood Box > Select Dropdown"
    * "Lawgood Box > Select Dropdown > #1 of Items" should be visible
    * I click "Lawgood Box > Select Dropdown > #Agreements in Items"
    * I remember number of "Lawgood Box > Links" as "links"
    * I remember random integer below "{$links}" as "randomLink"
    * I remember number of browser tabs
    * I click "Lawgood Box > #{$randomLink} of Links"
    * I switch to new tab
    * Page URL should contain "lawgood"

    Examples:
      | Practice Area                             |
      | Labor & Employment Law                    |
      | Human Resources                           |
      | Intellectual Property                     |
      | Securities - Corporation Law & Governance |
      | Practice of Law                           |

@critical_path
@mvl
Feature: Contents Panel 1

  @CU-33504
  Scenario Outline: Verify that Search overlay is opened on click on magnifying glass icon on TOC widget
    * I am logged in
    # Open 'fin0109013e2c839106da' doc
    * I open "fin0109013e2c839106da" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the TOC node from examples
    * I remember text of "<TOCitem>" as "linkTitle"
    # Remember the title of the DA
    * I remember text of "DA Title" as "DATitle"
    # Hover over the TOC node from examples
    * I move mouse over "<TOCitem>"
    # Verify that Magnifying Glass is displayed
    * "<Icon>" should be visible
    # Click on the Magnifying Glass
    * I click "<Icon>"
    # Verify that Advanced Search overlay with 'SEARCH' overlay title and DA title is displayed
    * "Advanced Search Popup" should be visible
    * Text of "Advanced Search Popup > Search Title" should be "{$DATitle}" ignoring case
    * Text of "Advanced Search Popup > Title" should be "SEARCH"
    # Verify that 'X Close' button, 'Search Input', 'Search Within' placeholder are displayed
    * "Advanced Search Popup > X Close Button" should be visible
    * "Advanced Search Popup > Search Input" should be visible
    * Placeholder text for "Advanced Search Popup > Search Input" should be "Search Within ..."
    # Verify that 'Help Icon','Apply Thesaurus' checkbox, 'Cancel','Go','Clear All' buttons are displayed
    * "Advanced Search Popup > Help Icon" should be visible
    * "Advanced Search Popup > Apply Thesaurus" should be visible
    * "Advanced Search Popup > Cancel Button" should be visible
    * "Advanced Search Popup > Search Button" should be visible
    * "Advanced Search Popup > Clear All" should be visible
    # Verify that only one item is selected in TOC on the overlay
    * Count of "Advanced Search Popup > Selected Filters Box > Items" should be equal to "1"
    # Verify that the title of the selected item is equal to the TOC node from examples
    * Text of "Advanced Search Popup > Selected Filters Box > #1 of Items Title" should be "{$linkTitle}" ignoring case
    * "Advanced Search Popup > Selected Filters Box > #1 of Items Clear" should be visible

    Examples:
      | TOCitem                                                      | Icon                                                                            |
      | Contents Tab > #1 of Expanded Parent Node > Path Header      | Contents Tab > #1 of Expanded Parent Node > Path Header > Magnifying Glass      |
      | Contents Tab > #1 of Expanded First Child Node > Path Header | Contents Tab > #1 of Expanded First Child Node > Path Header > Magnifying Glass |
      | Contents Tab > Selected Link                                 | Contents Tab > Selected Link > Magnifying Glass                                 |
      | Contents Tab > #1 of Collapsed First Child Node > Header     | Contents Tab > #1 of Collapsed First Child Node > Header > Magnifying Glass     |
      | Contents Tab > #1 of Collapsed Parent Node > Header          | Contents Tab > #1 of Collapsed Parent Node > Header > Magnifying Glass          |

  @CU-33511
  Scenario Outline: Verify that user can run search from TOC via Search overlay
    * I am logged in
    # Open 'fin0109013e2c839106da' doc
    * I open "fin0109013e2c839106da" document
    * "Contents Tab > #1 of Collapsed Parent Node > Header" should be visible
    * "Contents Tab > Selected Link" should be visible
    # Remember the title of the TOC node from examples
    * I remember text of "<TOCitem>" as "linkTitle"
    # Remember the title of the DA
    * I remember text of "DA Title" as "DATitle"
    # Hover over the TOC node from examples
    * I move mouse over "<TOCitem>"
    # Verify that Magnifying Glass is displayed
    * "<Icon>" should be visible
    # Click on the Magnifying Glass
    * I click "<Icon>"
    * "Loading Indicator" should be visible
    * I wait until "Loading Indicator" is gone
    # Verify that Advanced Search overlay is displayed
    * "Advanced Search Popup" should be visible
    * "Advanced Search Popup" should be visible
    # Perform search for 'tax'
    * I type "tax" in "Advanced Search Popup > Search Input"
    * I click "Advanced Search Popup > Search Button"
    * "Advanced Search Popup" should not be visible
    * I wait until "Loading Indicator" is gone
    # Verify that the title of the search bar is equal to DA title that was memorized
    * Text of "Search Bar > Title" should be "{$DATitle}"
    # Verify that the filter pill under the search field contains the TOC node from examples
    * Text in collection of "Search Bar > PreSearch Filters > Filter Name" should contain "{$linkTitle}"
    # Verify that 'tax' is displayed in the search bar
    * Text of "Results Toolbar > Current Search Query" should be "“tax”"
    # Click on Info icon
    * I click "Results Toolbar > Search Information Icon"
    * "Search Information Popup" should be visible
    # Verify that 'Search Query' is 'tax'
    * Text of "Search Information Popup > Search Queries" should be "tax"
    # Verify that 'Pre-Search Selections' contains the TOC node from examples
    * Text of "Search Information Popup > Pre Search Selections Group" should contain "{$linkTitle}"

    Examples:
      | TOCitem                                                      | Icon                                                                            |
      | Contents Tab > #1 of Expanded Parent Node > Path Header      | Contents Tab > #1 of Expanded Parent Node > Path Header > Magnifying Glass      |
      | Contents Tab > #1 of Expanded First Child Node > Path Header | Contents Tab > #1 of Expanded First Child Node > Path Header > Magnifying Glass |
      | Contents Tab > Selected Link                                 | Contents Tab > Selected Link > Magnifying Glass                                 |
      | Contents Tab > #1 of Collapsed First Child Node > Header     | Contents Tab > #1 of Collapsed First Child Node > Header > Magnifying Glass     |
      | Contents Tab > #1 of Collapsed Parent Node > Header          | Contents Tab > #1 of Collapsed Parent Node > Header > Magnifying Glass          |


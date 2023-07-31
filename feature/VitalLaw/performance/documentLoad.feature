@performance
Feature: Document Load

  Scenario Outline: Document Load #<n>
    * I am logged in
    * I am on "ALL CONTENT" PA
    * I type "irc0109013e2c83dc562e" in "Search Bar > Search Input"
    * I click "Search Bar > Search Button"
    * "#1 of Search Result Items" should be visible
    * I click "#1 of Search Result Items"

    * I start "Read Page Load From Search" measurement
    * "Document Frame > Document Content" should be visible
    * I stop "Read Page Load From Search" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

  Scenario Outline: Dashboard Document Load Document opening from Dashboard #<n>
    * I am logged in
    * I open base url with "#/home/Antitrust"
    * I wait until "Loading Indicator" is gone
    * "Content Box > #1 of Main Content Types > #1 of Content Types > See All" should be visible
    * I click "Content Box > #1 of Main Content Types > #1 of Content Types > See All"
    * "See All Popup" should be visible
    * "See All Popup > Customize Button" should be visible
    * "See All Popup > #1 of Navigation Letters" should be visible
    * "See All Popup > X Close Button" should be visible
    * "See All Popup > Close Button" should be visible
    * "See All Popup > #1 of Links" should be visible
    * I start "Dashboard Document Load" measurement
    * I click "See All Popup > #1 of Links"
    * "Document Frame > Document Content" should be visible
    * "DA Title" should be visible
    * "Document Frame > Title" should be visible
    * I stop "Dashboard Document Load" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

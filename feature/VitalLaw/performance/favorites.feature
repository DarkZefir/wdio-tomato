@performance
Feature: Favorites

  Scenario Outline: Add To Favorites Read perform add to favorites operation from Read view #<n>
    * I am logged in
    * I open "irc0109013e2c83dc562e" document
    * "Document Frame > Document Content" should be visible

    * I start "Add To Favorites Read" measurement
    * I click "Favorite Button"
    * "Favorite Button Checked" should be visible
    * I stop "Add To Favorites Read" measurement

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |

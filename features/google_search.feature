Feature: Google search

  Scenario: Search Google for Whirlpool
    Given I am on Google search page
    When I search for "whirlpool"
    Then I should see "Whirlpool Broadband News" in the search results

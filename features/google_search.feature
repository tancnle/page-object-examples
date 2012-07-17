Feature: Google search

  Scenario: Search google for LCN technologies
    Given I am on Google search page
    When I search for "LCN technologies"
    Then I should see "www.lcntechnologies.com.au" in the search resutls

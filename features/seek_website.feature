Feature: Seek search

  @wip
  Scenario: Search Seek for jobs
    Given I am on Seek home page
    When I search with the following criteria:
      | name               | value                                  |
      | classification     | Information & Communication Technology |
      | sub_classification | Testing & Quality Assurance            |
      | location           | Melbourne                              |
    Then I should see "Test Analyst" role in the search results

Feature: Residential property search

  Scenario: Search residential properties
    Given I am on realestate home page
    When I search properties with the following criteria:
      | location      | footscray |
      | property_type | All       |
      | min_beds      | Any       |
      | min_price     | Any       |
      | max_price     | Any       |
    Then I should see some relevant properties

Feature: treasury.gov

  Background:
    Given I am on the "Calculate Savings Bond" page

  Scenario: Calculator exists
    Then I see the "Savings Bond Calculator" "section"

  Scenario: Value as of exists
    Then I see the "Value as of" "field"

    Scenario: Value default value
      Then the default value should be "current month/current year"

  Scenario: Series exists
    Then I see the "Series" "list"

    Scenario: Series list
      Then the options are "EE Bonds. I Bonds. E Bonds. Savings Notes"

    Scenario: Series default value
      Then the default value should be "EE bonds"

  Scenario: Update button exists
    Then I see the "Update" "button"

  Scenario: Denomination exists
    Then I see the "Denomination" "list"

    Scenario: Denomination list
      Then the options are "$10. $25. $50. $75. $100. $200. $500. $1,000. $5,000. $10,000"

    Scenario: Denomination default value
      Then the default value should be "$50"

  Scenario: Bond Serial Number exists
    Then I see the "Bond Serial Number" "field"

  Scenario: Issue date exists
    Then I see the "Issue Date" "field"

  Scenario: Calculate button exists
    Then I see the "calculate" "button"

  Scenario: How to save your inventory exists
    Then I see the "how to save your inventory" "link"

  Scenario: Help image exists
    Then I see the "help" "image"


  Scenario Outline:Failing minimum denomination
    When I have selected "<bond>"
    And I have selected "<bad_denom>" denomination
    And I have entered a "<good_date>" in issue date field
    And I click the "calculate" "button"
    Then I see the "error message" "section"
    Examples:
    | bond     |  bad_denom   | good_date |
    | EE Bonds |     $10      | 10/2000   |
    | I Bonds  |     $10      | 10/2005   |


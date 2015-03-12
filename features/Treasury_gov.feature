Feature: treasury.gov

  Background:
    Given I am on the "Calculate Savings Bond" page

  Scenario: Calculator exists
    Then I see the "Savings Bond Calculator" "section"

  Scenario: Value as of exists
    Then I see the "Value as of" "field"

  Scenario: Series exists
    Then I see the "Series" "list"

  Scenario: Update button exists
    Then I see the "Update" "button"

  Scenario: Denomination exists
    Then I see the "Denomination" "list"

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


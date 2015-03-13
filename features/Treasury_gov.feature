Feature: treasury.gov

  Background:
    Given I am on the "Savings Bond" page

################# sections exist---------------------------------------------------------------------

  Scenario: Calculator exists
    Then I see "Savings Bond Calculator"

  Scenario: Value as of field exists
    Then I see "Value As Of"

  Scenario: Series list exists
    Then I see "Series List"

  Scenario: Update button exists
    Then I see "Update Button"

  Scenario: Denomination list exists
    Then I see "Denomination List"

  Scenario: Bond Serial Number exists
    Then I see "Bond Serial Number"

  Scenario: Issue date exists
    Then I see "Issue Date"

  Scenario: Calculate button exists
    Then I see "Calculate Button"

  Scenario: How to save your inventory button exists
    Then I see "How To Save Your Inventory"

  Scenario: Help image exists
    Then I see "Help Image"

############### default values------------------------------------------------------------------

  Scenario: Value default value
    Then the "default date" should be "3/2015"


  Scenario: Series default value
    Then the "default bond" should be "EE"


  Scenario: Denomination default value
    Then the "default amount" should be "$50"

############# options available-----------------------------------------------------------------

  Scenario: Denomination list options
    Then the "denomination options" should be "$10, $25, $50, $75, $100, $200, $500, $1000, $5000, $10000"

  Scenario: Series list options
    Then the "bond options" should be "EE Bonds, I Bonds, E Bonds, Savings Notes"


############# calculating-----------------------------------------------------------------------
  Scenario Outline:Failing minimum denomination
    When I have selected "<bond>"
    And I have selected "<bad_denom>" denomination
    And I have entered a "<good_date>" in issue date field
    And I click the "calculate" "button"
    Then I don't see the "results" "section"
    Examples:
    | bond     |  bad_denom   | good_date |
    | EE Bonds |     $10      | 10/2000   |
    | I Bonds  |     $10      | 10/2005   |


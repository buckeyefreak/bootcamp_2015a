Feature: treasury.gov

  Background:
    Given I am on the "Savings Bond" page

################# sections exist---------------------------------------------------------------------

  Scenario: Calculator exists
    Then I "see" "Savings Bond Calculator"

  Scenario: Value as of field exists
    Then I "see" "Value As Of"

  Scenario: Series list exists
    Then I "see" "Series List"

  Scenario: Update button exists
    Then I "see" "Update Button"

  Scenario: Denomination list exists
    Then I "see" "Denomination List"

  Scenario: Bond Serial Number exists
    Then I "see" "Bond Serial Number"

  Scenario: Issue date exists
    Then I "see" "Issue Date"

  Scenario: Calculate button exists
    Then I "see" "Calculate Button"

  Scenario: How to save your inventory button exists
    Then I "see" "How To Save Your Inventory"

  Scenario: Help image exists
    Then I "see" "Help Image"

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
  Scenario Outline: Happy path all selections
    When I select the "<bond>" bond
    And I select amount of "<denomination>"
    And I enter "<date>"
    And I click "calculate"
    #combine all previous steps into one
    Then I "see" "results section"

  Examples:
    | bond | denomination | date    |
    | EE   | $50          | 01/1980 |
    | I    | $50          | 05/1999 |
    | I    | $50          | 01/2008 |
    | E    | $10          | 05/1952 |
    | E    | $10          | 06/1980 |
    | SN   | $25          | 05/1967 |
    | SN   | $25          | 10/1970 |

  Scenario Outline: SN Denominations
    When I select the "<bond>" bond
    And I select amount of "<denomination>"
    And I enter "<date>"
    And I click "calculate"
    Then I "see" "results section"

  Examples:
    | bond | denomination | date    |
    | SN   | $25          | 10/1970 |
    #| SN   | $50          | 10/1970 |
    #| SN   | $75          | 10/1970 |
    #| SN   | $100         | 10/1970 |

  ########## failures------------------------------------------------------------------------------
  Scenario Outline: SN Denominations fail
    When I select the "<bond>" bond
    And I select amount of "<denomination>"
    And I enter "<date>"
    And I click "calculate"
    Then I "do not see" "results section"

  Examples:
    | bond | denomination | date    |
    | SN   | $10          | 10/1970 |
    | SN   | $200         | 10/1970 |
    | SN   | $500         | 10/1970 |
    | SN   | $1000        | 10/1970 |
    | SN   | $5000        | 10/1970 |
    | SN   | $10000       | 10/1970 |



  Scenario Outline:Failing minimum denomination
    When I have selected "<bond>"
    And I have selected "<denomination>" denomination
    And I have entered a "<date>" in issue date field
    And I click "calculate"
    Then I "do not see" "results section"

  Examples:
    | bond | denomination | date    |
    | EE   | $10          | 10/2000 |
    | I    | $10          | 10/2005 |



  Scenario Outline: Fail outside date ranges
      When I select the "<bond>" bond
      And I select amount of "<denomination>"
      And I enter "<date>"
      And I click "calculate"
      Then I "do not see" "results section"

  Examples:
    | bond | denomination | date    |
    | EE   | $50          | 12/1979 |
    | E    | $50          | 04/1952 |
    | E    | $50          | 07/1980 |
    | I    | $50          | 04/1999 |
    | I    | $50          | 02/2008 |
    | SN   | $50          | 04/1967 |
    | SN   | $50          | 11/1970 |

Feature: Execute Test Functionality for API Specs

  Scenario: Verify "Execute Test" button visibility for Postman API Spec
    Given the user is on the Postman API Spec page
    When the page loads completely
    Then the "Execute Test" button should be visible
    And the "Execute Test" button should be clickable

  Scenario: Confirm "Execute Test" button presence for Artillery API Spec
    Given the user is on the Artillery API Spec page
    When the page loads completely
    Then the "Execute Test" button should be visible
    And the "Execute Test" button should be clickable

  Scenario Outline: Check "Execute Test" button availability for other API Specs
    Given the user is on the <API_Spec> page
    When the page loads completely
    Then the "Execute Test" button should be visible
    And the "Execute Test" button should be clickable

    Examples:
      | API_Spec |
      | Swagger  |
      | OpenAPI  |

  Scenario: Verify "Execute Test" button action for Postman API Spec
    Given the user is on the Postman API Spec page
    When the user clicks the "Execute Test" button
    Then the test execution process should initiate
    And the user should see a loading indicator

  Scenario: Confirm "Execute Test" button action for Artillery API Spec
    Given the user is on the Artillery API Spec page
    When the user clicks the "Execute Test" button
    Then the test execution process should initiate
    And the user should see a loading indicator

  Scenario: Check "Execute Test" button state during test execution
    Given the user is on any API Spec page
    When the user clicks the "Execute Test" button
    Then the button should change to a disabled state
    And the button should show a progress indicator

  Scenario: Verify test execution completion behavior
    Given the user has initiated a test execution
    When the test execution completes
    Then the user should be notified of the test completion
    And the test results should be displayed on the page

  Scenario: Test error handling during test execution
    Given the user is on any API Spec page
    And a network error is simulated
    When the user clicks the "Execute Test" button
    Then an appropriate error message should be displayed
    And the system should handle the error gracefully

  Scenario: Check keyboard accessibility of "Execute Test" button
    Given the user is on any API Spec page
    When the user navigates to the "Execute Test" button using the Tab key
    Then the button should receive keyboard focus
    When the user presses the Enter key
    Then the test execution should initiate

  Scenario: Verify consistent UI design of "Execute Test" button across API Specs
    Given the user navigates through different API Spec pages
    When comparing the "Execute Test" button on each page
    Then the button should have a consistent design and placement

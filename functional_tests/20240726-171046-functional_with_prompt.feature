Feature: Execute Test Functionality for Postman API Spec

  Scenario: Display "Execute Test" button for Postman API Spec
    Given the user is on the Postman API Spec page
    When the page loads completely
    Then the "Execute Test" button should be visible
    And the "Execute Test" button should be clickable

  Scenario: Initiate test execution for Postman API Spec
    Given the user is on the Postman API Spec page
    When the user clicks the "Execute Test" button
    Then the test execution should start
    And a progress indicator should be displayed

  Scenario: Display test execution results for Postman API Spec
    Given the user has initiated a test execution for Postman API Spec
    When the test execution completes
    Then the test results should be displayed in a readable format
    And the results should show the number of passed tests
    And the results should show the number of failed tests

  Scenario: Verify "Execute Test" button state during execution
    Given the user is on the Postman API Spec page
    When the user clicks the "Execute Test" button
    Then the "Execute Test" button should be disabled
    And the button should display a "Running" state
    And the button should return to its original state after test completion

  Scenario: Cancel ongoing test execution
    Given a test execution is in progress for Postman API Spec
    When the user clicks the "Cancel" button
    Then the test execution should stop
    And the system should return to a ready state
    And the "Execute Test" button should be enabled

  Scenario: Handle error during test execution
    Given the user is on the Postman API Spec page with an invalid API endpoint
    When the user clicks the "Execute Test" button
    And the test execution fails
    Then an appropriate error message should be displayed
    And the system should not crash

  Scenario: Run multiple test executions sequentially
    Given the user is on the Postman API Spec page
    When the user clicks the "Execute Test" button
    And waits for the test execution to complete
    And clicks the "Execute Test" button again
    Then each test execution should start correctly
    And each execution should show accurate results

  Scenario: Verify system performance with large API specs
    Given the user is on a Postman API Spec page with a large spec
    When the user clicks the "Execute Test" button
    Then the system should remain responsive during execution
    And the test execution should complete within an acceptable time frame

  Scenario: Verify UI consistency across different API Specs
    Given the user has access to Postman and Artillery API Spec pages
    When the user navigates to the Postman API Spec page
    Then the "Execute Test" button should be visible and clickable
    When the user navigates to the Artillery API Spec page
    Then the "Execute Test" button should have the same placement and styling as on the Postman page

  Scenario: Verify tooltip for "Execute Test" button
    Given the user is on the Postman API Spec page
    When the user hovers over the "Execute Test" button
    Then a tooltip should appear with helpful information about the button's functionality
    And the tooltip should mention any prerequisites for running tests

Feature: Credit Card Information and Payment Management

  Scenario: Fetch credit card due date and balance for a valid credit card
    Given a valid credit card number "1234-5678-9012-3456"
    When the user requests credit card information via the API
    Then the API should return a 200 OK status code
    And the response should contain the following information:
      | due_date   | balance |
      | 2023-06-15 | 1000.00 |

  Scenario: Attempt to fetch information for an invalid credit card number
    Given an invalid credit card number "0000-0000-0000-0000"
    When the user requests credit card information via the API
    Then the API should return a 400 Bad Request status code
    And the response should contain an error message "Invalid credit card number"

  Scenario: Fetch information for a credit card with zero balance
    Given a valid credit card number "9876-5432-1098-7654" with zero balance
    When the user requests credit card information via the API
    Then the API should return a 200 OK status code
    And the response should contain the following information:
      | due_date   | balance |
      | 2023-06-30 | 0.00    |

  Scenario: Arrange a call for unpaid and overdue balance
    Given a credit card with number "2468-1357-8642-9753"
    And the card has an unpaid balance of 500.00
    And the due date has passed
    When the system checks the card status
    Then the API should initiate a call arrangement
    And the response should include a call_arranged flag set to true

  Scenario: No call arrangement for paid balance
    Given a credit card with number "1111-2222-3333-4444"
    And the card has a paid balance of 0.00
    When the system checks the card status
    Then the API should not initiate a call arrangement
    And the response should include a call_arranged flag set to false

  Scenario: No call arrangement for unpaid balance before due date
    Given a credit card with number "5555-6666-7777-8888"
    And the card has an unpaid balance of 750.00
    And the due date is in the future
    When the system checks the card status
    Then the API should not initiate a call arrangement
    And the response should include a call_arranged flag set to false

  Scenario: Update balance after full payment
    Given a credit card with number "1234-5678-9012-3456"
    And the card has an initial balance of 1000.00
    When a payment of 1000.00 is made via the API
    Then the API should return a 200 OK status code
    And the response should show an updated balance of 0.00

  Scenario: Update balance after partial payment
    Given a credit card with number "9876-5432-1098-7654"
    And the card has an initial balance of 500.00
    When a payment of 300.00 is made via the API
    Then the API should return a 200 OK status code
    And the response should show an updated balance of 200.00

  Scenario: Attempt to update balance with payment exceeding due amount
    Given a credit card with number "2468-1357-8642-9753"
    And the card has an initial balance of 750.00
    When a payment of 1000.00 is made via the API
    Then the API should return a 400 Bad Request status code
    And the response should contain an error message "Payment amount exceeds due balance"

  Scenario: Measure response time for fetching credit card information
    Given a valid credit card number "1111-2222-3333-4444"
    When the user requests credit card information via the API
    Then the API should return a 200 OK status code
    And the response time should be less than 2 seconds

  Scenario: Verify data encryption for credit card information
    Given a valid credit card number "5555-6666-7777-8888"
    When the user requests credit card information via the API
    Then the API should return a 200 OK status code
    And the response should be encrypted using HTTPS protocol

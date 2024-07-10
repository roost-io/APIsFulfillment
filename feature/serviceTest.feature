Feature: WiFi Troubleshooting for Fiber Internet Customers

  Background:
    Given the customer support representative has access to the service activation and configuration API
    And the customer support representative has access to the service test management API

  Scenario: Diagnose and resolve weak WiFi signal
    Given a customer with subscriber ID "SVTAL001" reports a weak WiFi signal
    When the support representative initiates a diagnostic test
    Then the service test API should return a test ID
    And the diagnostic result should indicate low WiFi signal strength
    When the support representative uses the configuration API to change the WiFi channel
    Then the configuration API should return a success response
    And the customer should report improved WiFi signal strength

  Scenario: Reset ONT device to resolve connectivity issues
    Given a customer with subscriber ID "SVTAL002" reports intermittent internet connectivity
    When the support representative initiates a diagnostic test
    Then the service test API should return a test ID
    And the diagnostic result should indicate ONT connectivity issues
    When the support representative uses the configuration API to reset the GPON ONT
    Then the configuration API should return a success response
    And the customer should report stable internet connectivity

  Scenario: Update WiFi password for improved security
    Given a customer with subscriber ID "SVTAL003" requests a WiFi password change
    When the support representative uses the configuration API to set a new WiFi password
    Then the configuration API should return a success response
    And the customer should be able to connect to the WiFi network with the new password

  Scenario: Diagnose and resolve WiFi interference issues
    Given a customer with subscriber ID "SVTAL004" reports slow WiFi speeds
    When the support representative initiates a diagnostic test
    Then the service test API should return a test ID
    And the diagnostic result should indicate WiFi interference on the current channel
    When the support representative uses the configuration API to change the WiFi channel to an less congested one
    Then the configuration API should return a success response
    And the customer should report improved WiFi speeds

  Scenario: Enable WiFi for a new customer
    Given a new customer with subscriber ID "SVTAL005" has just had their fiber service installed
    When the support representative uses the configuration API to enable WiFi
    Then the configuration API should return a success response
    And the customer should be able to see and connect to their new WiFi network

  Scenario: Troubleshoot and resolve a failed configuration change
    Given a customer with subscriber ID "SVTAL006" requests a WiFi configuration change
    When the support representative uses the configuration API to make the requested change
    And the configuration API returns an error response
    Then the support representative should initiate a diagnostic test
    And the service test API should return a test ID
    And the diagnostic result should provide details about the configuration failure
    When the support representative resolves the identified issue and retries the configuration change
    Then the configuration API should return a success response
    And the customer's WiFi should reflect the requested changes
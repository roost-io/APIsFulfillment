# Scenario 2: Trouble Ticket Creation with Service Test and Resolution
# API Chain:
# 
# Create a trouble ticket (POST /troubleTicket)
# Initiate a service test for the subscriber (POST /serviceTest)
# Receive service test result event (POST /listener/serviceTestResultEvent)
# Update the ticket with notes based on test results (PATCH /troubleTicket/{id})
# Resolve and close the ticket (PATCH /troubleTicket/{id})
# 
Feature: Trouble Ticket Creation with Service Test and Resolution

Scenario: Successful Trouble Ticket Resolution
  Given the user has a valid subscriber information
  When the user creates a trouble ticket with category "Internet Connectivity Issue"
  And initiates a service test for the subscriber
  And receives the service test result event
  And updates the ticket with notes based on the test results
  And resolves the issue and closes the ticket
  Then a trouble ticket should be created with the given details
  And a service test should be initiated for the subscriber
  And the service test result event should be received
  And the ticket should be updated with notes based on the test results
  And the ticket status should be "Resolved"

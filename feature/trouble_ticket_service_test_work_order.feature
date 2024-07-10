# Scenario 2: Trouble Ticket Creation with Service Test and Work Order
# API Chain:
# 
# Create a trouble ticket (POST /troubleTicket)
# Initiate a service test for the subscriber (POST /serviceTest)
# Create a work order based on the trouble ticket (POST /productOrder)
# Update the trouble ticket with the work order details (PATCH /troubleTicket/{id})

Feature: Trouble Ticket Creation with Service Test and Work Order

Scenario: Successful Trouble Ticket Creation with Service Test and Work Order
  Given the user has a valid address and subscriber information
  When the user creates a trouble ticket with category "Internet Connectivity Issue"
  And initiates a service test for the subscriber
  And the service test results indicate a network problem
  And a work order is created based on the trouble ticket
  And the trouble ticket is updated with the work order details
  Then a trouble ticket should be created with the given details
  And a service test should be initiated for the subscriber
  And the service test results should be recorded
  And a work order should be created based on the trouble ticket
  And the trouble ticket should be updated with the work order details

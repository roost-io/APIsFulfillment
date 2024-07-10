# Scenario 3: Bulk Service Availability Check and Order Placement
# API Chain:
# 
# Check service availability for each address (POST /availabilityCheck) - multiple calls
# Place orders for available services at each address (POST /productOrder) - multiple calls
# Create appointments for each order (POST /appointment) - multiple calls
# 
Feature: Bulk Service Availability Check and Order Placement

Scenario: Successful Bulk Service Availability Check and Order Placement
  Given a list of 5 addresses
  When the service availability is checked for each address
  And orders are placed for the available services at each address
  And appointments are created for each order
  Then the service availability should be checked for each address
  And orders should be placed for the available services at each address
  And appointments should be created for each order

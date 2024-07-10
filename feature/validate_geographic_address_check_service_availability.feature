# Scenario 3: Geographic Address Validation and Service Availability Check
# API Chain:
# 
# Validate the address using the Geographic Address Management API (GET /geographicAddress/{addressId})
# Retrieve the address complements (GET /addressComplements/{addressId})
# Check the service availability for the address (POST /availabilityCheck)

Feature: Geographic Address Validation and Service Availability Check

Scenario: Successful Geographic Address Validation and Service Availability Check
  Given the user has an address with ID 10000
  When the user validates the address using the Geographic Address Management API
  And retrieves the address complements
  And checks the service availability for the address
  Then the address should be validated successfully
  And the address complements should be retrieved
  And the service availability check should return the available services for the address

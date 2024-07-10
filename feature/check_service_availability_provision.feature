# Flow 5: Service Availability Check and Provisioning
# API Chain:
# 
# Check service availability for an address (POST /availabilityCheck)
# Create a product order for the available service (POST /productOrder)
# Provision the service configurations (POST /configuration)
#
Scenario: Service Availability Check and Provisioning
  Given the user has a valid address and subscriber information
  When the user checks the service availability for the address
  And the required service is available
  And the user places an order for the service
  And the order is completed successfully
  And the user provisions the service configurations
  Then the service availability check should return the available services
  And a product order should be created for the selected service
  And the service configurations should be provisioned successfully

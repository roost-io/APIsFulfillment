# Scenario 3: Service Availability Check, Order Placement, and Installation Appointment Booking
# API Chain:
# 
# Check service availability for an address (POST /availabilityCheck)
# Create a product order for the available service (POST /productOrder)
# Search for available installation appointment slots (POST /searchTimeSlot)
# Create an installation appointment with selected slot (POST /appointment)
# Confirm the appointment (POST /appointmentConfirmation)

Feature: Service Availability Check, Order Placement, and Installation Appointment Booking

Scenario: Successful Service Order and Installation Appointment
  Given the user has a valid address and subscriber information
  When the user checks the service availability for the address
  And the required service is available
  And the user places an order for the service
  And searches for available installation appointment slots
  And selects a suitable slot
  And creates an installation appointment with the selected slot
  And confirms the appointment
  Then the service availability check should return the available services
  And a product order should be created for the selected service
  And available installation appointment slots should be returned
  And an installation appointment should be created with the selected slot
  And the appointment confirmation should be successful

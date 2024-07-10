# Flow 1: Successful Appointment Booking and Order Placement
# API Chain:
# 
# Search for available time slots (POST /searchTimeSlot)
# Create an appointment with selected slot (POST /appointment)
# Create a product order with the appointment ID (POST /productOrder)
# Confirm the appointment (POST /appointmentConfirmation)

Scenario: Successful Appointment Booking and Order Placement
  Given the user has a valid address and subscriber information
  When the user searches for available appointment slots
  And selects a suitable slot
  And creates an appointment with the selected slot
  And places a product order with the appointment ID
  And confirms the appointment
  Then the appointment should be booked successfully
  And a product order should be created with the appointment ID
  And the appointment confirmation should be successful

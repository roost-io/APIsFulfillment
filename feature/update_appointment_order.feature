# Flow 2: Updating an Appointment and Order
# API Chain:
# 
# Update an existing appointment with a new slot (PATCH /appointment/{appointmentId})
# Update the associated order with new appointment details (PATCH /productOrder/{orderId})
#
Scenario: Updating an Appointment and Order
  Given an existing appointment with ID "APP001"
  And an associated order with ID "ORD001"
  When the user updates the appointment with a new time slot
  And updates the order with the new appointment details
  Then the appointment should be updated with the new slot
  And the order should reflect the updated appointment details

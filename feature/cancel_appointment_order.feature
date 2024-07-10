# Flow 3: Cancelling an Appointment and Order
# API Chain:
# 
# Cancel an appointment by ID (DELETE /appointment/{appointmentId})
# Cancel the associated order (POST /cancelProductOrder/{orderId})

Scenario: Cancelling an Appointment and Order
  Given an existing appointment with ID "APP002"
  And an associated order with ID "ORD002"
  When the user cancels the appointment
  And cancels the associated order
  Then the appointment should be cancelled
  And the order should be cancelled

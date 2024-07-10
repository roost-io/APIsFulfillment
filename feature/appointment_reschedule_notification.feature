# Scenario 1: Appointment Rescheduling and Notification
# API Chain:
# 
# Update an existing appointment with a new slot (PATCH /appointment/{appointmentId})
# Update the associated order with new appointment details (PATCH /productOrder/{orderId})
# Receive appointment update notification (POST /listener/communicationMessage)
#
Feature: Appointment Rescheduling and Notification

Scenario: Successful Appointment Rescheduling
  Given an existing appointment with ID "APP003"
  And an associated order with ID "ORD003"
  When the user updates the appointment with a new time slot
  And updates the order with the new appointment details
  Then the appointment should be updated with the new slot
  And the order should reflect the updated appointment details
  And a notification should be received confirming the appointment update

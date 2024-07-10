# Scenario 4: Trouble Ticket Escalation with Work Order and Status Updateo
# API Chain:
# 
# Escalate the trouble ticket (hypothetical Ticket Escalation API)
# Create a work order for the escalated trouble ticket (POST /productOrder)
# Update the trouble ticket status (PATCH /troubleTicket/{id})


Feature: Trouble Ticket Escalation with Work Order and Status Update

Scenario: Successful Trouble Ticket Escalation with Work Order and Status Update
  Given an existing trouble ticket with ID "TT001"
  And the trouble ticket is in "Open" status
  When the trouble ticket is escalated
  And a work order is created for the escalated trouble ticket
  And the trouble ticket status is updated to "In Progress"
  Then the trouble ticket should be escalated
  And a work order should be created for the escalated trouble ticket
  And the trouble ticket status should be updated to "In Progress"

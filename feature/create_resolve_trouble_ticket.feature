# Flow 4: Creating and Resolving a Trouble Ticket
# API Chain:
# 
# Create a trouble ticket (POST /troubleTicket)
# Update the ticket with notes and attachments (PATCH /troubleTicket/{id})
# Resolve and close the ticket (PATCH /troubleTicket/{id})

Scenario: Creating and Resolving a Trouble Ticket
  Given the user has a valid address and subscriber information
  When the user creates a trouble ticket with category "Network Issue"
  And adds notes and attachments to the ticket
  And the issue is resolved
  And the user closes the ticket
  Then a trouble ticket should be created with the given details
  And the ticket should have the added notes and attachments
  And the ticket status should be "Resolved"

# APIsFulfillment

Test URL: https://apitrg.vtal.com.br.

Appointment API:
- POST /searchTimeSlot - Search for available time slots for an appointment. Requires address details, subscriber info, order type, products etc. Returns available time slots.
- POST /appointment - Create an appointment. Requires selected time slot ID from searchTimeSlot response. Returns created appointment details.
- GET /appointment/{appointmentId} - Retrieve details of an appointment by ID. 
- PATCH /appointment/{appointmentId} - Update an existing appointment. Can update time slot, reason etc.
- DELETE /appointment/{appointmentId} - Cancel/Delete an appointment by ID.
- POST /appointmentConfirmation - Confirm an appointment. Requires appointment ID and subscriber ID.

Communication Management API:
- POST /listener/communicationMessage - Listener to receive communication messages about incidents, maintenance etc. Different examples show opening, updating and closing of incidents and maintenance events.

Geographic Address Management API:
- GET /geographicAddress - Autocomplete/search addresses by keywords. Returns matching addresses.
- GET /geographicAddress/{addressId} - Get details of an address by ID.
- GET /addressComplements/{addressId} - Get complement/unit details for an address ID.
- GET /complementTypes - Get the list of valid complement/unit types.
- GET /city/{stateAbbreviation} - Get list of cities in a state.
- GET /neighborhood/{stateAbbreviation}/{city} - Get neighborhoods in a city.
- GET /geographicLocation - Search addresses within a radius of given coordinates.

Product Ordering API:
- POST /productOrder - Create a new product order of different types - installation, removal, block, unblock etc. Requires customer, address, product details.
- PATCH /productOrder/{orderId} - Update an order to resolve issues. Can update appointment, customer contact.
- POST /cancelProductOrder/{orderId} - Cancel an order.
- POST listeners for order state change, creation and information required events.

Resource Pool Management API: 
- POST /availabilityCheck - Check service availability for an address and subscriber. Returns availability status, products available, max bandwidth etc.

Service Activation and Configuration API:
- POST /configuration - Provision configurations on the customer device - wifi settings, reset etc.
- POST listener for configuration result event.

Service Test Management API:
- POST /serviceTest - Initiate a diagnostic test for a subscriber. 
- POST listener for test result event.

Trouble Ticket Management API:
- POST /troubleTicket - Create a trouble ticket of type incident or technical request. Requires customer, address, category, description etc.
- GET /troubleTicket - Search trouble tickets in a date range. Can filter by type, category.
- GET /troubleTicket/{id} - Get a trouble ticket by ID.
- PATCH /troubleTicket/{id} - Update a trouble ticket. Can add notes, attachments.
- DELETE /troubleTicket/{id} - Delete a trouble ticket.
- POST listeners for ticket attribute change, state change and information required events.
- GET /category - Get the list of valid trouble ticket categories and subcategories.

Work Order Management API:
- POST listeners for work order state change and attribute change events.

Key relationships and flows:

1. Creating an appointment (Appointment API) would lead to creation of a product order (Product Ordering API). The appointment ID would be associated with the order.

2. When an order is created, it raises an order creation event which can be listened to by the client.

3. Updating an order to resolve issues (Product Ordering API) can change the appointment details which will reflect in appointment API. 

4. Cancelling an order (Product Ordering API) would lead to cancellation of the associated appointment (Appointment API).

5. On successful completion of an order, the Resource Pool Management API can be used to check the updated service availability details for the address.

6. The Service Activation API can be invoked after successful order completion to apply specific configurations on the customer's device.

7. Creating a trouble ticket (Trouble Ticket Management API) for an issue would link it to the related order and appointment.

8. The Work Order Management API provides events for any field work or activity executed against a product order.

9. The Communication Management API provides notifications for any network incidents or maintenance that may impact the services provisioned.

# ********RoostGPT********

# Test generated by RoostGPT for test vtal-product-order using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /listener/cancelProductOrderCreateEvent_post for http method type POST 
# RoostTestHash=410c81a448
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * configure headers = { 'Authorization': '#(authToken)' }

  Scenario: Successful cancellation of product order create event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "date": "2023-04-07T10:30:00Z",
          "customer": {
            "subscriberId": "123456789"
          },
          "order": {
            "id": "20230315000001",
            "correlationOrder": "ORD-001",
            "associatedDocument": "VTT001",
            "issue": {
              "code": "7001",
              "description": "Pendência Cancelamento por Duplicidade",
              "type": "CLIENTE",
              "observation": "Order cancelled due to duplication",
              "updateDate": "2023-04-07T10:35:00Z",
              "action": "fechar",
              "task": "Cancel order",
              "fieldActivity": "False",
              "reason": "Duplicate order"
            }
          },
          "type": "CANCELAMENTO",
          "code": "2",
          "description": "Ordem cancelada",
          "lostEquipment": "False"
        }
      }
      """
    When method POST
    Then status 204
    And match header Content-Type == 'application/json'

  Scenario: Missing required fields in request body
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "date": "2023-04-07T10:30:00Z"
        }
      }
      """
    When method POST
    Then status 400
    And match header Content-Type == 'application/json'
    And match response == { error: 'Bad Request', message: 'Missing required fields in request body' }

  Scenario: Unauthorized request
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "date": "2023-04-07T10:30:00Z",
          "customer": {
            "subscriberId": "123456789"
          },
          "order": {
            "id": "20230315000001",
            "associatedDocument": "VTT001"
          }
        }
      }
      """
    When method POST
    Then status 401
    And match header Content-Type == 'application/json'
    And match response == { error: 'Unauthorized', message: 'Invalid or missing authorization token' }

  Scenario: Server error
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "date": "2023-04-07T10:30:00Z",
          "customer": {
            "subscriberId": "123456789"
          },
          "order": {
            "id": "20230315000001",
            "associatedDocument": "VTT001"
          }
        }
      }
      """
    When method POST
    Then status 500
    And match header Content-Type == 'application/json'
    And match response == { error: 'Internal Server Error', message: 'An unexpected error occurred' }

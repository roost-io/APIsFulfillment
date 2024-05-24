# ********RoostGPT********

# Test generated by RoostGPT for test fflive using AI Type Open AI and AI Model gpt-4-turbo
# 
# Feature file generated for /listener/productOrderCreateEvent_post for http method type POST 
# RoostTestHash=9b45f7ab6a
# 
# 

# ********RoostGPT********
Feature: Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * header Authorization = 'Bearer ' + authToken

  Scenario Outline: Verify Product Order Create Event with valid input data
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    <body>
    """
    When method POST
    Then status 204
    And match response == '#null'

    Examples:
      | body                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "customer": { "subscriberId": "1234567890" }, "order": { "id": "20230315000001", "correlationOrder": "10", "associatedDocument": "VTT001", "issue": { "code": { "code": 7001 }, "description": { "description": "Pendência Cancelamento por Duplicidade" }, "type": "CLIENTE", "observation": "Observation details", "updateDate": "2021-06-06T20:23:29-03:00", "action": "abrir", "task": "Task details", "fieldActivity": "True", "reason": "Reason details" } } } } |

  Scenario: Verify Product Order Create Event with unauthorized access
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "id": "20230315000001", "associatedDocument": "VTT001", "correlationOrder": "10" } } }
    """
    And removeHeader 'Authorization'
    When method POST
    Then status 401

  Scenario: Verify Product Order Create Event with bad request
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    { "invalid": "data" }
    """
    When method POST
    Then status 400

  Scenario: Verify server error handling
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "id": "20230315000001", "associatedDocument": "VTT001", "correlationOrder": "10" } } }
    """
    When method POST
    Then status 500

  Scenario: Verify service unavailable error handling
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "id": "20230315000001", "associatedDocument": "VTT001", "correlationOrder": "10" } } }
    """
    When method POST
    Then status 503

  Scenario: Verify timeout error handling
    Given path '/listener/productOrderCreateEvent'
    And request 
    """
    { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "id": "20230315000001", "associatedDocument": "VTT001", "correlationOrder": "10" } } }
    """
    When method POST
    Then status 504

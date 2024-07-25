# ********RoostGPT********

# Test generated by RoostGPT for test apiFulfillment using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /listener/cancelProductOrderCreateEvent_post for http method type POST 
# RoostTestHash=7601d79448
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']

  Scenario Outline: Cancel Product Order Create Event By Client - Successful Operation
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = authToken
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "<associatedDocument>",
            "id": "<id>"
          }
        }
      }
      """
    When method POST
    Then status 204

    Examples:
      | read('listener_cancelProductOrderCreateEvent_post.csv') |

  Scenario: Cancel Product Order Create Event By Client - Invalid Request
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = authToken
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "InvalidDoc",
            "id": "InvalidId"
          }
        }
      }
      """
    When method POST
    Then status 400
    And match response == { error: "BadRequest" }

  Scenario: Cancel Product Order Create Event By Client - Unauthorized
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "VTT001",
            "id": "20230315000001"
          }
        }
      }
      """
    When method POST
    Then status 401
    And match response == { error: "Unauthorized" }

  Scenario: Cancel Product Order Create Event By Client - Server Error
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = authToken
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "VTT001",
            "id": "20230315000001"
          }
        }
      }
      """
    When method POST
    Then status 500
    And match response == { error: "ServerError" }

  Scenario: Cancel Product Order Create Event By Client - Service Unavailable
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = authToken
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "VTT001",
            "id": "20230315000001"
          }
        }
      }
      """
    When method POST
    Then status 503
    And match response == { error: "Unavailable" }

  Scenario: Cancel Product Order Create Event By Client - Timeout
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = authToken
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "VTT001",
            "id": "20230315000001"
          }
        }
      }
      """
    When method POST
    Then status 504
    And match response == { error: "Timeout" }

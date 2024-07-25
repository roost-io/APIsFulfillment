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
    * configure headers = { 'Authorization': '#(karate.properties["AUTH_TOKEN"])' }

  Scenario: Successful cancellation of product order create event
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
    When method post
    Then status 204

  Scenario: Invalid request body
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "invalid": "request"
      }
      """
    When method post
    Then status 400

  Scenario: Unauthorized request
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
    And configure headers = { 'Authorization': 'invalidToken' }
    When method post
    Then status 401

  Scenario: Server error
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
    When method post
    Then status 500

  Scenario: Service unavailable
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
    When method post
    Then status 503

  Scenario: Request timeout
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
    When method post
    Then status 504

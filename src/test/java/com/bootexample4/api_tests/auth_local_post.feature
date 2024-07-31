# ********RoostGPT********

# Test generated by RoostGPT for test swagger-xcally using AI Type Claude AI and AI Model claude-3-5-sonnet-20240620
# 
# Feature file generated for /auth/local_post for http method type POST 
# RoostTestHash=e8552a370b
# 
# 

# ********RoostGPT********
Feature: Authentication - Local Login

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase

  Scenario Outline: Create a new User token
    Given path '/auth/local'
    And request
      """
      {
        "name": "<name>",
        "password": "<password>"
      }
      """
    When method POST
    Then status 201
    And match response ==
      """
      {
        "id": "#number",
        "statusCall": "#string",
        "token": "#string"
      }
      """
    And match header Content-Type == 'application/json'

    Examples:
      | read('auth_local_post.csv') |

  Scenario: Attempt login with invalid credentials
    Given path '/auth/local'
    And request
      """
      {
        "name": "invalidUser",
        "password": "wrongPassword"
      }
      """
    When method POST
    Then status 401
    And match response ==
      """
      {
        "code": 401,
        "message": "Unauthorized"
      }
      """
    And match header Content-Type == 'application/json'

  Scenario: Attempt login with missing required fields
    Given path '/auth/local'
    And request
      """
      {
        "name": "testUser"
      }
      """
    When method POST
    Then status 400
    And match response contains
      """
      {
        "code": 400,
        "message": "#string"
      }
      """
    And match header Content-Type == 'application/json'

  Scenario: Simulate server error during login
    Given path '/auth/local'
    And request
      """
      {
        "name": "serverErrorUser",
        "password": "password"
      }
      """
    When method POST
    Then status 500
    And match response ==
      """
      {
        "code": 500,
        "message": "Internal Server Error"
      }
      """
    And match header Content-Type == 'application/json'

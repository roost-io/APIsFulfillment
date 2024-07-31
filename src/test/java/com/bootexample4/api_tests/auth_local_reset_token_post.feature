# ********RoostGPT********

# Test generated by RoostGPT for test swagger-xcally using AI Type Claude AI and AI Model claude-3-5-sonnet-20240620
# 
# Feature file generated for /auth/local/reset/{token}_post for http method type POST 
# RoostTestHash=6688bb3a38
# 
# 

# ********RoostGPT********
Feature: Reset user password

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase

  Scenario Outline: Reset password with valid token
    Given path '/auth/local/reset', '<token>'
    And request
      """
      {
        "password": "<password>"
      }
      """
    When method POST
    Then status 201
    And match response == ''

    Examples:
      | read('auth_local_reset_token_post.csv') |

  Scenario Outline: Reset password with invalid token
    Given path '/auth/local/reset', '<token>'
    And request
      """
      {
        "password": "<password>"
      }
      """
    When method POST
    Then status 500
    And match response contains { code: 500, message: '#string' }
    And match response.code == 500
    And match response.message == 'Internal Server Error'

    Examples:
      | token         | password     |
      | invalidToken1 | newPassword3 |
      | invalidToken2 | newPassword4 |

  Scenario: Reset password with missing password
    Given path '/auth/local/reset', 'validToken789'
    And request {}
    When method POST
    Then status 500
    And match response contains { code: 500, message: '#string' }
    And match response.code == 500
    And match response.message == 'Internal Server Error'

  Scenario: Reset password with invalid request body
    Given path '/auth/local/reset', 'validToken101112'
    And request
      """
      {
        "invalidField": "someValue"
      }
      """
    When method POST
    Then status 500
    And match response contains { code: 500, message: '#string' }
    And match response.code == 500
    And match response.message == 'Internal Server Error'

# ********RoostGPT********

# Test generated by RoostGPT for test APIs-Fulfillment using AI Type Open AI and AI Model gpt-4-turbo
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=6f5fd9fdba
# 
# 

# ********RoostGPT********
Feature: State Change Event By Client API Tests

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase

  Scenario Outline: Valid State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request <payload>
    And header Authorization = 'Bearer ' + karate.properties['AUTH_TOKEN']
    When method post
    Then status 204
    And match response == #null

    Examples:
      | payload                                                            |
      | read('examples/closing-notification.json')                         |
      | read('examples/cancel-notification.json')                          |
      | read('examples/ont-already-in-use.json')                           |
      | read('examples/closing-notification-ont-owner-vital-install.json') |

  Scenario: Unauthorized Access to State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request read('examples/closing-notification.json')
    When method post
    Then status 401

  Scenario: Bad Request for State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request {}
    And header Authorization = 'Bearer ' + karate.properties['AUTH_TOKEN']
    When method post
    Then status 400

  Scenario: Server Error for State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request read('examples/closing-notification.json')
    And header Authorization = 'Bearer ' + karate.properties['AUTH_TOKEN']
    When method post
    Then status 500

  Scenario: Service Unavailable for State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request read('examples/closing-notification.json')
    And header Authorization = 'Bearer ' + karate.properties['AUTH_TOKEN']
    When method post
    Then status 503

  Scenario: Timeout Error for State Change Event Notification
    Given path '/listener/productOrderStateChangeEvent'
    And request read('examples/closing-notification.json')
    And header Authorization = 'Bearer ' + karate.properties['AUTH_TOKEN']
    When method post
    Then status 504

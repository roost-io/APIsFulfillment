# ********RoostGPT********

# Test generated by RoostGPT for test fflive using AI Type Open AI and AI Model gpt-4-turbo
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=13e6a9adf7
# 
# 

# ********RoostGPT********
Feature: Product Order Management System

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * header Authorization = 'Bearer ' + authToken

  Scenario Outline: Validate successful creation of product order
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status 201
    And match response
      """
      <expectedResponse>
      """

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Validate BadRequest error for invalid product order
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status 400
    And match response
      """
      <expectedErrorResponse>
      """

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Validate Unauthorized error for no auth
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    And removeHeader 'Authorization'
    When method post
    Then status 401
    And match response
      """
      <expectedErrorResponse>
      """

    Examples:
      | read('productOrder_post.csv') |

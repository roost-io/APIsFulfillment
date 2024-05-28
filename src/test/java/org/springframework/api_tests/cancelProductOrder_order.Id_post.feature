# ********RoostGPT********

# Test generated by RoostGPT for test fflive using AI Type Open AI and AI Model gpt-4-turbo
# 
# Feature file generated for /cancelProductOrder/{order.Id}_post for http method type POST 
# RoostTestHash=284cdcff34
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order By Id

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * header Authorization = 'Bearer ' + authToken

  Scenario Outline: Cancel order with valid ID and request body
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    When method DELETE
    Then status 200
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel order with invalid ID
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    When method DELETE
    Then status 404
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel order with missing authorization token
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    And header Authorization = null
    When method DELETE
    Then status 401
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

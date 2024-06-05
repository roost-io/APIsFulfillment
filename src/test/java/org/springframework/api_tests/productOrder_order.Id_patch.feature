# ********RoostGPT********

# Test generated by RoostGPT for test vtal-product-order using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /productOrder/{order.Id}_patch for http method type PATCH 
# RoostTestHash=baabcd7d73
# 
# 

# ********RoostGPT********
Feature: Update Product Order By Id

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { 'Authorization': #('Bearer ' + karate.properties['AUTH_TOKEN']) }

  Scenario Outline: Patch Product Order By Id - <scenario>
    * def request = read(<request>)
    Given path '/productOrder/', request.order.correlationOrder
    And request request
    When method PATCH
    Then status <expectedStatus>
    And match response == <expectedResponse>

    Examples:
      | read('productOrder_order.Id_patch.csv') |
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
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']

  Scenario: Update Product Order By Id - Schedule pendency resolution
    * def requestBody =
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001",
          "appointment": {
            "hasSlot": true,
            "date": "2021-06-07T12:47:00",
            "mandatoryType": "Permitido",
            "workOrderId": ""
          },
          "issue": {
            "code": "7029",
            "observation": "Resolução de pendência de agendamento",
            "updateDate": "2021-12-09T15:20:00",
            "action": "fechar"
          }
        }
      }
      """
    Given path '/productOrder/20230315000001'
    And header Authorization = 'Bearer ' + authToken
    And request requestBody
    When method PATCH
    Then status 200
    And match response == { control: { type: 'S', code: '200', message: 'OK' } }

  Scenario: Update Product Order By Id - Closed house pendency resolution
    * def requestBody =
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001",
          "appointment": {
            "hasSlot": true,
            "date": "2021-06-07T12:47:00",
            "mandatoryType": "Permitido",
            "workOrderId": ""
          },
          "issue": {
            "code": "7016",
            "observation": "Reagendamento por ausência",
            "updateDate": "2021-12-09T15:20:00",
            "action": "fechar"
          }
        }
      }
      """
    Given path '/productOrder/20230315000001'
    And header Authorization = 'Bearer ' + authToken
    And request requestBody
    When method PATCH
    Then status 200
    And match response == { control: { type: 'S', code: '200', message: 'OK' } }

  Scenario: Update Product Order By Id - Work Contact pendency resolution
    * def requestBody =
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001",
          "issue": {
            "code": "7100",
            "observation": "Resolução de pendência de contato de obra",
            "updateDate": "2021-12-09T15:20:00",
            "action": "fechar"
          },
          "customer": {
            "workContact": {
              "name": "síndico Vtal",
              "email": "sindicovtal@vtal.com",
              "phone": "21999900000"
            }
          }
        }
      }
      """
    Given path '/productOrder/20230315000001'
    And header Authorization = 'Bearer ' + authToken
    And request requestBody
    When method PATCH
    Then status 200
    And match response == { control: { type: 'S', code: '200', message: 'OK' } }

  Scenario: Update Product Order By Id - Bad Request
    Given path '/productOrder/20230315000001'
    And header Authorization = 'Bearer ' + authToken
    And request {}
    When method PATCH
    Then status 400
    And match response == { control: { type: 'E', code: '400', message: 'Bad Request' } }

  Scenario: Update Product Order By Id - Unauthorized
    Given path '/productOrder/20230315000001'
    And request {}
    When method PATCH
    Then status 401
    And match response == { control: { type: 'E', code: '401', message: 'Unauthorized' } }

  Scenario: Update Product Order By Id - Forbidden
    Given path '/productOrder/20230315000001'
    And header Authorization = 'Bearer invalidToken'
    And request {}
    When method PATCH
    Then status 403
    And match response == { control: { type: 'E', code: '403', message: 'Forbidden - Scope Not Permitted' } }

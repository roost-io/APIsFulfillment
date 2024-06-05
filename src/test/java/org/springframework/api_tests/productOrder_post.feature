# ********RoostGPT********

# Test generated by RoostGPT for test vtal-product-order using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=13e6a9adf7
# 
# 

# ********RoostGPT********
Feature: Test /productOrder API Endpoint

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * configure headers = { 'Authorization': '#(authToken)' }

  Scenario Outline: Create a new order with valid request body
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "<correlationOrder>",
          "associatedDocument": "<associatedDocument>",
          "associatedDocumentDate": "<associatedDocumentDate>",
          "type": "<type>",
          "infraType": "<infraType>",
          "customer": {
            "name": "<name>",
            "subscriberId": "<subscriberId>",
            "businessUnity": "<businessUnity>",
            "fantasyName": "<fantasyName>",
            "phoneNumber": {
              "phoneNumbers": <phoneNumbers>
            },
            "workContact": {
              "name": "<workContactName>",
              "email": "<workContactEmail>",
              "phone": "<workContactPhone>"
            }
          },
          "appointment": {
            "hasSlot": <hasSlot>,
            "date": "<appointmentDate>",
            "mandatoryType": "<mandatoryType>",
            "workOrderId": "<workOrderId>"
          },
          "addresses": {
            "address": {
              "id": <addressId>,
              "inventoryId": "<inventoryId>",
              "reference": "<addressReference>",
              "complement": {
                "complements": [
                  {
                    "type": "<complementType>",
                    "value": "<complementValue>"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "<catalogId>",
                "action": "<productAction>"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status 201
    And match response.control.type == 'S'
    And match response.control.code == '201'
    And match response.control.message == 'Created'
    And match response.order.id == '#notnull'

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Create a new order with invalid request body
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "<correlationOrder>",
          "associatedDocument": "<associatedDocument>",
          "associatedDocumentDate": "<associatedDocumentDate>",
          "type": "<type>",
          "infraType": "<infraType>",
          "customer": {
            "name": "<name>",
            "subscriberId": "<subscriberId>",
            "businessUnity": "<businessUnity>",
            "fantasyName": "<fantasyName>",
            "phoneNumber": {
              "phoneNumbers": <phoneNumbers>
            },
            "workContact": {
              "name": "<workContactName>",
              "email": "<workContactEmail>",
              "phone": "<workContactPhone>"
            }
          },
          "appointment": {
            "hasSlot": <hasSlot>,
            "date": "<appointmentDate>",
            "mandatoryType": "<mandatoryType>",
            "workOrderId": "<workOrderId>"
          },
          "addresses": {
            "address": {
              "id": <addressId>,
              "inventoryId": "<inventoryId>",
              "reference": "<addressReference>",
              "complement": {
                "complements": [
                  {
                    "type": "<complementType>",
                    "value": "<complementValue>"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "<catalogId>",
                "action": "<productAction>"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status <expectedStatus>
    And match response.control.type == 'E'
    And match response.control.code == '<expectedCode>'
    And match response.control.message contains '<expectedMessage>'

    Examples:
      | read('productOrder_post.csv') |

  Scenario: Create a new order with unauthorized request
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001",
          "associatedDocumentDate": "2021-06-09T18:20:53-03:00",
          "type": "Instalacao",
          "infraType": "FTTH",
          "customer": {
            "name": "Sandbox V.tal",
            "subscriberId": "SVTAL001",
            "businessUnity": "varejo",
            "fantasyName": "InterHome Internet",
            "phoneNumber": {
              "phoneNumbers": ["000000000","",""]
            },
            "workContact": {
              "name": "sindico Vtal",
              "email": "sindicovtal@vtal.com",
              "phone": "21999900000"
            }
          },
          "appointment": {
            "hasSlot": true,
            "date": "2021-05-05T08:00:00",
            "mandatoryType": "Obrigatorio",
            "workOrderId": "SA-562403"
          },
          "addresses": {
            "address": {
              "id": 14393,
              "inventoryId": "1766156",
              "reference": "Do lado da padaria",
              "complement": {
                "complements": [
                  {
                    "type": "ES",
                    "value": "ARC201"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "BL_200MB",
                "action": "adicionar"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status 401
    And match response.control.type == 'E'
    And match response.control.code == '401'
    And match response.control.message == 'Unauthorized'

  Scenario: Create a new order with exceeded quota
    Given path '/productOrder'
    And request
      """
      {
        "order": {
          "correlationOrder": "10",
          "associatedDocument": "VTT001", 
          "associatedDocumentDate": "2021-06-09T18:20:53-03:00",
          "type": "Instalacao",
          "infraType": "FTTH",
          "customer": {
            "name": "Sandbox V.tal",
            "subscriberId": "SVTAL001",
            "businessUnity": "varejo",
            "fantasyName": "InterHome Internet",
            "phoneNumber": {
              "phoneNumbers": ["000000000","",""]
            },
            "workContact": {
              "name": "sindico Vtal",
              "email": "sindicovtal@vtal.com",
              "phone": "21999900000"
            }
          },
          "appointment": {
            "hasSlot": true,
            "date": "2021-05-05T08:00:00",
            "mandatoryType": "Obrigatorio",
            "workOrderId": "SA-562403"
          },
          "addresses": {
            "address": {
              "id": 14393,
              "inventoryId": "1766156",
              "reference": "Do lado da padaria",
              "complement": {
                "complements": [
                  {
                    "type": "ES",
                    "value": "ARC201"
                  }
                ]
              }
            }
          },
          "products": {
            "product": [
              {
                "catalogId": "BL_200MB",
                "action": "adicionar"
              }
            ]
          }
        }
      }
      """
    When method POST
    Then status 429
    And match response.control.type == 'E'
    And match response.control.code == '429'
    And match response.control.message == 'Too Many Requests - Exceeded Quota'
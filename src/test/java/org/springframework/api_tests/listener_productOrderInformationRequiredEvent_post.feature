# ********RoostGPT********

# Test generated by RoostGPT for test vtal-product-order using AI Type Claude AI and AI Model claude-3-opus-20240229
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=e74b642c2e
# 
# 

# ********RoostGPT********
Feature: Product Order Information Required Event

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { 'Authorization': '#(karate.properties.AUTH_TOKEN)' }

  Scenario Outline: Product Order Information Required Event - <description>
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      {
        "notification": {
          "date": "<date>",
          "customer": {
            "subscriberId": "<subscriberId>"
          },
          "order": {
            "id": "<orderId>",
            "correlationOrder": "<correlationOrder>",
            "associatedDocument": "<associatedDocument>",
            "issue": {
              "code": "<issueCode>",
              "description": "<issueDescription>",
              "type": "<issueType>",
              "observation": "<observation>",
              "updateDate": "<updateDate>",
              "action": "<action>",
              "task": "<task>",
              "fieldActivity": "<fieldActivity>",
              "reason": "<reason>"
            },
            "type": "<type>",
            "code": "<code>",
            "description": "<description>",
            "lostEquipment": "<lostEquipment>",
            "resource": {
              "gponAccess": "<gponAccess>",
              "devices": {
                "device": [
                  {
                    "category": "<category>",
                    "type": "<deviceType>",
                    "description": "<deviceDescription>",
                    "state": "<state>",
                    "usageState": "<usageState>",
                    "startOperatingDate": "<startOperatingDate>",
                    "resourceCharacteristic": [
                      {
                        "name": "<name>",
                        "value": "<value>"
                      }
                    ]
                  }
                ]
              },
              "fiberPath": {
                "items": {
                  "item": [
                    {
                      "name": "<itemName>",
                      "value": "<itemValue>"
                    }
                  ]
                }
              }
            }
          }
        }
      }
      """
    When method POST
    Then status <expectedStatus>
    And match response == <expectedResponse>

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |

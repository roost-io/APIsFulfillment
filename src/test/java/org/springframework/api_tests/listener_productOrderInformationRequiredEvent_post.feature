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
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * configure headers = { 'Authorization': '#(karate.properties["AUTH_TOKEN"])' }

  Scenario Outline: Notify product order information required event with <scenario>
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
            }
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
                  "type": "<resourceType>",
                  "description": "<resourceDescription>",
                  "state": "<state>",
                  "usageState": "<usageState>",
                  "startOperatingDate": "<startOperatingDate>",
                  "resourceCharacteristic": [
                    {
                      "name": "<characteristicName>",
                      "value": "<characteristicValue>"
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
      """
    When method post
    Then status <expectedStatus>
    And match header Content-Type contains 'application/json'
    And match response == <expectedResponse>

    Examples:
      | scenario | date | subscriberId | orderId | correlationOrder | associatedDocument | issueCode | issueDescription | issueType | observation | updateDate | action | task | fieldActivity | reason | type | code | description | lostEquipment | gponAccess | category | resourceType | resourceDescription | state | usageState | startOperatingDate | characteristicName | characteristicValue | itemName | itemValue | expectedStatus | expectedResponse |
      | read('listener_productOrderInformationRequiredEvent_post.csv') |

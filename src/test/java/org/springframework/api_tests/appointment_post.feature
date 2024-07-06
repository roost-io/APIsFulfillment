# ********RoostGPT********

# Test generated by RoostGPT for test vtal-api using AI Type Open AI and AI Model gpt-4o-2024-05-13
# 
# Feature file generated for /appointment_post for http method type POST 
# RoostTestHash=b7eaf9bc25
# 
# 

# ********RoostGPT********
Feature: Appointment API Tests

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * header Authorization = 'Bearer ' + authToken

  Scenario Outline: Post Appointment with valid payload
    Given path '/appointment'
    And request """ { "appointment": { "slot": { "id": "<slotId>" }, "reason": "<reason>" } } """
    When method post
    Then status 201
    And match response.order.type == '#string'
    And match response.order.associatedDocument == '#string'
    And match response.order.addressChange.flag == '#boolean'
    And match response.customer.subscriberId == '#string'
    And match response.appointment.id == '#string'
    And match response.appointment.startDate == '#string'
    And match response.appointment.finishDate == '#string'
    And match response.appointment.priority.flag == '#boolean'
    And match response.appointment.priority.reason == '#string'
    And match response.address.id == '#number'
    And match response.products.product[0].type == '#string'
    And match response.control.type == '#string'
    And match response.control.code == '#number'
    And match response.control.message == '#string'

    Examples:
      | read('appointment_post.csv') |

  Scenario Outline: Post Appointment with missing slot id
    Given path '/appointment'
    And request """ { "appointment": { "slot": { }, "reason": "<reason>" } } """
    When method post
    Then status 400
    And match response.control.type == 'E'
    And match response.control.code == 400
    And match response.control.message == 'Bad Request'

    Examples:
      | reason                      |
      | Agendamento para Instalação |

  Scenario: Unauthorized request
    Given path '/appointment'
    And header Authorization = 'Bearer invalid_token'
    And request """ { "appointment": { "slot": { "id": "bff13821-73c3-42cc-9327-b05c7df5a67f" }, "reason": "Agendamento para Instalação" } } """
    When method post
    Then status 401
    And match response.control.type == 'E'
    And match response.control.code == 401
    And match response.control.message == 'Unauthorized'

  Scenario: Slot not found
    Given path '/appointment'
    And request """ { "appointment": { "slot": { "id": "invalid_slot_id" }, "reason": "Agendamento para Instalação" } } """
    When method post
    Then status 404
    And match response.control.type == 'E'
    And match response.control.code == 404
    And match response.control.message == 'Identificador do Slot não encontrado ou expirado'

  Scenario: Service Unavailable
    Given path '/appointment'
    And request """ { "appointment": { "slot": { "id": "bff13821-73c3-42cc-9327-b05c7df5a67f" }, "reason": "Agendamento para Instalação" } } """
    When method post
    Then status 503
    And match response.control.type == 'T'
    And match response.control.code == 503
    And match response.control.message == 'Service Unavailable'
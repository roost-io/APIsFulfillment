# ********RoostGPT********

# Test generated by RoostGPT for test api-testing-vtal using AI Type Open AI and AI Model gpt-4-turbo
# 
# ROOST_METHOD_HASH=26bd09ffd8
# ROOST_METHOD_SIG_HASH=15f5719eaf
# 
#  ########## Scenario ########## 
# 
# {
#   feature: 'Feature: Geographic Address Validation and Service Availability Check',
#   background: null,
#   rule: null,
#   scenario: {
#     title: 'Scenario: Successful Geographic Address Validation and Service Availability Check',
#     steps: 'Given the user has an address with ID "ADD001"\n' +
#       'When the user validates the address using the Geographic Address Management API\n' +
#       'And retrieves the address complements\n' +
#       'And checks the service availability for the address\n' +
#       'Then the address should be validated successfully\n' +
#       'And the address complements should be retrieved\n' +
#       'And the service availability check should return the available services for the address',
#     examples: ''
#   }
# }
# 

# ********RoostGPT********
Feature: Geographic Address Validation and Service Availability Check

  Background:
    * def geographicAddressManagement_v1_URL = karate.properties['GEOGRAPHICADDRESSMANAGEMENT_V1_URL'] || 'http://localhost:4010'
    * def geographicAddressManagement_v1_AUTH_TOKEN = karate.properties['GEOGRAPHICADDRESSMANAGEMENT_V1_AUTH_TOKEN'] || 'Bearer your_token_here'

  Scenario: Validate Geographic Address
    Given path '/geographicAddress/ADD001'
    And header Authorization = geographicAddressManagement_v1_AUTH_TOKEN
    And url geographicAddressManagement_v1_URL
    When method get
    Then status 200
    And match response.control.type == 'S'
    And match response.control.message == '#string'
    And match response.control.code == '#string'
    And match response.addresses == '#object'

  Scenario: Check Service Availability
    Given path '/addressComplements/ADD001'
    And header Authorization = geographicAddressManagement_v1_AUTH_TOKEN
    And url geographicAddressManagement_v1_URL
    When method get
    Then status 200
    And match response.control.type == 'S'
    And match response.control.message == '#string'
    And match response.control.code == '#string'
    And match response.complementList == '#object'

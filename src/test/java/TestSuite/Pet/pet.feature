Feature: Pet Module

  Background:
    Given url "https://petstore.swagger.io/v2"
    And print "--Connect petstore API--"

  Scenario: Add Pet to Store
    * def reqBody = {"id": 181011,"category": {"id": 181011, "name": "string"},"name":"doggie","photoUrls": ["string"],"tags": [{"id": 181011,"name": "string"}],"status": "available"}
    When url "https://petstore.swagger.io/v2/pet"
    When method post
    And request reqBody
    Then print response
    And status 200

    Scenario: Get Pet by ID
      When url "https://petstore.swagger.io/v2/pet/134340"
      When method get
      Then print response
      And status 200

    Scenario: Get Pet by Status
      When url "https://petstore.swagger.io/v2/pet/findByStatus"
      And params {status:available}
      When method get
      Then print response
      And status 200

    Scenario: Delete Pet
      When url "https://petstore.swagger.io/v2/pet/9223372036854296574"
      When method delete
      Then print response
      And status 200

    Scenario: Check Pet after Delete
      When url "https://petstore.swagger.io/v2/pet/9223372036854296574"
      When method get
      Then print response
      And status 404
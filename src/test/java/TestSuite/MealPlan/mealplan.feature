Feature: Test Meal Plan

  Background:
    * url 'https://api.spoonacular.com/mealplanner'
    * def apiKey = '6d2a264e6e96449b9863abc4b4d1f119'
    * def username = 'andiniwh'
    * def hash = '87d374389a4d027fbfdd2dcffa48bfef08008ee4'
    * def startDate = '2024-03-27'
#    * def password --> basic Auth
#    * grant_type --> OAuth 2.0
#    * client_id --> OAuth 2.0 / Bearer Token
#    * client_secret --> OAuth 2.0 / Bearer Token
#    * call read(classpath:example.json)

  # Code untuk Authorization
  # And header Authorization = 'bearer' + Token

  # Code basic Auth
  # And auth username, password

  Scenario: Test generate meal plan
    Given path 'generate'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response : ', response

  Scenario: Test Add to Meal Plan
    Given path username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request
    """
  {
  "date": 1711522021,
  "slot": 1,
  "position": 0,
  "type": "INGREDIENTS",
  "value": {
  "ingredients": [
  {
  "name": "1 banana"
  }
  ]
  }
  }
  """
    When method post
    Then status 200
    And match response.status == 'success'

    Scenario: Test Meal Plan by Week
      Given path username,'week',startDate
      And param apiKey = apiKey
      And param hash = hash
      When method get
      Then status 200
      And print 'Response: ', response

    Scenario: Delete from Meal Plan
      Given path username,'items','25627586'
      And param apiKey = apiKey
      And param hash = hash
      When method delete
      Then status 200
      And match response.status == 'success'
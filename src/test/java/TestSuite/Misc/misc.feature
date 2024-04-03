Feature:
  Background:
    * url 'https://api.spoonacular.com/food/'
    * def apiKey = '6d2a264e6e96449b9863abc4b4d1f119'
    * def username = 'andiniwh'
    * def hash = '87d374389a4d027fbfdd2dcffa48bfef08008ee4'
    # * call read(classpath:example.json)

  Scenario: Random Food Joke
    Given path 'jokes/random'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response: ',response

  Scenario: Detect Food in Text
    Given path 'detect'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param text = 'I like to eat delicious tacos and sushi'
    When method post
    Then status 200
    And print 'Response: ',response

  Scenario: Image Analysis URL
    Given path 'images/analyze'
    And param imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/c/cf/Salmon_Sushi.jpg'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response: ',response
Feature: User Profile

  Background:
    Given I am a registered user
    And I have uploaded an image
  
  Scenario: User data
    Given I am on the homepage
    When I click on my username
    Then I should see my full name 
    And I should see my location

  Scenario: User avatar
    Given I am on my page
    Then I should see my avatar

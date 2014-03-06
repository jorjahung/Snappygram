Feature: User Profile

  Background:
    Given there are images posted by a user
  
  Scenario: User data
    Given I am on the homepage
    When I click on a user's name
    Then I should see the user's full name 
    And I should see the user's location

  Scenario: User avatar
    Given I am on a user's page
    Then I should see the user's avatar
